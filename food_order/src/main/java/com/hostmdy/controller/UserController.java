package com.hostmdy.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import javax.sql.DataSource;

import com.hostmdy.model.User;
import com.hostmdy.model.UserDAO;

/**
 * Servlet implementation class UserController
 */
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name ="jdbc/yummy")
	private DataSource dataSource;
       
	private UserDAO userDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		userDAO = new UserDAO(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String mode = request.getParameter("mode");
		if(mode == null) {
			mode = "SIGN_UP";
		}
		switch (mode) {
		case "SIGN_UP":
			showSignupForm(request,response);
			break;
			
		case "CREATE":
			signupUser(request,response);
			break;
			
		case "CHANGEINFO":
			changeInfo(request,response);
			break;
			
		case "SAVE":
			saveInfo(request,response);
			break;

		default:
			showSignupForm(request,response);
			break;
		}
		
	}

	private void saveInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String location = request.getParameter("location");
		String address = request.getParameter("address");
		String payment = request.getParameter("payment");
		String card = request.getParameter("card");
		boolean success = userDAO.updateUser(new User(name, user.getId(), phone, location, address, payment, card));
		request.setAttribute("success", success);
		User customer = userDAO.getUserById(user.getId());
		session.setAttribute("user", customer);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit-info.jsp");
		dispatcher.forward(request, response);
	}

	private void changeInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		User customer = userDAO.getUserById(user.getId());
		session.setAttribute("user", customer);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit-info.jsp");
		dispatcher.forward(request, response);
	}

	private void signupUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm-password");
		String phone = request.getParameter("phone");
		if(password.equals(confirm)) {
			User newUser = new User(name, email, password, phone);
			boolean success = userDAO.createNewUser(newUser);
			
			if(success) {
				HttpSession session = request.getSession();
				User user = userDAO.getUserByEmail(email);
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(3600 * 5);
				response.sendRedirect("menu");
			}else {
				request.setAttribute("success", success);
				RequestDispatcher dispatcher = request.getRequestDispatcher("view/signup.jsp");
				dispatcher.forward(request, response);
			}
				
		}else {
			request.setAttribute("success", false);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/signup.jsp");
			dispatcher.forward(request, response);
		}

	}

	
	private void showSignupForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/signup.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
