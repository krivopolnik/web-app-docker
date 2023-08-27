<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <title>Result</title>
</head>
<body>
<div class="result-container">
  <!-- Result output -->
  <c:if test="${not empty requestScope.resultMessage}">
    <p class="result-message">${requestScope.resultMessage}</p>
  </c:if>
</div>
</body>
</html>
