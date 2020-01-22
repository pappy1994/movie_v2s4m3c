<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <ASIDE style='float: left;'>
    <A href='../boardgrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?boardgrpno=${param.boardgrpno }'>${boardgrpVO.name }</A> >
    수정
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?boardgrpno=${param.boardgrpno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <input type='hidden' name='boardgrpno' value='${boardgrpVO.boardgrpno }'>
      <input type='hidden' name='contentsbdno' value='${contentsbdVO.contentsbdno }'>
      <input type='hidden' name='nowPage' value='${param.nowPage }'>
       
      <div class="form-group">   
        <label class="col-md-1 control-label">제목</label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='title' value='${contentsbdVO.title}' required="required" style='width: 80%;'>
        </div>
      </div>   
    
      <div class="form-group">   
        <label class="col-md-1 control-label">내용</label>
        <div class="col-md-11">
          <textarea class="form-control input-lg" name='content' id='content' rows='10'>${contentsbdVO.content}</textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>예매율</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='mbook' value='${contentsbdVO.mbook }' placeholder="예매율">
        </div>
      </div>
      
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>제한 연령</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='mage' value='${contentsbdVO.mage }' placeholder="제한 연령">
        </div>
      </div>
      
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>개봉일</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='mopen' value='${contentsbdVO.mopen }' placeholder="개봉일">
        </div>
      </div>    
            
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>감독명</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='director' value='${contentsbdVO.director }' placeholder="감독명">
        </div>
      </div>    
     
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>배우</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='actor' value='${contentsbdVO.actor }' placeholder="배우">
        </div>
      </div> 

      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>러닝타임</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='runtime' value='${contentsbdVO.runtime }' placeholder="러닝타임">
        </div>
      </div>

      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>장르</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='genre' value='${contentsbdVO.genre }' placeholder="장르">
        </div>
      </div>  
          
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>유튜브 소스</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='youtube' value='${contentsbdVO.youtube }' placeholder="유튜브 소스">
        </div>
      </div>                    
          
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>검색어</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='word' value='${contentsbdVO.word }' placeholder="검색어">
        </div>
      </div>
      
      <DIV style='text-align: right;'>
        <button type="submit" class="btn btn-info">변경된 내용 저장</button>
        <button type="button" onclick="location.href='./list.do?boardgrpno=${boardgrpVO.boardgrpno}'" class="btn btn-info">취소[목록]</button>
      </DIV>
  </FORM>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 
 
 