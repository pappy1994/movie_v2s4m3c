<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>movie reserve</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 날짜 선택 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<!-- 좌석 선택 js -->
<script type="text/javascript" src="./tool.js"></script>

<!-- 결제창 -->
<script>
function payment(){
    window.open("./pay.jsp", "결제창", "width=850, height=650, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
} 
</script>

<script type="text/javascript">
/* 영화선택 */
function list_movie_select(contentsbdno) {
    // alert(contentsbdno);
    var params = 'contentsbdno=' + contentsbdno;

    $.ajax({
      url: "../contentsbd/read_json.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata); 
        var msg = '';
        $('#select_movie').html(''); // 패널 초기화, val(''): 안됨
          
        msg += "영화: " + rdata.title;
            
        // alert(msg);
        $('#select_movie').append(msg);
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

/* 지역선택 */
function list_theater_select(areano) {
    // alert(areano); 
    var params = 'areano=' + areano;

    $.ajax({
      url: "../theater_list_admins/list_theater_select.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata); 
        var msg = '';
        $('#select_theater').html(''); // 패널 초기화, val(''): 안됨
          
        for (i=0; i < rdata.list_theater_select.length; i++) {
          var row = rdata.list_theater_select[i];
            
          msg += " <li><A href='javascript:list_theater_select2("+row.theaterno+")'>";
          msg += row.theater
          msg += "</A></li>";
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

/* 극장선택 */
function list_theater_select2(theaterno) {
    // alert(theaterno);
    var params = 'theaterno=' + theaterno;

    $.ajax({
      url: "../theater_list_admins/list_theater_select2.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata); 
        var msg = '';
        $('#select_theater2').html(''); // 패널 초기화, val(''): 안됨
            
          msg += "극장: " +  "CGV" + rdata.theater + "<br>";
          msg += "날짜: " + "<input type='text' id='test' style='border: none; background-color: transparent;' value='' disabled>"

        // alert(msg);
        $('#select_theater2').append(msg);
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

/* 시간선택 */
function list_movie_time_select(movie_timeno) {
    // alert(movie_timeno);
    var params = 'movie_timeno=' + movie_timeno;

    $.ajax({
      url: "../movie_time_admins/list_movie_time_select.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata); 
        var msg = '';
        $('#select_mtime').html(''); // 패널 초기화, val(''): 안됨
            
          msg += "시간: " + rdata.mtime;
            
        // alert(msg);
        $('#select_mtime').append(msg);
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

/* 날짜선택 */

	$(function() {
		$("#Datepicker").datepicker(
				{
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					dateFormat : "yy년mm월dd일",
					showMonthAfterYear: true,
					yearSuffix: '년',
					minDate : -0,
					maxDate : "+3D",
				  altField: "#test"
				});
	});
</script>

</head>

<body>
  
  <jsp:include page="/menu/top.jsp" />
  <TABLE class='table-reserve'>
    <colgroup>
      <col style='width: 20%;' />
      <col style='width: 28%;' />
      <col style='width: 15%;' />
      <col style='width: 5%;' />
      <col style='width: 32%;' />
    </colgroup>

    <thead>
      <TR>
        <TH class='th_reserve'>영화</TH>
        <TH class='th_reserve'>극장</TH>
        <TH class='th_reserve'>날짜</TH>
        <TH class='th_reserve'>시간</TH>
        <TH class='th_reserve'>좌석</TH>
      </TR>
    </thead>
    
    <tbody style="background-color: #e6e6e6;">
      <tr>
        <!-- 영화 -->
        <td>
          <div>
          </div> 
          <c:forEach var="contentsbdVO" items="${list_movie }">
            <c:set var="contentsbdno" value="${contentsbdVO.contentsbdno }" />
            <ul>
              <li class="li_none">
              <a href="javascript: list_movie_select(${contentsbdno});">${contentsbdVO.title }</a>
              </li>
            </ul>
          </c:forEach>
        </td>
        <!-- 영화 끝 -->
        
        <!-- 극장 -->
        <td>
          <c:forEach var="areaVO" items="${list_area }">
            <c:set var="areano" value="${areaVO.areano }" />
            <ul>
              <li class="li_none">
                  <a href="javascript: list_theater_select(${areano});">${areaVO.area }</a>(${areaVO.cnt })
                <DIV id=select_theater style='float: right;'></DIV></li>
            </ul>
          </c:forEach></td>
        <!-- 극장 끝-->
        
        <!-- 날짜 -->
        <td>
          <input type="text" id="Datepicker" value="">
        </td>
        <!-- 날짜 끝-->
        
        <!-- 시간 시작 -->
        <td>
        <c:forEach var="movie_timeVO" items="${list_movie_time }">
            <c:set var="movie_timeno" value="${movie_timeVO.movie_timeno }" />
            <ul>
              <li class="li_none"><a href="javascript: list_movie_time_select(${movie_timeno});">${movie_timeVO.mtime }</a>
                <DIV id=select_theater style='float: right;'></DIV></li>
            </ul>
          </c:forEach>
          </td>
        <!-- 시간 끝 -->
        
        <!-- 좌석 시작 --> 
        <td>
          <form name='frm'>
            <ul>
<!--               <li class='li_none'>좌석: <input type='text' name='seat' value='' required="required"> 열
              </li> -->
              
              <li class='li_none'>인원: <input type='number' name='cnt' value='' step='1' min='1' max='10'> 명
              </li>
              <li class="li_none">좌석 선택</li>
                <li style='text-align: center;' class="li_none">스크린</li>
              <li class='li_none'>
                <input type='checkbox' name='seat' value='a1' required="required"> a1
                <input type='checkbox' name='seat' value='a2' required="required"> a2
                <input type='checkbox' name='seat' value='a3' required="required"> a3
                <input type='checkbox' name='seat' value='a4' required="required"> a4
                <input type='checkbox' name='seat' value='a5' required="required"> a5
                <input type='checkbox' name='seat' value='a6' required="required"> a6
                <input type='checkbox' name='seat' value='a7' required="required"> a7
              </li>
              <li class='li_none'> 
                <input type='checkbox' name='seat' value='b1' required="required"> b1
                <input type='checkbox' name='seat' value='b2' required="required"> b2
                <input type='checkbox' name='seat' value='b3' required="required"> b3
                <input type='checkbox' name='seat' value='b4' required="required"> b4
                <input type='checkbox' name='seat' value='b5' required="required"> b5
                <input type='checkbox' name='seat' value='b6' required="required"> b6
                <input type='checkbox' name='seat' value='b7' required="required"> b7
              </li>
              <li class='li_none'> 
                <input type='checkbox' name='seat' value='c1' required="required"> c1
                <input type='checkbox' name='seat' value='c2' required="required"> c2
                <input type='checkbox' name='seat' value='c3' required="required"> c3
                <input type='checkbox' name='seat' value='c4' required="required"> c4
                <input type='checkbox' name='seat' value='c5' required="required"> c5
                <input type='checkbox' name='seat' value='c6' required="required"> c6
                <input type='checkbox' name='seat' value='c7' required="required"> c7
              </li>
              <li class='li_none'> 
                <button type='button' id="btn_price">금액 확인</button>
                <button type='button' id="btn_order">예약</button>
            </li>
          </ul>
          </form>
        </td>
        <!-- 좌석 끝 -->
    </tbody>
  </TABLE>


  <table class='table-reserve'>
    <thead class='th_reserve_check'>
      <TR>
        <th id='select_movie'>영화 선택</th>
        <td></td>
      </tr>
      <tr>
        <th id='select_theater2'>극장 선택</th> 
        <td></td>
      </tr>
      <tr>
        <td id='select_mtime'>시간 선택</td>
        <td></td>
      </tr>
      <tr>
        <th id='panel1'>좌석 선택</th>
        <td></td>
      </tr>
      <tr>
        <th></th>
        <td>
          <div id='panel2'></div>
        </td>
      </tr>
    </thead>
  </table>

  <jsp:include page="/menu/bottom.jsp" />
</body>

</html>
