<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
<body>
 <span style='color: #000000; text-align: center;'>안녕 난 파업창이라고 해</span>
 <img src="/team5/css/images/images.jpg" style='height: 250px; width: 100%;'>
     <form name='frm' method='post' action='./notice_cookie.jsp'>
      <label style='text-align: right;'>
        <input type='checkbox' name='windowOpenCheck' onclick="this.form.submit()">
        <span style='color: #000000;'>30초간 창 열지 않기</span>
      </label>
    </form>
</body>
</html> 