<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>

<!-- Result output -->
<c:if test="${not empty requestScope.resultMessage}">
  <p>${requestScope.resultMessage}</p>
</c:if>

</body>
