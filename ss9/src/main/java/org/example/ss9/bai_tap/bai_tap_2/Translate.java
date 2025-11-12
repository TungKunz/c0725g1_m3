package org.example.ss9.bai_tap.bai_tap_2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "Translate", value = "/translate")
public class Translate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/translate.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển vở");
        dictionary.put("computer", "Máy tính");
        String word = req.getParameter("word");
        String search = dictionary.get(word);
        if (search == null) {
            search = "Không tìm thấy kết quả!";
        }
        req.setAttribute("search", search);
        req.setAttribute("search",search);
        req.setAttribute("word",word);
        req.getRequestDispatcher("/translate.jsp").forward(req, resp);
    }
}
