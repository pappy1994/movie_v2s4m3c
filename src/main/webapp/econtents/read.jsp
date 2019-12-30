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
  /* function panel_img(file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#attachfile_panel').hide();\">";
    tag += "  <IMG src='../attachfile/storage/" + file + "' style='width: 100%;'>"; 
    tag += "</A>";
    
    $('#attachfile_panel').html(tag);
    $('#attachfile_panel').show();
  } */
</script>
</head>

<body>
<c:set var="eventgrpno" value="${eventgrpVO.eventgrpno}" />
<c:set var="econtentsno" value="${econtentsVO.econtentsno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../eventgrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?eventgrpno=${eventgrpno }'>${eventgrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?eventgrpno=${eventgrpno }'>목록</A>
    <span class='menu_divide' > | </span>
    <A href='./update.do?eventgrpno=${eventgrpno }&econtentsno=${econtentsno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?eventgrpno=${eventgrpno }&econtentsno=${econtentsno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="contentsno" value="${econtentsno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            [<span>${econtentsVO.etype}</span>]
            <span>${econtentsVO.title}</span>
            <span>${econtentsVO.rdate.substring(0, 16)}</span>
          </li>
          
          <li class="li_none">
            <DIV>${econtentsVO.content }</DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  