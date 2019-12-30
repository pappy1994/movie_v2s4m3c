<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
          
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
        <c:forEach var="theaterVO" items="${list }">
          <c:set var="theaterno" value="${theaterVO.theaterno }" />
            <ul>
              <li>
                <A>${theaterVO.theater }</A>
              </li>
            </ul>
        </c:forEach>
    <br><br>
  </div>
<%-- <jsp:include page="/menu/bottom.jsp" flush='false' /> --%>
</body>
</html>
