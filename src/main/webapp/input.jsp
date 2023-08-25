<!DOCTYPE html>
<html>
<head>
    <title>Input Numbers</title>
    <script>
        // Function to display an alert message
        function showAlert(message) {
            alert(message);
        }

        // Function to validate the form input
        function validateForm() {
            // Get the values of num1 and num2 input fields
            var num1 = parseFloat(document.getElementById("num1").value);
            var num2 = parseFloat(document.getElementById("num2").value);

            // Check if either num1 or num2 is not a valid number
            if (isNaN(num1) || isNaN(num2)) {
                // Display an alert if input is not valid
                showAlert("Please enter valid numbers.");
                return false; // Prevent form submission
            }

            return true; // Allow form submission
        }
    </script>
</head>
<body>
<form action="sumServlet" method="post">
    <!-- Number 1 input -->
    <label for="num1">Number 1:</label>
    <input type="text" id="num1" name="num1"><br><br>

    <!-- Number 2 input -->
    <label for="num2">Number 2:</label>
    <input type="text" id="num2" name="num2"><br><br>

    <!-- Submit button with validation -->
    <input type="submit" value="Calculate Sum" onclick="return validateForm()">
</form>
</body>
</html>