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
import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.model.Order;
import com.hostmdy.model.OrderDAO;
import com.hostmdy.model.OrderItem;
import com.hostmdy.model.OrderItemDAO;
import com.hostmdy.model.User;
import com.hostmdy.model.UserDAO;

/**
 * Servlet implementation class OrderController
 */
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name ="jdbc/yummy")
	private DataSource dataSource;
	
	private OrderDAO orderDAO;
	private OrderItemDAO orderItemDAO;
	private UserDAO userDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		orderDAO = new OrderDAO(dataSource);
		orderItemDAO = new OrderItemDAO(dataSource);
		userDAO = new UserDAO(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String mode = request.getParameter("mode");
		if(mode == null) {
			mode = "ORDERHISTORY";
		}
		switch (mode) {
			//for customer
		case "ORDERHISTORY":
			showOrderHistoryList(request, response);
			break;
			
			// for Customer
		case "ORDERDETAIL":
			orderHistoryDetail(request, response);
			break;
			
			// for customer
		case "ORDERUP":
			createOrder(request,response);
			break;
			
			// for admin
		case "ORDERS":
			checkOrders(request, response);
			break;
			
			// for admin
		case "CHECK":
			check(request, response);
			break;
			
			// for admin
		case "ORDERCON":
			confirmOrder(request,response);
			break;

		default:
			showOrderHistoryList(request, response);
			break;
		}
		
	}

	// To check Order detail
	private void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long orderid = Long.parseLong(request.getParameter("orderid"));
		Order order = orderDAO.getOrderById(orderid);
		User customer = userDAO.getUserById(order.getCustomerid());
		List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderId(orderid);
		request.setAttribute("order", order);
		request.setAttribute("customer", customer);
		request.setAttribute("orderItems", orderItems);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/order-detail.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertUserInfo(HttpServletRequest request, HttpServletResponse response,User user,Long customerId) {
		String name = user.getName();
		String phone = request.getParameter("phone");
		String location = request.getParameter("location");
		String address = request.getParameter("address");
		String payment = request.getParameter("payment");
		String card = request.getParameter("card");
		boolean success = userDAO.updateUser(new User(name, customerId, phone, location, address, payment, card));
		if(!success) {
			System.out.println("fail to update user");
		}
	}

	// OrderUp success
	private void createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Long customerId = user.getId();
		insertUserInfo(request, response, user, customerId);
		Integer cost = Integer.parseInt(request.getParameter("total"));
		Boolean pickUp = (Boolean) session.getAttribute("pickup");
		String description = request.getParameter("description");
		if(description.isEmpty()) {
			description = "No Description";
		}
		boolean createdOrder = orderDAO.createOrder(new Order(customerId, cost, pickUp, description));
		boolean createdOrderItem = false;
		if(createdOrder) {
			@SuppressWarnings("unchecked")
			List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("cartList");
			Long orderId = orderDAO.getMaxId();
			if(orderId > 0) {
				for (OrderItem orderItem : orderItems) {
					createdOrderItem = orderItemDAO.createOrderItem(new OrderItem(orderId, orderItem.getMenuid(), orderItem.getTitle(),
							orderItem.getQuantity(), orderItem.getSubtotal(), orderItem.getImage()));
				}
			}
		}
		
		if(createdOrder && createdOrderItem) {
			session.setAttribute("info", null);
			session.setAttribute("cartList", null);
			request.setAttribute("orderup", "success");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/cart.jsp");
		dispatcher.forward(request, response);
	}

	// admin order confirm
	private void confirmOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Long orderid = Long.parseLong(request.getParameter("orderid"));
		orderDAO.orderConfirm(orderid);
		Integer no = (Integer) session.getAttribute("orderNo");
		session.setAttribute("orderNo",(no == 0)? no : no-1);
		checkOrders(request, response);
	}
	
	// admin check order list
	private void checkOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Order> orders = orderDAO.getAllOrder();
		List<Order> newOrders = orders.stream().filter(order -> order.getDate().equals(LocalDate.now())).toList();
		session.setAttribute("newOrders", newOrders);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/orders.jsp");
		dispatcher.forward(request, response);
	}
	
	// customer's order item history
	private void orderHistoryDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long orderid = Long.parseLong(request.getParameter("orderid"));
		Order order = orderDAO.getOrderById(orderid);
		List<OrderItem> orderItemList = orderItemDAO.getOrderItemsByOrderId(orderid);
		request.setAttribute("order", order);
		request.setAttribute("orderItemList", orderItemList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/history-detail.jsp");
		dispatcher.forward(request, response);
	}

	// order history list for customer
	private void showOrderHistoryList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user.getRole().contains("admin")) {
			List<Order> orderList = orderDAO.getAllOrder();
			session.setAttribute("orderList", orderList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/order-history.jsp");
			dispatcher.forward(request, response);
		}else {
			List<Order> customerOrderList = orderDAO.getOrderByCustomerId(user.getId());
			request.setAttribute("customerOrderList", customerOrderList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/history.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
