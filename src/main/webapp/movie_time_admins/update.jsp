<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>영화 수정</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>

<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>

 
<DIV class='title_line' style='width: 40%;'>지역 수정</DIV>
 
<FORM name='frm' method='POST' action='./update.do'>
<input type='hidden' name='movie_timeno' value='${movie_timeVO.movie_timeno }'>
  <fieldset class='fieldset_basic'>
    <ul>
      <li class='li_none'>
        <label class='label_basic' >상영 시간</label>
        <input type='text' name='mtime' value='${movie_timeVO.mtime }' required="required" autofocus="autofocus">
      </li>
      <li class='li_right'>
        <button type="submit">수정</button>
      </li>
    </ul>
  </fieldset>
</FORM>

<%-- <jsp:include page="/menu/bottom.jsp" flush='false' /> --%>

</body>
 
</html> 