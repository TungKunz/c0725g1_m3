package org.example.ss9.bai_tap.bai_tap_1;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculator", value = "/discount")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription = req.getParameter("productDescription");
        int listPrice = Integer.parseInt(req.getParameter("listPrice"));
        float discountPercent = Float.parseFloat(req.getParameter("discountPercent"));
        double discountAmount = listPrice * discountPercent * 0.01;
        req.setAttribute("productDescription",productDescription);
        req.setAttribute("listPrice",listPrice);
        req.setAttribute("discountPercent",discountPercent);
        req.setAttribute("discountAmount", discountAmount);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
