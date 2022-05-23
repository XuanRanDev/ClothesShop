package dev.xuanran.clothesshop.servlet;

import dev.xuanran.clothesshop.dao.FoodDao;
import dev.xuanran.clothesshop.dao.OrdersDao;
import dev.xuanran.clothesshop.model.Food;
import dev.xuanran.clothesshop.model.Orders;
import dev.xuanran.clothesshop.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddOrderServlet", urlPatterns = "/addOrder")
public class AddOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Orders orders = new Orders();
        FoodDao dao = new FoodDao();
        OrdersDao ordersDao = new OrdersDao();
        Food food = dao.searchById(Integer.parseInt(request.getParameter("id")));
        User user = (User) request.getSession().getAttribute("user");
        System.out.println(user.getLoginId());
        orders.setUser(user);
        orders.setFood(food);
        orders.setO_num(Integer.parseInt(request.getParameter("num")));

        orders.setMarkup(request.getParameter("markup"));
        System.out.println(orders.getMarkup());
        orders.setState("货到付款");
        orders.setPzstate("等待配送");
        orders.setPd("否");
        ordersDao.save(orders);
        response.getWriter().println("<script LANGUAGE='javascript'> alert('加入购物车成功！');history.go(-1);</script>");
    }
}
