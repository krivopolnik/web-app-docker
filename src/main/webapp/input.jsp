<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <script src="resources/js/jquery-3.7.0.js"></script>
    <script src="resources/js/jquery.validate.js"></script>
    <link rel="stylesheet" type="text/css" href="styles.css">

    <title>Input Numbers</title>
    <script>

        // Function to display an alert message
        function showAlert(message) {
            alert(message);
        }

        $(document).ready(function() {
            $("#numberInputForm").validate({
                rules: {
                    num1: {
                        required: true,
                        number: true
                    },
                    num2: {
                        required: true,
                        number: true
                    }
                },
                messages: {
                    num1: {
                        required: "Please enter a valid number",
                        number: "Please enter a valid number"
                    },
                    num2: {
                        required: "Please enter a valid number",
                        number: "Please enter a valid number"
                    }
                },
                submitHandler: function(form) {
                    form.submit();
                }
            });
        });
    </script>
</head>
<body>
<div class="form-container">
    <form id="numberInputForm" class="form" action="sumServlet" method="post">
        <!-- Number 1 input -->
        <label class="form__label" for="num1">Number 1:</label>
        <input class="form__input" type="text" id="num1" name="num1">
        <br><br>

        <!-- Number 2 input -->
        <label class="form__label" for="num2">Number 2:</label>
        <input class="form__input" type="text" id="num2" name="num2">
        <br><br>

        <!-- Submit button -->
        <input class="form__submit-button" type="submit" value="Calculate Sum">

        <!-- Error message output -->
        <c:if test="${not empty requestScope.errorMessage}">
            <script>
                showAlert("${requestScope.errorMessage}");
            </script>
        </c:if>
    </form>
</div>
</body>
</html>