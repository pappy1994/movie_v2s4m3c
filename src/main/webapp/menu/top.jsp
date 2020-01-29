<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value ="${pageContext.request.contextPath }"/>

<DIV class='container' style='width: 100%;'>
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_menu' >
    <DIV class='top_menu_label'>7조 영화 예약 시스템</DIV>
    <NAV class='top_menu_list'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='${root}' >홈페이지</A> <span class='top_menu1'> | </span>
      
      <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A class='menu_link'  href='${root}/members/login.do' >Login</A> <span class='top_menu1'> | </span>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='${root}/members/logout.do' >Logout</A> <span class='top_menu1'> | </span>
        </c:otherwise>
      </c:choose>
        
        <A class='menu_link'  href='${root}/customgrp/list.do'>카테고리 그룹</A> <span class='top_menu1'> | </span>            
        <A class='menu_link'  href='${root}/contentsmv/list.do?customgrpno=1'>공지사항</A><span class='top_menu1'> | </span>    
        <A class='menu_link'  href='${root}/boardgrp/list.do'>영화</A> <span class='top_menu1'> | </span>    
        <A class='menu_link'  href='${root}/members/list.do'>회원목록</A> <span class='top_menu1'> | </span>  
        
      <c:choose>
        <c:when test="${sessionScope.id_admins == null}">
          <A class='menu_link'  href='${root}/admins/login.do' >관리자 Login</A>
        </c:when>
        <c:otherwise>
          ${sessionScope.id_admins } <A class='menu_link'  href='${root}/admins/logout.do' >관리자 Logout</A> 
        </c:otherwise>
      </c:choose>
      
          
    </NAV>
  </DIV>
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-md-2"> <!-- 메뉴 출력 컬럼 -->      
      <%-- <div style='margin-top: 5px;'>
        <c:choose>
          <c:when test="${sessionScope.id == null}">           
            <form name='frm' method='POST' action='${root }/members/login.do'>
              <div class="form-group">
              <label for="inputEmail">아이디</label>
              <input type='text' class="form-control input-lg" name='id' id='id' 
                        value='${ck_id }' required="required" 
                        style='width: 80%;' placeholder="아이디" autofocus="autofocus">
                <div class="form-group">
                    <label class="form-check-label">
                    <input type="checkbox" name='id_save' value='Y' 
                                       ${ck_id_save == 'Y' ? "checked='checked'" : "" }>저장</label>
                </div>
               </div>
              <div class="form-group">
                <label for="inputPassword">패스워드</label>
                <input type='password' class="form-control input-lg" name='passwd' id='passwd' value='${ck_passwd }' 
                          required="required" style='width: 80%;' placeholder="패스워드">
              </div>              
            <button type="submit" class="btn btn-primary btn-md">로그인</button>
            <button type="butoon" onclick="location.href='${root}/members/create.do'"class="btn btn-primary btn-md">회원 가입</button>
           </form>
          </c:when>             
            <c:otherwise> 
            </div>
            --%>
            
            <c:if test="${sessionScope.id != null }">
               ${sessionScope.id }님<br>로그인을 환영합니다.<Br>
               <button type='button' onclick="location.href='${root}/members/logout.do'" class="btn btn-primary btn-md">로그아웃</button><span class='top_menu1'> | </span>
               <button type='button' onclick="location.href='${root}/members/read.do?mno=${sessionScope.mno }'" class="btn btn-primary btn-md">마이페이지</button>        
            </c:if>    
      
      <br>
       ★ <A href='${root}/contentsmv/list.do?customgrpno=1'>공지사항</A>★<br><br>
       ★ <A href='${root}/contentsmv/list_all.do'>전체글</A>
       
    </div>
      
    <DIV class="col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
   
<DIV class='content'>

