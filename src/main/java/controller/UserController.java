package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.HomesUserDatabase;

import model.bean.User;
import model.bo.UserBO;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		switch (action) {
		case "LogOut": {
			try {
				LogOut(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "AddAccount": {
			try {
				AddAccount(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		case "Login": {
			Login(request, response);
			break;
		}
		case "ChangePassword": {
			try {
				ChangePassword(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		case "LogOut": {
			try {
				System.out.print("1");
				LogOut(request, response);
			} catch (ClassNotFoundException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}

	protected void Login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserBO userBo = new UserBO();

		if (userBo.isValidUser(username, password)) {
			try {
				User user = userBo.Login(username, password);
				if (user != null) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					System.out.print(user.getRole());
					if (user.getRole().equals("user")) {
						response.sendRedirect("./home.jsp");
					} else {
						response.sendRedirect("./admin/index.jsp");
					}
				} else {
					response.sendRedirect("login.jsp");
				}
			} catch (ClassNotFoundException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/login.jsp?error=0");
		}
	}

	protected void AddAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {
		String destination = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		UserBO accountBo = new UserBO();
		if (accountBo.isValidUser(username, password) && name != "") {
			accountBo.AddAccount(username, password, name);
			destination = "/login.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/AddAccount.jsp?error=0");
		}

	}

	protected void ChangePassword(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, ServletException, IOException {
		String destination = null;
		String username = request.getParameter("username");
		String current_password = request.getParameter("current_password");
		String confirm_password = request.getParameter("confirm_password");
		UserBO accountBo = new UserBO();
		if (current_password.equals(confirm_password)) {
			accountBo.ChangePassword(username, current_password);
			destination = "/Trangchu.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
		}
	}

	protected void LogOut(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, ServletException, IOException {
		HttpSession session = request.getSession();
			session.setAttribute("", null);
			session.invalidate();
			response.sendRedirect("./home.jsp");
		}

}
