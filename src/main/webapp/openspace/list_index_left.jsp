<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<style type="text/css">
*{
color: #c7d5e0;
}
</style>
 

    <c:forEach var="openspace_title" items="${name_title_list}">
      <tr>
       <td>${openspace_title}</td>
      </tr>
    </c:forEach>

<br>
   