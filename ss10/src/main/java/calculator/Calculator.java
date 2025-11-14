package calculator;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Calcutor", value = "/calcutor")
public class Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/calcutor.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float firstOperand =Float.parseFloat(req.getParameter("firstOperand"));
        float secondOperand =Float.parseFloat(req.getParameter("secondOperand"));
        String operator = req.getParameter("operator");
        float result = 0;
        String text="";
        switch (operator){
            case "add":{
                result=firstOperand+secondOperand;
                break;
            }
            case "sub":{
                result=firstOperand-secondOperand;
                break;
            }
            case "mul":{
                result=firstOperand*secondOperand;
                break;
            }
            case "div":{
                if (secondOperand == 0){
                    text="Không thể chia cho 0";
                    break;
                }
                result=firstOperand/secondOperand;
                break;
            }
        }
        req.setAttribute("first",firstOperand);
        req.setAttribute("second",secondOperand);
        req.setAttribute("operator",operator);
        req.setAttribute("result",result);
        req.setAttribute("text",text);
        req.getRequestDispatcher("/view/result.jsp").forward(req,resp);
    }
}
