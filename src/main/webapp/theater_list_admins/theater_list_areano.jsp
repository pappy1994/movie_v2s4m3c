<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>극장 목록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
function create_theater_form(areano) {

    var url = './create.do?areano=' + areano;
    var win = window.open(url, '카테고리 그룹 수정', 'width=800px, height=400px');
    
    var x = (screen.width - 800) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }

function update_form(theaterno, areano) {

    var url = './update.do?theaterno=' + theaterno + '&areano=' + areano;
    var win = window.open(url, '카테고리 그룹 수정', 'width=800px, height=400px');
    
    var x = (screen.width - 800) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동
  }

function delete_form(theaterno, areano) {

    var url = './delete.do?theaterno=' + theaterno + '&areano=' + areano;
    var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=500px');
    
    var x = (screen.width - 800) / 2;
    var y = (screen.height - 500) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }

</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />

<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 50%;'/>
    <col style='width: 50%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class='th_basic'>상영 극장</TH>
    <TH class='th_basic'>수정/삭제</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="theaterVO" items = "${list }">
    <c:set var="theaterno" value="${theaterVO.theaterno }" />
    
    <TR>
      <TD style='text-align: center;'>${theaterVO.theater }</TD>
      <TD style='text-align: center;'>
        <A href="javascript: update_form(${theaterno },${theaterVO.areano });"><IMG src='./images/update.png' title='수정'></A>
        <A href="javascript: delete_form(${theaterno },${theaterVO.areano });"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
    </TR>
  </c:forEach> 
  </tbody>
 
</TABLE>

<button type="button" onclick="location.href='../area_list_admins/list.do'">상영 지역 목록</button>
<button type='button' id='create_form' onclick="create_theater_form(${areaVO.areano});">상영 극장 등록</button>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 