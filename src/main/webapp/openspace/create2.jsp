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


<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript">

var sel_files = [];

$(document).ready(function () {
    $("#input_imgs").on("change", handleImgFileSelect);
  
});

function fileUploadAction() {
  console.log("fileUploadAction");
  $("#input_imgs").trigger('click');
  
}


function deleteimg(index) {
  console.log("index: "+index);
  sel_files.splice(index, 1);
  
  var img_id = "#img_id_"+index;
  $(img_id).remove();
  
  console.log(sel_files);
  
}

function handleImgFileSelect(e) {
  
  sel_files=[];
  $("imgs_wrap").empty();
  var files= e.target.files;
  var filesArr = Array.prototype.slice.call(files);
  
  var index = 0;
  filesArr.forEach(function(f) {
    if(!f.type.match("image.*")){
      alert("이미지만 가능")
      return
    }
    
    sel_files.push(f);
    
    var reader = new FileReader();
    reader.onload = function(e) {
      var html = "<a href='javascript:void(0);' onclick='deleteimg("+index+")' id='img_id_"+index+"' ><img style='width: 18%; margin: 8px;' src="+e.target.result+"></a>";
      $(".imgs_wrap").append(html);
      index++;
      
    }
    reader.readAsDataURL(f);
    
  });

}

//---------------------------------------------//

  $(function () {
    CKEDITOR.replace('openspace_content');  // <TEXTAREA>태그 id 값
  });
</script>

<script type="text/javascript">

window.onload = function() {
  document.getElementById('btn_send').onclick=send1;  
}
function send1() {
  if(frm.openspace_title.value.trim().length <=0){
    alert('제목을 입력해 주세요')
    frm.openspace_title.focus();
    return false//실행 중지
  }
  if(frm.openspace_seqno.value.trim().length ==0 || frm.py.value ==0){
    alert('순서를 입력해 주세요')
    frm.openspace_seqno.focus();
    return false//실행 중지
  }
  if(frm.openspace_division.value.trim() == "선택"){
    alert('구분을 선택 해주세요')
    frm.openspace_division.focus();
    return false//실행 중지
  }  
  frm.submit();  
}
</script>

</head>
<body>
  <div class="row">
    <jsp:include page="/menu/top3.jsp" flush='false' />
    <DIV style='width: 100%; margin: 0px auto;'>

    <!-- 사이드 매뉴 -->
    <jsp:include page="./side.jsp" flush="false"/>

      <div class="col-md-10" style="border-left: solid 1px #bbbbbb;">
        <div style="font-size: 30px; font-weight: bold; margin-left: 40px; margin-bottom: 10px;">
          공지사항 등록 &nbsp;</div>
        <form name='frm' method="post" action="./create.do" enctype="multipart/form-data" >
          <input type='hidden' name='admin_no' id='admin_no' value='1'>
          <div style=" width: 95%; margin: 0px auto;">
            <div style="width: 98%; margin: 20px auto; border: solid 1px #999999;">
              <div style="margin-left: 35px; margin-top: 25px;">
                <div style="margin-left: 30px;">
                  <br>
                  <div>
                    <span style="font-weight: bold;">제목 &nbsp;</span> <input
                      type='text' style="width: 70%;"
                      name='openspace_title'>
                  </div>
                  <br>                  
<!--                  
                  <div>
                    <span style="font-weight: bold;">순서 &nbsp;</span> <input
                      type="number"min="1" max="1000" step="1" style="width: 20%;" value="1"
                      name='openspace_seqno'>
                  </div>   
-->                
                  <br>
                  <div>
                    <span style="font-weight: bold;">구분 &nbsp;</span> <select
                      name='openspace_division'
                      style="height: 26px; width: 20%;">
                      <option value='공지'>&nbsp;&nbsp;공지</option>
                      <option value='업데이트'>&nbsp;&nbsp;업데이트</option>
                    </select>
                  </div>
                  <br>
                  <div>
                    <span style="font-weight: bold;">출력 &nbsp;</span> <select
                      name='openspace_visible'
                      style="height: 26px; width: 6%;">
                      <option value='Y' selected="selected" style="text-align: center;">&nbsp;&nbsp;Y</option>
                      <option value='N'>&nbsp;&nbsp;N</option>
                    </select>
                  </div>
                  
                  <br>
                  <div style='width: 80%; margin-left: 43px;'>                 
                    <textarea rows="10" name='openspace_content' id='openspace_content' required="required" style="width: 70%; height: 200px; margin-left: 13px;"></textarea>
                  </div>
                  
      
      <div class="input_wrap"  style='margin-top: 30px;'>   

       <div class='imgs_wrap'  style='border: solid 1px #000000;width: 80%; margin-left: 43px;'>
       
          <input type='file' class="form-control" name='fnamesMF'  id='input_imgs' 
                     value='' placeholder="파일 선택" multiple="multiple">
        <div style ='display: none'>
         </div>
        <img id="img">

      <div>
      </div>
      </div>
      
        <a class='btn btn-info' style='margin-left: 50px;' href="javascript:"onclick="fileUploadAction();">파일 업로드</a>
      </div>
                  
                  
                  <br>
                </div>
                <br>
                <div style="margin: 10px auto; text-align: center; margin-bottom: 30px;">
                  <button type="submit" id="btn_send">등록</button>
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