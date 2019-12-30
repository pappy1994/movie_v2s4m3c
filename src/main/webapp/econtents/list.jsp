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
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../eventgrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?eventgrpno=${eventgrpVO.eventgrpno }'>${eventgrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right; width: 20%;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span>
    <A href='./create.do?eventgrpno=${eventgrpVO.eventgrpno }'>등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 90%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 65%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>이벤트 타입</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>기간</th>
          <th style='text-align: center;'></th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="econtentsVO" items="${list }">
          <c:set var="econtentsno" value="${econtentsVO.econtentsno }" />
          
          <tr> 
            <td style='text-align: center;'>${econtentsVO.etype}</td>
            <td>
              <a href="./read.do?econtentsno=${econtentsno}">${econtentsVO.title}</a> 
            </td> 
            <td style='text-align: center;'>${econtentsVO.rdate.substring(0, 10)}</td>
              <td style='text-align: center;'>
               <a href="./update.do?econtentsno=${econtentsno}&eventgrpno=${eventgrpVO.eventgrpno}"><img src="./images/update.png" title="수정"></a>
               <a href="./delete.do?econtentsno=${econtentsno}&eventgrpno=${eventgrpVO.eventgrpno}"><img src="./images/delete.png" title="삭제"></a>
              </td>
          </tr>
        </c:forEach>
        
      </tbody>
      

    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  