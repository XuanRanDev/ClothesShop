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

@WebServlet(name = "SeleF_nameServlet", urlPatterns = "/seleF_name")
public class SeleF_nameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        ClothesDao dao = new ClothesDao();
        List<Clothes> f_list = dao.findMeu(key);
        request.setAttribute("f_list", f_list);
        request.getRequestDispatcher("seleF_name.jsp").forward(request, response);
    }
}
