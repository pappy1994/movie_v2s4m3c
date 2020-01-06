<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

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
<script type="text/javascript">
  function panel_img(file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#attachbd_panel').hide();\">";
    tag += "  <IMG src='../attachbd/storage/" + file + "' style='width: 100%;'>"; 
    tag += "</A>";
    
    $('#attachbd_panel').html(tag);
    $('#attachbd_panel').show();
  }
</script>
</head>

<body>
<c:set var="boardgrpno" value="${boardgrpVO.boardgrpno}" />
<c:set var="contentsbdno" value="${contentsbdVO.contentsbdno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../boardgrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?boardgrpno=${boardgrpno }'>${boardgrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?boardgrpno=${boardgrpno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?boardgrpno=${boardgrpno }&contentsbdno=${contentsbdno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <a href="../attachfile/create.do?contentsbdno=${contentsbdno}&boardgrpno=${boardgrpVO.boardgrpno}">첨부 파일 등록</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?boardgrpno=${boardgrpno }&contentsbdno=${contentsbdno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="contentsbdno" value="${contentsbdno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> 
            <span>${contentsbdVO.title}</span>
            (<span>${contentsbdVO.recom}</span>)
            <span>${contentsbdVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV id='attachbd_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;'>
            <c:forEach var="attachbdVO" items="${attachbd_list }">
              <c:set var="athumb" value="${attachbdVO.athumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${athumb.endsWith('jpg') || athumb.endsWith('png') || athumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${attachfileVO.aname }')"><IMG src='../attachbd/storage/${athumb }' style='margin-top: 2px;'></A>
                  <A href="./file_delete_proc.do?contentsbdno=${contentsbdno}&attachbdno=${attachbdVO.attachbdno }"><span class="glyphicon glyphicon-remove"></span></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
          <li class="li_center" >
            <button type="button" onclick="location.href='./read.do?contentsbdno=${contentsbdno}'"
                        class="btn btn-info">삭제 완료</button>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  