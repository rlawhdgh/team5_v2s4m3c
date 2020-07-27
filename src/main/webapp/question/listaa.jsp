<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <!-- 연습 메뉴바 시작  -->
    <div class="" style='background-color: #111; border: none' >
      <div>
          <a data-toggle="collapse" data-parent="#accordion" href="#abc"style='background-color: #111;padding-bottom: 0px;' >
          실험용
          </a>
      </div>
      <div id="abc" class="panel-collapse collapse">
        <div style='margin-left: 15px;'>
                
          <a data-toggle="collapse" data-parent="#accordion" href="#abcd"style='background-color: #111;padding-bottom: 0px; font-size: 20px;'>첫번째</a>
           <div id='abcd' class="panel-collapse collapse">
             <div style='margin-left: 15px;'>
               <a style="font-size: 16px; padding-bottom: 0px;" href="#"> 첫번째 첫번째</a>
               <a style="font-size: 16px; padding-bottom: 0px;" href="#"> 첫번째 두번째</a>
               <a style="font-size: 16px; padding-bottom: 0px;" href="#"> 첫번째 세번째</a>
             </div>
             
            </div> 
            
          <a data-toggle="collapse" data-parent="#accordion" href="#abcde"style='background-color: #111;padding-bottom: 0px; font-size: 20px;'>두번째</a>
          <div id="abcde" class="panel-collapse collapse">
            <div style='margin-left: 15px;'>
             <a style="font-size: 16px; padding-bottom: 0px;" href="#"> 두번째 첫번째</a>
             <a style="font-size: 16px; padding-bottom: 0px;" href="#"> 두번째 두번째</a>
             <a style="font-size: 16px; padding-bottom: 0px;" href="#"> 두번째 세번째</a>            
            </div>          
          </div> 
                 
          <a style="font-size: 16px; padding-bottom: 0px;" href="/team5/contact/create.jsp">세번째</a>
        </div>

      </div>
    </div>
<!-- 연습 메뉴바 종료 -->


