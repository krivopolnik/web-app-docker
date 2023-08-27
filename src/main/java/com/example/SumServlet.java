package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            double num1 = parseDoubleParameter(request.getParameter("num1"));
            double num2 = parseDoubleParameter(request.getParameter("num2"));
            double sum = calculateSum(num1, num2);

            storeSumInDatabase(num1, num2, sum);

            request.setAttribute("resultMessage", formatResultMessage(sum));
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            handleInvalidInput(request, response);
        } catch (SQLException e) {
            handleDatabaseError(e);
        }
    }

    private double parseDoubleParameter(String parameter) throws NumberFormatException {
        return Double.parseDouble(parameter);
    }

    private double calculateSum(double num1, double num2) {
        return num1 + num2;
    }

    private void storeSumInDatabase(double num1, double num2, double sum) throws SQLException {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // TODO java.sql.SQLException: No suitable driver found for jdbc:postgresql://db:5432/sum_db
            String insertQuery = "INSERT INTO sum_results (num1, num2, result) VALUES (?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setDouble(1, num1);
                preparedStatement.setDouble(2, num2);
                preparedStatement.setDouble(3, sum);
                preparedStatement.executeUpdate();
            }
        }
    }

    private String formatResultMessage(double sum) {
        return (sum == Math.floor(sum)) ? String.format("Result: %.0f", sum) : String.format("Result: %.1f", sum);
    }

    private void handleInvalidInput(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorMessage = "Invalid input. Please enter valid numbers.";
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("input.jsp").forward(request, response);
    }

    private void handleDatabaseError(SQLException e) {
        e.printStackTrace();
        // Handle database error here
    }
}