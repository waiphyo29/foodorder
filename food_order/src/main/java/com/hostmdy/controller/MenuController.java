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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import com.hostmdy.model.Category;
import com.hostmdy.model.Menu;
import com.hostmdy.model.MenuDAO;
import com.hostmdy.model.Order;
import com.hostmdy.model.OrderDAO;
import com.hostmdy.model.OrderItem;
import com.hostmdy.model.OrderItemDAO;
import com.hostmdy.model.User;
import com.hostmdy.model.UserDAO;

/**
 * Servlet implementation class MenuController
 */
public class MenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/yummy")
	private DataSource dataSource;
	
	private OrderDAO orderDAO;
	private OrderItemDAO orderItemDAO;
	private MenuDAO menuDAO;
	private UserDAO userDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		menuDAO = new MenuDAO(dataSource);
		userDAO = new UserDAO(dataSource);
		orderDAO = new OrderDAO(dataSource);
		orderItemDAO = new OrderItemDAO(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mode = request.getParameter("mode");
		if(mode == null) {
			mode = "SHOW";	
		}
		switch (mode) {
		case "SHOW":
			showMenu(request,response);
			break;
			
		case "SEARCH":
			showSearchedResult(request,response);
			break;
			
		case "DETAIL":
			showDetail(request,response);
			break;
			
		case "SHOW_CREATE":
			showAddMenu(request,response);
			break;
			
		case "SHOW_UPDATE":
			showUpdateMenu(request,response);
			break;
			
		case "CREATE":
			addMenu(request,response);
			break;
			
		case "UPDATE":
			updateMenu(request,response);
			break;
			
		case "DELETE":
			deleteMenu(request,response);
			break;
			
		case "VEG":
			vegetarianMenu(request,response);
			break;
			
		case "PRICE":
			sortByPrice(request,response);
			break;
			
		case "CART":
			addToCart(request,response);
			break;
			
		case "CANCEL":
			cancelFromCart(request,response);
			break;
			
		case "PLUS":
			quantityInc(request,response);
			break;
			
		case "MINUS":
			quantityDec(request,response);
			break;
			
		case "DELI":
			deliOrPickup(request,response);
			break;

		default:
			showMenu(request,response);
			break;
		}
		
	}

	private void deliOrPickup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Boolean pickup =Boolean.parseBoolean(request.getParameter("pickup"));
		
		if(!pickup) {
			session.setAttribute("pickup", false);
		}if (pickup) {
			session.setAttribute("pickup", true);
		} else {
			session.setAttribute("pickup", false);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("view/cart.jsp");
		dispatcher.forward(request, response);
	}

	private void listFilter(HttpServletRequest request, HttpServletResponse response,List<Menu> menuList) {
		List<Menu> burgerList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("BURGER")).toList();
		request.setAttribute("burgerList", burgerList);
		
		List<Menu> pizzaList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("PIZZA")).toList();
		request.setAttribute("pizzaList", pizzaList);
		
		List<Menu> riceList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("RICE")).toList();
		request.setAttribute("riceList", riceList);
		
		List<Menu> juiceList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("JUICE")).toList();
		request.setAttribute("juiceList", juiceList);
		
		List<Menu> sandwichList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("SANDWICH")).toList();
		request.setAttribute("sandwichList", sandwichList);
		
		List<Menu> coffeeList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("COFFEE")).toList();
		request.setAttribute("coffeeList", coffeeList);
	}

	private void quantityInc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<OrderItem> cartList = new ArrayList<>();//changed
		Long menuId = Long.parseLong(request.getParameter("plus"));
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Long total = 0L;
		int info = (int) session.getAttribute("info");
		@SuppressWarnings("unchecked")
		ArrayList<OrderItem> cart_list = (ArrayList<OrderItem>) session.getAttribute("cartList");
		
		for (OrderItem orderIt : cart_list) {
			if(! orderIt.getMenuid().equals(menuId)) {
				cartList.add(orderIt);
				total = total + (orderIt.getSubtotal() * orderIt.getQuantity());
			}else {
				Menu menu = menuDAO.getByIdFromMenu(menuId);
				cartList.add(new OrderItem( menu.getId(), menu.getTitle(), orderIt.getQuantity()+1, menu.getPrice(), menu.getImage()));
				total = total + (orderIt.getSubtotal() * (orderIt.getQuantity() +1));
				info = info + 1;
			}
		}
		session.setAttribute("info", info);
		session.setAttribute("total", total);
		session.setAttribute("cartList", cartList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/cart.jsp");
		dispatcher.forward(request, response);
		
	}

	private void quantityDec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<OrderItem> cartList = new ArrayList<>();//changed
		Long menuId = Long.parseLong(request.getParameter("minus"));
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Long total = 0L;
		int info = (int) session.getAttribute("info");
		@SuppressWarnings("unchecked")
		ArrayList<OrderItem> cart_list = (ArrayList<OrderItem>) session.getAttribute("cartList");//changed
		for (OrderItem orderIt : cart_list) {
			if(!(orderIt.getMenuid().equals(menuId))) {
				cartList.add(orderIt);
				total = total + (orderIt.getSubtotal() * orderIt.getQuantity());
			}else if (orderIt.getQuantity() > 1) {
				Menu menu = menuDAO.getByIdFromMenu(menuId);
				cartList.add(new OrderItem( menu.getId(), menu.getTitle(), orderIt.getQuantity()-1, menu.getPrice(), menu.getImage()));
				total = total + (orderIt.getSubtotal() * (orderIt.getQuantity() -1));
				info = info -1;
			} else {
				info = info -1;
				continue;
			}
		}
		session.setAttribute("info", info);
		session.setAttribute("total", total);
		session.setAttribute("cartList", cartList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/cart.jsp");
		dispatcher.forward(request, response);
	}

	private void cancelFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<OrderItem> cartList = new ArrayList<>();//changed
		Long cancelMenuId = Long.parseLong(request.getParameter("cancel"));
		
		HttpSession session = request.getSession();
		Long total = 0L;
		int info = 0;
		@SuppressWarnings("unchecked")
		ArrayList<OrderItem> cart_list = (ArrayList<OrderItem>) session.getAttribute("cartList");//changed
		
		for (OrderItem orderIt : cart_list) {
			if(!(orderIt.getMenuid().equals(cancelMenuId))) {
				cartList.add(orderIt);
				info = orderIt.getQuantity() + info;
				total = total + (orderIt.getSubtotal() * orderIt.getQuantity());
			}
		}
		session.setAttribute("info", info);
		session.setAttribute("total", total);
		session.setAttribute("cartList", cartList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/cart.jsp");
		dispatcher.forward(request, response);
		
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		ArrayList<OrderItem> cartList = new ArrayList<>();// changed
		
		int info = 0;
		if(session.getAttribute("info") != null) {
			info = (int) session.getAttribute("info");
		}
		
		List<Menu> menuList = menuDAO.getAllFromMenu();
		listFilter(request, response, menuList);
		String carts =  request.getParameter("carts");
		String[] idList = carts.split(",");
		
		@SuppressWarnings("unchecked")
		ArrayList<OrderItem> cart_list =  (ArrayList<OrderItem>) session.getAttribute("cartList");//changed
		
		if(cart_list == null) {
			
			Long total = 0L;
			for (String id : idList) {
				
				if(!(id.equals(""))) {
					Optional<Menu> menuOpt = menuList.stream().filter(menu -> menu.getId().toString().equals(id)).findFirst();
					if(menuOpt.isPresent()) {
						Menu menu = menuOpt.get();
						cartList.add(new OrderItem( menu.getId(), menu.getTitle(), 1, menu.getPrice(), menu.getImage()));
						total = total + menu.getPrice();
						info++;
					}
				}
			}
			session.setAttribute("total", total);
		}else {
			cartList = cart_list;
			
			if(idList != null) {
				Long total = (Long) session.getAttribute("total");
				for(String id : idList) {
					if(!(id.equals(""))) {
						Optional<OrderItem> cartOpt = cartList.stream().filter(cart -> cart.getMenuid().toString().equals(id)).findFirst();
						Optional<Menu> menuOpt = menuList.stream().filter(menu -> menu.getId().toString().equals(id)).findFirst();
						if(cartOpt.isEmpty()) {
							Menu menu = menuOpt.get();
							cartList.add(new OrderItem( menu.getId(), menu.getTitle(), 1, menu.getPrice(), menu.getImage()));
							total = total + menu.getPrice();
							session.setAttribute("total", total);
							info++;
						}
					}
				}
			}
		}
		if(user != null) {
			User customer = userDAO.getUserById(user.getId());
			session.setAttribute("user", customer);
		}
		session.setAttribute("info", info);
		session.setAttribute("pickup", false);
		session.setAttribute("cartList", cartList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/cart.jsp");
		dispatcher.forward(request, response);
		
	}
	

	private void sortByPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Menu> menuList = menuDAO.getAllFromMenu();
		
		List<Menu> unsBurgerList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("BURGER")).toList();
		List<Menu> burgerList = unsBurgerList.stream().sorted((m1,m2) -> m1.getPrice().compareTo(m2.getPrice())).toList();
		request.setAttribute("burgerList", burgerList);
		
		List<Menu> unsPizzaList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("PIZZA")).toList();
		List<Menu> pizzaList = unsPizzaList.stream().sorted((m1,m2) -> m1.getPrice().compareTo(m2.getPrice())).toList();
		request.setAttribute("pizzaList", pizzaList);
		
		List<Menu> unsRiceList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("RICE")).toList();
		List<Menu> riceList = unsRiceList.stream().sorted((m1,m2) -> m1.getPrice().compareTo(m2.getPrice())).toList();
		request.setAttribute("riceList", riceList);
		
		List<Menu> unsJuiceList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("JUICE")).toList();
		List<Menu> juiceList = unsJuiceList.stream().sorted((m1,m2) -> m1.getPrice().compareTo(m2.getPrice())).toList();
		request.setAttribute("juiceList", juiceList);
		
		List<Menu> unsSandwichList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("SANDWICH")).toList();
		List<Menu> sandwichList = unsSandwichList.stream().sorted((m1,m2) -> m1.getPrice().compareTo(m2.getPrice())).toList();
		request.setAttribute("sandwichList", sandwichList);
		
		List<Menu> unsCoffeeList =menuList.stream().filter(menu -> (menu.getCategory().toString()).equals("COFFEE")).toList();
		List<Menu> coffeeList = unsCoffeeList.stream().sorted((m1,m2) -> m1.getPrice().compareTo(m2.getPrice())).toList();
		request.setAttribute("coffeeList", coffeeList);
		
		request.setAttribute("sortByPrice", true);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/menu.jsp");
		dispatcher.forward(request, response);
		
	}

	private void vegetarianMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Menu> vegList = (menuDAO.getAllFromMenu()).stream().filter(veg -> veg.getVeg()).toList();
		listFilter(request, response, vegList);
		
		request.setAttribute("onlyVeg", true);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/menu.jsp");
		dispatcher.forward(request, response);
		
	}

	private void updateMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long id = Long.parseLong(request.getParameter("id"));
		String title = request.getParameter("title");
		Category category = Category.valueOf(request.getParameter("category"));
		Integer price = Integer.parseInt(request.getParameter("price"));
		String ingredients = request.getParameter("ingredients");
		String description = request.getParameter("description");
		Double calorie = Double.parseDouble(request.getParameter("calorie"));
		Double fat = Double.parseDouble(request.getParameter("fat"));
		Double protein = Double.parseDouble(request.getParameter("protein"));
		Boolean veg = Boolean.parseBoolean(request.getParameter("vegetarian"));
		String image = request.getParameter("image");
		boolean success = menuDAO.updateToMenu(new Menu(id, title, category, price, ingredients, veg, calorie, fat, protein, description, image));
		if(success) {
			response.sendRedirect("menu");
		}else {
			Menu menu = menuDAO.getByIdFromMenu(id);
			request.setAttribute("menu", menu);
			request.setAttribute("success", success);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/update-menu.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void deleteMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Long id = Long.parseLong(request.getParameter("id"));
		boolean success = menuDAO.deleteFromMenu(id);
		if(success) {
			response.sendRedirect("menu");
		}else {
			request.setAttribute("success", success);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/detail.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private void showUpdateMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long id = Long.parseLong(request.getParameter("id"));
		Menu menu = menuDAO.getByIdFromMenu(id);
		if(menu != null) {
			request.setAttribute("menu", menu);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/update-menu.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void showAddMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/add-menu.jsp");
		dispatcher.forward(request, response);
	}

	private void addMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		Category category = Category.valueOf(request.getParameter("category"));
		Integer price = Integer.parseInt(request.getParameter("price"));
		String ingredients = request.getParameter("ingredients");
		String description = request.getParameter("description");
		Double calorie = Double.parseDouble(request.getParameter("calorie"));
		Double fat = Double.parseDouble(request.getParameter("fat"));
		Double protein = Double.parseDouble(request.getParameter("protein"));
		Boolean veg = Boolean.parseBoolean(request.getParameter("vegetarian"));
		String image = request.getParameter("image");
		
		boolean success = menuDAO.addToMenu(new Menu(title, category, price, ingredients, veg, calorie, fat, protein, description, image));
		request.setAttribute("success", success);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/add-menu.jsp");
		dispatcher.forward(request, response);
	}

	private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Long id = Long.parseLong(request.getParameter("id"));
		Menu menu = menuDAO.getByIdFromMenu(id);
		
		request.setAttribute("menu", menu);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/detail.jsp");
		dispatcher.forward(request, response);
		
	}

	private void showSearchedResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Menu> filMenuList = new ArrayList<>();
		String search = request.getParameter("search");
		List<Menu> searchedList = menuDAO.searchFromMenu(search);
		List<Menu> menuList = menuDAO.getAllFromMenu();
		if(searchedList.isEmpty()) {
			request.setAttribute("exist", false);
			listFilter(request, response, menuList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/menu.jsp");
			dispatcher.forward(request, response);
		}else {
			for (Menu menu : menuList) {
				Optional<Menu> menuOpt = searchedList.stream().filter(searched -> searched.getId().equals(menu.getId())).findFirst();
				if(menuOpt.isEmpty()) {
					filMenuList.add(menu);
				}
			}
			request.setAttribute("exist", true);
			request.setAttribute("searchedList", searchedList);
			listFilter(request, response, filMenuList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/menu.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private int order() {
		List<Order> orderUpList = orderDAO.getAllOrder().stream().filter(order -> order.getOrderup() && order.getDate().equals(LocalDate.now())).toList();
		int orderNo = 0;
		for (Order order : orderUpList) {
			orderNo++;
		}
		return orderNo;
	}

	private void showMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		List<Menu> menuList = menuDAO.getAllFromMenu();
		
		listFilter(request, response, menuList);
		
		session.setAttribute("orderNo", order());
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/menu.jsp");
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
