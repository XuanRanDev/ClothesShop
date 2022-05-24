package dev.xuanran.clothesshop.servlet;

import dev.xuanran.clothesshop.dao.ClothesDao;
import dev.xuanran.clothesshop.model.Clothes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MainServlet", urlPatterns = "/main")
public class MainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClothesDao dao = new ClothesDao();
        List<Clothes> list = dao.findAll();

        request.setAttribute("list", list);
        request.getRequestDispatcher("main.jsp").forward(request, response);
    }
}
