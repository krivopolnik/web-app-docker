<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<!-- Error message output -->
<div>${requestScope.errorMessage}</div>
<c:if test="${not empty requestScope.errorMessage}">
  <script>
    showAlert("${requestScope.errorMessage}");
  </script>
</c:if>

<!-- Result output -->
<c:if test="${not empty requestScope.resultMessage}">
  <p>${requestScope.resultMessage}</p>
</c:if>
</body>
