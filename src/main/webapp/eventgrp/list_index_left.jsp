<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
 
       ▷ <A href='${root}/econtents/list_all.do'>전체글(${total_count })</A>
    
       <UL style='padding-left: 30px;'>   
         <c:forEach var="eventgrpVO" items = "${list }">
           <c:set var="eventgrpno" value="${eventgrpVO.eventgrpno }" />
           <li style='font-size: 0.9em;'>
             <A href='${root}/econtents/list.do?eventgrpno=${eventgrpno }' style='font-size: 0.9em;'>${eventgrpVO.name }</A> (${eventgrpVO.cnt })           
           </li>     
         </c:forEach> 
       </UL>
  
  
  
  
  
  
       