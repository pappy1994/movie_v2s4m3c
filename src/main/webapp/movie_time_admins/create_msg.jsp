<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>영화 등록</title> 
 
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
            <script type="text/javascript">
              opener.location.reload(); // 카테고리 목록 새로고침
              window.close();              // 창 닫기
            </script>
        </c:when>
      <c:otherwise>
        <LI class='li_none'> 
          <span class='span_success'>상영 시간을 등록했습니다.</span>
          </LI>
        <LI class='li_none'> 
          <span class='span_fail'>
          상영 시간 등록에 실패했습니다.</span>
          </LI>          
       <LI class='li_none'> 
          <span class='span_fail'>
        다시 시도해주세요.</span>
        </LI>        
      </c:otherwise>
    </c:choose>
    <LI class='li_none'>
        <br>
        <button type="button" onclick="window.close();" class="btn btn-info">닫기</button>
      </LI>
    </UL>
  </fieldset>
 
</DIV>
 

<%-- <jsp:include page="/menu/bottom.jsp" flush='false' /> --%>

</body>
 
</html> 