<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>7조 영화 예약</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../customgrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?customgrpno=${customgrpVO.customgrpno }'>${customgrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span>
    <A href='./create.do?customgrpno=${customgrpVO.customgrpno }'>등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 60%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>추천</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="contentsmvVO" items="${list }">
          <c:set var="contentsmvno" value="${contentsmvVO.contentsmvno }" />
          
          <tr> 
            <td style='text-align: center;'>${contentsmvVO.rdate.substring(0, 10)}</td>
            <td>
              <a href="./read.do?contentsmvno=${contentsmvno}">${contentsmvVO.title}</a> 
            </td> 
            <td style='text-align: center;'>${contentsmvVO.recom}</td>
            <td style='text-align: center;'>
              <a href="./update.do?contentsmvno=${contentsmvno}&customgrpno=${customgrpVO.customgrpno}"><img src="./images/update.png" title="수정"></a>
              <a href="./delete.do?contentsmvno=${contentsmvno}&customgrpno=${customgrpVO.customgrpno}"><img src="./images/delete.png" title="삭제"></a>
              <%-- <a href="../attachfile/create.do?contentsmvno=${contentsmvno}&customgrpno=${customgrpVO.customgrpno}"><img src="./images/upload.png" title="파일 업로드"></a> --%>
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
    
 
  