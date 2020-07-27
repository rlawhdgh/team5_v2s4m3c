<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>공지사항 등록</title>
<link href="/team5/css/style.css" rel='Stylesheet' type='text/css'>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
  <div class="row">
    <jsp:include page="/menu/top3.jsp" flush='false' />
    <DIV style='width: 100%; margin: 0px auto;'>

      <div class="col-md-2" style="margin-top: 20px;">
        <table class="table table-hover"
          style="border: none; width: 90%;">
          <thead>
            <tr>
              <th style="border: none; font-size: 20px;">고객지원</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td
                style="padding: 2px; padding-top: 8px; background-color: #F5F5F5;"><a
                href="/team5/openspace/list.do">공지사항</A></td>
            </tr>
            <tr>
              <td style="border: none; padding: 2px;"><a
                href="/team5/question/list.jsp">자주묻는질문</A></td>
            </tr>
            <tr>
              <td style="border: none; padding: 2px;"><a
                href="/team5/contact/create.jsp">문의하기</A></td>
            </tr>
            <tr>
              <td style="border: none; padding: 2px;"><a
                href="/team5/contact/list.jsp">문의내용 확인</A></td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="col-md-10" style="border-left: solid 1px #bbbbbb;">
        <div style="font-size: 30px; font-weight: bold; margin-left: 40px; margin-bottom: 10px;">
          공지사항 등록 &nbsp;</div>
        <form name='frm' method="post" action="./create.do">
          <input type='hidden' name='admin_no' id='admin_no' value='1'>
          <div style="height: 600px; width: 95%; margin: 0px auto;">
            <div style="width: 98%; margin: 20px auto; border: solid 1px #999999;">
              <div style="margin-left: 75px; margin-top: 25px;">
                <div style="margin-left: 30px;">
                  <br>
                  <div>
                    <span style="font-weight: bold;">제목 &nbsp;</span> <input
                      type='text' style="width: 70%;"
                      name='openspace_title'>
                  </div>
                  <br>
                  <div>
                    <span style="font-weight: bold;">순서 &nbsp;</span> <input
                      type="number"min="1" max="1000" step="1" style="width: 20%;" value="1"
                      name='openspace_seqno'>
                  </div>                  
                  <br>
                  <div>
                    <span style="font-weight: bold;">구분 &nbsp;</span> <select
                      name='openspace_division'
                      style="height: 26px; width: 20%;">
                      <option value='선택' selected="selected"
                        style="text-align: center;">&nbsp;&nbsp;선택</option>
                      <option value='공지'>&nbsp;&nbsp;공지</option>
                      <option value='업데이트'>&nbsp;&nbsp;업데이트</option>
                    </select>
                  </div>
                  <br>
                  <div>
                    <span style="font-weight: bold;">출력 &nbsp;</span> <select
                      name='openspace_visible'
                      style="height: 26px; width: 6%; ">
                      <option value='Y' selected="selected" style="text-align: center;">&nbsp;&nbsp;Y</option>
                      <option value='N'>&nbsp;&nbsp;N</option>
                    </select>
                  </div>
                  <br>
                  <div style="float: left; margin-top: 15px;">
                    <span style="font-weight: bold;">내용</span>
                  </div>
                  <div>
                    <textarea rows="10" name='openspace_content' id='openspace_content' style="width: 70%; height: 200px; margin-left: 13px;"></textarea>
                  </div>
                  <br>
                </div>
                <br>
                <div
                  style="margin: 10px auto; text-align: center; margin-bottom: 30px;">
                  <button type="submit">등록</button>
                  <button>취소</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>


    </DIV>
  </div>
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'></DIV>
    <DIV style='float: left; width: 50%;'></DIV>
  </DIV>

  <DIV style='width: 94.8%; margin: 0px auto;'></DIV>

  <jsp:include page="/menu/bottom.jsp" flush='false' />

</body>
</html>