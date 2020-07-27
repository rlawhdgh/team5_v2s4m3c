<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table>
  <TR>
   <td>
   
   <table style ="width : 150%; margin : auto; border: 1px solid #444444; text-align: center;
          background-color: #ccccff;">
    <TR>
     <td>
     <ASIDE style='float: center;'>
      <h2>결제 정보</h2>              
     </ASIDE>
     </td>
     <td></td>
    </TR>
    <TR>
     <td style='text-align: center; border: 1px solid #444444; color:#ffffff;'>판매자</td>
     <td style='text-align: center; border: 1px solid #444444; color:#ffffff;'>UniqueGames</td>   
    </TR>
    <TR>
     <td style='text-align: center; border: 1px solid #444444; color:#ffffff;'>구매자</td>
     <td style='text-align: center; border: 1px solid #444444; color:#ffffff;'>김종호</td>   
    </TR>
    <TR>
     <td style='text-align: center; border: 1px solid #444444; color:#ffffff;'><h3>결제금액</h3></td>
     <td style='text-align: center; border: 1px solid #444444; color:#ffffff;' >100000</td>   
    </TR>     
   </table>
   </td>
  </TR>
  <TR>
   <td>
    <table style ="width : 150%; margin : auto; border: 1px solid #444444; text-align: center;">
     <TR>
      <td style='text-align: center; border: 1px solid #444444;' >카드 선택</td>
       <td style = 'border: 1px solid #444444;'> 
        <select name='' id='' class="form-control" style='width: 90%; '>
         <option value='신한은행'>신한은행</option>
         <option value='국민은행'>국민은행</option>          
         <option value='IBK기업은행'>IBK기업은행</option>         
         <option value='우리은행'>우리은행</option>         
         <option value='하나은행'>하나은행</option>         
         <option value='농협은행'>농협은행</option>         
         <option value='새마을금고'>새마을금고</option>         
        </select>    
       </td> 
     </TR>     
    </table>
    
    <br><br>
   </td> 
  </TR>
  <TR>
   <td>
   <form name='mailForm' method='post' action="./mail_proc.jsp">
    <table style ="width : 150%; margin : auto; border: 1px solid #444444; text-align: center;">
    <TR>
    <td style='text-align: center; border: 1px solid #444444;'>구매자 이메일</td>    
    <td class='td_left'>
          <input type="text" name="to" value='메일입력' class='input_basic' style='width: 90%;'>
          <input type="hidden" name="from" value='rlawhdgh4817@gmail.com' class='input_basic' style='width: 90%;'>
          <input type="hidden" name="subject" value="OJT 메일을 보냅니다. IP: 87" class='input_basic' style='width: 90%;'>
          <input type="hidden" name="content" value="게임구매가 완료되었습니다.">    
          <div  class="bottom_menu">
          <input type="submit" value="구매하기">
         <input type="button" value="취소" onclick="history.back()">
        </div>
       </td>        
      </TR>     
     </table>
    </form>
   </td>  
  </TR>
</table>
</body>
</html>