<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
  href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
  type="text/css" />
<script
  src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
function update_form(movieno) {

	  var url = './update.do?movieno=' + movieno;
	  var win = window.open(url, '카테고리 그룹 수정', 'width=800px, height=400px');
	  
	  var x = (screen.width - 800) / 2;
	  var y = (screen.height - 400) / 2;
	  
	  win.moveTo(x, y); // 지정된 좌표로 이동    
	}

function delete_form(movieno) {

	  var url = './delete.do?movieno=' + movieno;
	  var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=500px');
	  
	  var x = (screen.width - 800) / 2;
	  var y = (screen.height - 500) / 2;
	  
	  win.moveTo(x, y); // 지정된 좌표로 이동    
	}
	
function update_form(theaterno) {

    var url = '../theater/update.do?theaterno=' + theaterno;
    var win = window.open(url, '카테고리 그룹 수정', 'width=800px, height=400px');
    
    var x = (screen.width - 800) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }

function delete_form(theaterno) {

    var url = '../theater/delete.do?theaterno=' + theaterno;
    var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=500px');
    
    var x = (screen.width - 800) / 2;
    var y = (screen.height - 500) / 2;
    
    win.moveTo(x, y); // 지정된 좌표로 이동    
  }

function theater_select(theaterno) {
	  // alert(theaterno);
    var params = 'theaterno=' + theaterno;

    $.ajax({
      url: "../theater/list_theater_select.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
    	  // alert(rdata);
    	  $('#select_theater').html(''); // 패널 초기화, val(''): 안됨
          
          for (i=0; i < rdata.list.length; i++) {
            var row = rdata.list[i];
            
            msg += "<DIV style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
            msg += "<span style='font-weight: bold;'>" + row.theater + "</span>";
            msg += "</DIV>";
          }
          // alert(msg);
          $('#select_theater').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
}

	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#selectDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy년mm월dd일",
									minDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									maxDate : 7
								});
			});
</script>

</head>

<body>

  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 20%;' />
      <col style='width: 30%;' />
      <col style='width: 20%;' />
      <col style='width: 30%;' />
    </colgroup>

    <thead>
      <TR>
        <TH class='reserve_th'>영화</TH>
        <TH class='reserve_th'>극장</TH>
        <TH class='reserve_th'>날짜</TH>
        <TH class='reserve_th'>시간</TH>
      </TR>
    </thead>
    
    <tbody>
      <tr>
        <!-- 영화 -->
        <td>
          <div>
            <A>예매율순</A> <A>가나다순</A>
          </div> 
          <c:forEach var="movieVO" items="${list }">
            <c:set var="movieno" value="${movieVO.movieno }" />
            <ul>
              <li>
              <a>${movieVO.movie }</a>
                <A href="javascript: update_form(${movieno });"><IMG src='./images/update.png' title='수정'></A>
                <A href="javascript: delete_form(${movieno });"><IMG src='./images/delete.png' title='삭제'></A>
              </li>
            </ul>
          </c:forEach>
          <button type="button" onclick="location.href='./create.do'" style='float: right;'>등록</button>
        </td>
        <!-- 영화 끝 -->
        
        <!-- 극장 -->
        <td>
          <c:forEach var="theaterVO" items="${list_theater }">
            <c:set var="theaterno" value="${theaterVO.theaterno }" />
            <ul>
              <li>
              <a href="javascript: theater_select(${theaterno });">${theaterVO.area }</a>
                <button type="button" onclick="location.href='../theater/create.do'" style='float: right;'>등록</button>
                <A href="javascript: update_form(${theaterno });"><IMG src='./images/update.png' title='수정'></A>
                <A href="javascript: delete_form(${theaterno });"><IMG src='./images/delete.png' title='삭제'></A>
              <DIV id=select_theater>${theaterVO.theater }</DIV>
              </li>
            </ul>
          </c:forEach>
        </td>
        <!-- 극장 끝-->
        
        <!-- 날짜 -->
        <td>
          <div>
            <input type="text" id="selectDate" placeholder="2019년01월01일">
          </div>
        </td>
        <!-- 날짜 끝-->
    </tbody>
  </TABLE>

  <%-- <jsp:include page="/menu/bottom.jsp" /> --%>
</body>

</html>
