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
 
 
 
 <script type="text/javascript">
 </script>

</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 <form name='frm' id='frm' method='get' action='./list.do'>
    <input type='hidden' name='boardgrpno' value='${boardgrpVO.boardgrpno }'>

  <ASIDE style='float: left;'>
    <A href='../boardgrp/list.do'>영화 게시판</A> > 
    <A href='./list.do?boardgrpno=${boardgrpVO.boardgrpno }'>${boardgrpVO.name }</A>
      <c:if test="${param.word.length() > 0 }">
        > [${param.word }] 검색 목록 (${search_count } 건)
      </c:if>  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <c:if test="${sessionScope.id_admins != null}">
      <span class='menu_divide' > | </span>
      <A href='./create.do?boardgrpno=${boardgrpVO.boardgrpno }'>등록</A>
    </c:if> 
    
     <c:choose>
        <c:when test="${param.word != '' }">
          <input type='text' name='word' id='word' value='${param.word }' 
                     style='width: 35%;'>
        </c:when>
        <c:otherwise>
          <input type='text' name='word' id='word' value='' style='width: 35%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do?boardgrpno=${boardgrpVO.boardgrpno}'">검색 취소</button>  
      </c:if>
  </ASIDE>
</form> 

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
           
           <span style='font-size: 1.7em; font-weight: bold;'>${contentsbdVO.title}</span><br>
           <span style='font-size: 0.78em; color: green;'>${contentsbdVO.mage} 관람가</span><br>
           <span style='font-size: 0.78em;'>예매율:${contentsbdVO.mbook}%</span><br>
           <span style='font-size: 0.78em;'>${contentsbdVO.mopen} 개봉</span><br>
           <IMG src='./images/heart_w.png' style='width: 14px;'>
           <span style='font-size: 0.84em; color: red;'>${contentsbdVO.recom }</span>     
           <br>     
           <button type='button' onclick="location.href='./read.do?contentsbdno=${contentsbdno}&word=${param.word}&nowPage=${param.nowPage}'" class="btn">더보기</button>                   
           <button type='button' onclick="location.href=''" class="btn">예매하기</button>             
           <br> 
            <c:if test="${sessionScope.id_admins != null}">
              <a href="./update.do?contentsbdno=${contentsbdno}&boardgrpno=${boardgrpVO.boardgrpno}&nowPage=${param.nowPage}"><span style='font-size: 0.9em;'>수정</span></a>
              <a href="./delete.do?contentsbdno=${contentsbdno}&boardgrpno=${boardgrpVO.boardgrpno}&nowPage=${param.nowPage}"><span style='font-size: 0.9em;'> 삭제</span></a>
              <a href="../attachbd/create.do?contentsbdno=${contentsbdno}&boardgrpno=${boardgrpVO.boardgrpno}&nowPage=${param.nowPage}"><span style='font-size: 0.9em;'> 사진첨부</span></a>
            </c:if>    
          </DIV>  
        </c:forEach>
       
        <div class='bottom_menu'>${paging }</div>    
        <br><br>
     
      </DIV>
      
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  