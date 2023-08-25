<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
<!-- Error message output -->
<c:if test="${not empty requestScope.errorMessage}">
  <script>
    showAlert("${requestScope.errorMessage}");
  </script>
</c:if>

<!-- Result output -->
<c:if test="${not empty requestScope.resultMessage}">
  <p>${resultMessage}</p>
</c:if>

</body>
