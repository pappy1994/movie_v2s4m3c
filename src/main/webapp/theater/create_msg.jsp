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

 
<DIV class='title_line'>알림</DIV>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
    <c:choose>
      <c:when test="${param.count ==1 }">
        <LI class='li_none'> 
          <span class='span_success'>상영 극장을 등록했습니다.</span>
          </LI>          
      </c:when>
      <c:otherwise>
        <LI class='li_none'> 
          <span class='span_fail'>
          상영 극장 등록에 실패했습니다.</span>
          </LI>          
       <LI class='li_none'> 
          <span class='span_fail'>
        다시 시도해주세요.</span>
        </LI>        
      </c:otherwise>
    </c:choose>
    <LI class='li_none'>
        <br>
        <button type='button' onclick="location.href='../movie/create.do'">상영 영화 등록</button>
        <button type='button' onclick="location.href='../movie/list.do'">목록</button>
      </LI>
    </UL>
  </fieldset>
 
</DIV>
 

<%-- <jsp:include page="/menu/bottom.jsp" flush='false' /> --%>

</body>
 
</html> 