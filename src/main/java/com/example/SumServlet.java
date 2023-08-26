package com.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get input values from request parameters
            String num1Str = request.getParameter("num1");
            String num2Str = request.getParameter("num2");

            // Validate input values using regular expressions
            if (!num1Str.matches("^\\d+(\\.\\d+)?$") || !num2Str.matches("^\\d+(\\.\\d+)?$")) {
                // Handle the case of invalid input
                String errorMessage = "Invalid input. Please enter valid numbers.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("input.jsp").forward(request, response);
                return; // Exit the servlet to prevent further processing
            }

            // Parse input values to double
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);

            // Calculate the sum
            double sum = num1 + num2;

            // Prepare the result message
            String resultMessage;
            if (sum == Math.floor(sum)) {
                resultMessage = String.format("Result: %.0f", sum); // If it's an integer
            } else {
                resultMessage = String.format("Result: %.1f", sum); // If it's a decimal
            }

            // Store the result message in request scope for display in JSP
            request.setAttribute("resultMessage", resultMessage);

            // Forward the request to the same page for displaying the result
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle the case of invalid input
            String errorMessage = "Invalid input. Please enter valid numbers.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("input.jsp").forward(request, response);
        }
    }
}
