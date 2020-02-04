<%@ page contentType="text/html; charset=UTF-8"%>

      </DIV> <!-- content END -->

    </DIV><!-- <DIV class="col-md-10 cont"> 종료 -->
  </DIV> <!-- <DIV class="row" style='margin-top: 2px;'> 종료 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value ="${pageContext.request.contextPath }"/>


  <!-- 화면 하단 메뉴 --> 
  <DIV style='text-align: left;'>
  
    <HR>
    <A class='menu_links'  href='${root}/contentsmv/list.do?customgrpno=1'>공지사항</A>
    <span class='top_menu1'> | </span>    
    <A class='menu_links'  href='${root}/members/list.do'>회원목록</A>
    <span class='top_menu1'> | </span>
        
   </DIV>      
   <div style = 'text-align: right;'>
    <hr>
      게시판 운영원칙 <span class='top_menu1'> | </span> 서비스 약관/정책 <span class='top_menu1'> | </span> 비즈니스 <span class='top_menu1'> | </span> 권리침해신고<span class='top_menu1'> | </span> 고객센터<br><br>
      위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며,<br>
      7조의 입장과 다를 수 있습니다.<br>
      Copyright © 7grp. All rights reserved.<Br>
    </div>
    
    
    
    <!-- Copyright Soldesk Blog All rights reserved<br>
    (HTML5 + CSS3 + JavaScript + jQuery + JAVA + JSP + Spring + MyBATIS + Oracle) -->
  

</DIV> <!-- container END -->  