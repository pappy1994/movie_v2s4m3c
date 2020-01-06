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
 
 <!-- Fotorama -->
 <link href="fotorama.css" rel="stylesheet">
 <script src="fotorama.js"></script>
 
 <style>
  .fadding-photo:hover { 
  opacity:0.4;
  }
 </style>
 
<script type="text/javascript">

function panel_img(file) {
  var tag = "";
  tag = "<A href=\"javascript: $('#attachbd_panel').hide();\">";
  tag += "  <IMG src='../attachbd/storage/" + file
      + "' style='width: 100%;'>";
  tag += "</A>";

  $('#attachbd_panel').html(tag);
  $('#attachbd_panel').show();
}

function panel_img2(file) {
  var tag = "";
  tag = "<A href=\"javascript: $('#attachbd_panel2').hide();\">";
  tag += "  <IMG src='./storage/" + file
      + "' style='width: 80%;'>";
  tag += "</A>";

  $('#attachbd_panel2').html(tag);
  $('#attachbd_panel2').show();
}

function create_rpl() {
  var frm_rpl = $('#frm_rpl');
  var params = frm_rpl.serialize();
  // alert('checkId() 호출됨: ' + params);
  // return;
  if ($('#mno', frm_rpl).val().length == 0) {
    $('#modal_title').html('댓글 등록'); // 제목 
    $('#modal_content').html("로그인 후 입력 가능합니다."); // 내용
    $('#modal_panel').modal();            // 다이얼로그 출력
    return;  // 실행 종료
  }
  
  // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
  // alert('내용 길이: ' + $('#content', frm_rpl).val().length);
  // return;
  if ($('#content', frm_rpl).val().length > 500) {
    $('#modal_title').html('댓글 등록'); // 제목 
    $('#modal_content').html("500자 이상 입력할 수 없습니다."); // 내용
    $('#modal_panel').modal();           // 다이얼로그 출력
    return;  // 실행 종료
  }
  
  $.ajax({
    url: "../rpl/create.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      if (rdata.count > 0) {
        $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
        msg = "댓글을 등록했습니다.";
      } else {
        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
        msg = "댓글 등록에 실패했습니다.";
      }
      
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#modal_panel').modal();              // 다이얼로그 출력
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


function list_by_contentsbdno(contentsbdno) {
  // alert(contentsbdno);
  var params = 'contentsbdno=' + contentsbdno;

  $.ajax({
    url: "../rpl/list_by_contentsbdno.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = '';  
      for (i=0; i < rdata.list.length; i++) {
        msg += rdata.list[i].content;
      }
      alert(msg);
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

function liketo(contentsbdno) {
  var params = 'contentsbdno=' + contentsbdno;
  // alert(params);

  $.ajax({
    url: "./liketo.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터 
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      
      $('#recom').html(rdata.recom);
      
    }, 
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: ' + request.status + '/' + error;
      console.log(msg);
    }
  });
}


</script>

</head>

<body>
<c:set var="boardgrpno" value="${boardgrpVO.boardgrpno}" />
<c:set var="contentsbdno" value="${contentsbdVO.contentsbdno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
 
   <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
 
  <ASIDE style='float: left;'>
    <!--  <A href='../boardgrp/list.do'>영화 게시판</A> >  -->
    <A href='./list.do?boardgrpno=${boardgrpno }'>${boardgrpVO.name }</A> >
    ${contentsbdVO.title}</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?boardgrpno=${boardgrpno }'>목록</A>
      <c:if test="${sessionScope.id != null}">
        <span class='menu_divide' > | </span> 
        <a href="../attachbd/create.do?contentsbdno=${contentsbdno}&boardgrpno=${boardgrpVO.boardgrpno}">첨부 파일 등록</A>
        <span class='menu_divide' > | </span> 
        <a href="./file_delete.do?contentsbdno=${contentsbdno}&boardgrpno=${boardgrpVO.boardgrpno}">첨부 파일 삭제</A>
        <span class='menu_divide' > | </span> 
        <A href='./update.do?boardgrpno=${boardgrpno }&contentsbdno=${contentsbdno}'>수정</A>
        <span class='menu_divide' > | </span> 
        <A href='./delete.do?boardgrpno=${boardgrpno }&contentsbdno=${contentsbdno}'>삭제</A>
      </c:if>
  </ASIDE> 
  
  <div class='menu_line'></div>
  
  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="contentsbdno" value="${contentsbdno}">

     <DIV id='attachbd_panel2' style="width: 100%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
     <br>
      <div style='width: 92%; margin: 0px auto;'> 
         <c:set var="fname" value="${contentsbdVO.fname.toLowerCase() }" />             
          <c:choose>
            <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
             <A href="javascript:panel_img2('${contentsbdVO.fname }')"><IMG class="fadding-photo" src="./storage/${contentsbdVO.fname }" style='float: left; height: 280px; 
                 display: table-cell; vertical-align: middle; text-align: center;'></A>
            </c:when>    
          <c:otherwise>
          ${contentsbdVO.fname} 
          </c:otherwise>     
          </c:choose>    
        
      <div style='float: left; width: 33%; padding-left: 2%;'>
        <div style='font-size: 0.85em;'>
         <span style='font-size: 1.5em; font-weight: bold;'> ${contentsbdVO.title} </span><br>
            예매율: <span style='font-size: 1.2em;'> ${contentsbdVO.mbook }% </span><br>
          ${contentsbdVO.mopen } 개봉, ${contentsbdVO.runtime }분, ${contentsbdVO.mage } 관람가<br>
            감독: <span style='color: #6a00d5; font-size: 0.91em;'>${contentsbdVO.director } </span> <br>
            출연진: <span style='color: #6a00d5; font-size: 0.91em;'>${contentsbdVO.actor } </span> <br>
          ${contentsbdVO.genre }
        </div>
         <br> 
         <div style='border-top: solid 2px #eaeaea;'></div> <br>
         <div>
          <button type='button' onclick="location.href=''" class="btn">예매하기</button>  
          <button type='button' onclick="liketo(${contentsbdVO.contentsbdno});" class="btn btn-danger">좋아요<img src='./images/heart.png' style='width:14px'>
          </button> 
          <br> 
          <img src='./images/heart_w.png' style='width:14px'> 
          <span id='recom' style='font-size: 0.84em; color: red;'>${contentsbdVO.recom }</span><span style='font-size: 0.84em;'>만큼 좋아해요!</span>
         </div>
      </div>
      
        <ul style='clear: both; width: 100%;'> 
         <br> 
          <li class="li_none" style='text-align: center;'> <!-- 예고편 유튜브 -->         
           <DIV style='width: 949px; height: 534px; margin: 10px auto;'>
                ${contentsbdVO.youtube }                     
           </DIV>
           <br>
          </li>
     
          <li class="li_none">
           <DIV style='border-top: solid 2px #eaeaea;'></DIV> <br>
            ${contentsbdVO.content }
          </li>            
          
          <li class="li_none"> <!-- 포토라마 넣을 곳 -->
           <DIV style='border-top: solid 2px #eaeaea;'></DIV> <br>
            <DIV id='attachbd_panel' style="width: 100%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;'>
          <!-- Fotorama -->
            <div class="fotorama" data-width="700" data-ratio="700/467" data-max-width="100%"
                 style='margin: 0px auto; width: 50%;'>
            <c:forEach var="attachbdVO" items="${attachbd_list }">
              <c:set var="aname" value="${attachbdVO.aname.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${aname.endsWith('jpg') || aname.endsWith('png') || aname.endsWith('gif')}">
                  <IMG class="fadding-photo" src='../attachbd/storage/${aname }' style='margin-top: 2px;'>
                </c:when>
              </c:choose>
            </c:forEach>
            </div>
          </li>

          <li class="li_none">
            <!-- 댓글 영역 시작 -->
            <DIV style='width: 80%;'>
              <HR>
              <FORM name='frm_rpl' id='frm_rpl'>
                <input type='hidden' name='contentsbdno' id='contentsbdno' value='${contentsbdno}'>
                <input type='hidden' name='mno' id='mno' value='${sessionScope.mno}'>
                
                <textarea name='content' id='content' style='width: 100%; height: 60px;' placeholder="(500자 이내) 로그인 후 이용 가능합니다."></textarea>
                <input type='password' name='passwd' id='passwd' placeholder="비밀번호">
                <button type='button' id='btn_create' onclick="create_rpl();">등록</button>
              </FORM>
              <HR>
              <DIV id='panel_rpl'>
              
              </DIV>
              
            </DIV>
            <!-- 댓글 영역 종료 -->
             <br>
          </li>
         
          <li class="li_none">
           <DIV style='border-top: solid 2px #eaeaea;'></DIV> <br>
            <DIV style='font-size: 0.91em;'> 검색어:
            <span style='color: #6a00d5; font-size: 0.91em;'>${contentsbdVO.word }</span></DIV>
            <br>
          </li>
        </ul>
      </div>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  