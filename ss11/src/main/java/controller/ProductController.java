package controller;


import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.IProductService;
import service.ProductService;

import java.io.IOException;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private IProductService productService= new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormAdd(req, resp);
                break;
            case "edit":
                showFormEdit(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            default:
                showList(req, resp);

        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("productList", productService.findAll());
        try {
            req.getRequestDispatcher("/view/productView.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("productList", productService.findAll());
        try {
            req.getRequestDispatcher("/view/productAdd.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        Product product = productService.findProduct(id);
        req.setAttribute("product", product);
        try {
            req.getRequestDispatcher("/view/productEdit.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void delete(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        productService.delete(id);
        showList(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(req, resp);
                break;
            case "edit":
                update(req, resp);
                break;
            case "delete":
                break;
            default:
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String id= req.getParameter("id");
        String name=req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String nsx = req.getParameter("nsx");
        Product product = new Product(id,name,price,nsx);
        productService.add(product);
        showList(req,resp);
    }
    private void update(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String nsx = req.getParameter("nsx");
        Product product = new Product(id, name, price, nsx);
        productService.edit(product);
        showList(req, resp);
    }
}
