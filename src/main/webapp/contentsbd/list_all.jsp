<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 <style>
  .fadding-photo:hover { 
  opacity:0.4;
  }
 </style>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    전체 보기 
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
       <DIV id='panel_create' style='padding: 10px 0px 10px 0px; width: 100%; text-align: center;'>
        <c:forEach var="contentsbdVO" items="${list }">
        <c:set var="contentsbdno" value="${contentsbdVO.contentsbdno }" />   
        <c:set var="fname" value="${contentsbdVO.fname.toLowerCase() }" />
        
        <DIV style='width: 30%; float: left; margin: 0.5%; padding: 0.5%;'>         
         <c:choose>
          <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
             <a href="./read.do?contentsbdno=${contentsbdno}">
             <IMG class="fadding-photo" src="./storage/${contentsbdVO.fname }" 
                  style='width: 75%; height: 400px;'></a><br>
          </c:when>
          <c:otherwise>
            ${contentsbdVO.fname}
          </c:otherwise>
        </c:choose>                     
          <c:choose>
            <c:when test="${contentsbdVO.title.length() > 12 }">
               <span style='font-size: 1.7em; font-weight: bold;'> ${contentsbdVO.title.substring(0, 12) }... </span><br>
            </c:when>
            <c:otherwise>
              <span style='font-size: 1.7em; font-weight: bold;'>${contentsbdVO.title}</span><br>
            </c:otherwise>
          </c:choose>           
           <span style='font-size: 0.78em; color: green;'>${contentsbdVO.mage} 관람가</span><br>
            <span style='font-size: 0.78em;'>예매율:${contentsbdVO.mbook}%</span><br>
            <span style='font-size: 0.78em;'>${contentsbdVO.mopen} 개봉</span><br>
            <IMG src='./images/heart_w.png' style='width: 20px;'><span style='color: red'>${contentsbdVO.recom}</span>     
            <br>     
            <button type='button' onclick="location.href='./read.do?contentsbdno=${contentsbdno}'" class="btn">더보기</button>                   
            <button type='button' onclick="location.href='../reserve/list.do'" class="btn">예매하기</button>             <br>
          </DIV>
       </c:forEach>
      </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  