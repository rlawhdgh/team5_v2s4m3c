
		/*[입력한 ID 유효성 검사 후 중복확인 팝업 표시]*/
		function CheckID(TextBoxControl, showPop, disableNullAlert, valueReset)
		{
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if (inputValue.length ==0)
			{
				alert("사용자 아이디를 입력하세요.");
				if(valueReset){TextBoxControl.value="";}
				TextBoxControl.focus();
				return false;
			}
			//1.입력값체크
			if(inputValue.replace(/[A-Za-z0-9]/g,"").length!=0){
				alert("아이디에는 영문자, 숫자만 사용하실 수 있습니다.");
				if(valueReset){TextBoxControl.value="";}
				TextBoxControl.focus();
				return false;
			}
			
			//1.공백문자체크
			if(TextBoxControl.value.indexOf(' ') >= 0)
			{
				alert("아이디에는 띄어쓰기는 사용할 수 없습니다.");
				TextBoxControl.value = TextBoxControl.value.replace(/ /g, "") ;
			  TextBoxControl.focus();
		
				return false;
			}

			//2.길이체크
			if (inputValue.length < 4 || inputValue.length > 12) {
				alert("아이디는 4글자 이상, 12글자 이하입니다.");
				if(valueReset){TextBoxControl.value="";}
				TextBoxControl.focus();
				return false;
			}
			//3.중복체크 팝업 표시
			if(showPop){
				pop = window.open ('Popup/CheckID.aspx?memb_id=' + inputValue,'CheckID','width=500,height=250');
				pop.focus();
			}
			return true;				
		}
		
		/*[입력한 이메일 유효성 검사 후 중복확인 팝업 표시]*/	
		function CheckEmail(TextBoxID, TextBoxDomain, ComboBoxDomain, showPop, disableNullAlert)
		{			
			emailID = TextBoxID.value.replace(/ /g, "") ;
			if (disableNullAlert && emailID.length ==0) {return false;}

			if(emailID.length ==0)
			{
				alert("이메일 아이디를 입력하세요");
				TextBoxID.focus();
				return false;		
			}
			emailID = TextBoxID.value

			if(ComboBoxDomain.value.length == 0)
			{
				alert("이메일 도메인을 선택하세요");
				ComboBoxDomain.focus();
				return false;			
			}
			if(emailID.indexOf(".")==0 || emailID.indexOf(";")>-1 || emailID.indexOf(" ")>-1 || emailID.replace(/[A-Za-z0-9._\-]/g,"").length!=0)
			{
				alert("이메일 형식이 올바르지 않습니다.");
				TextBoxID.focus();
				return false;
			}
			if(ComboBoxDomain.value == "direct_input") {emailDomain=TextBoxDomain.value;}
			else {emailDomain=ComboBoxDomain.value;}

			if(emailDomain.indexOf(".")<1 || emailDomain.indexOf(".")>= emailDomain.length-1 || emailDomain.indexOf(";")>-1
				|| emailDomain.indexOf(" ") >-1 
				|| emailDomain.charAt(emailDomain.length-1) == "."
				|| emailDomain.replace(/[A-Za-z0-9._\-]/g,"").length!=0)
			{
				alert("이메일 형식이 올바르지 않습니다.");
				TextBoxDomain.focus();
				return false;
			}
			
			//3.중복체크 팝업 표시
			if(showPop){
				pop = window.open ('Popup/CheckEmail.aspx?email=' + emailID+ '@' + emailDomain,'CheckEmail','width=500,height=250');
				pop.focus();
			}
			return true;	
		}	
		
		// 성명 체크
		function CheckName(TextBoxControl, disableNullAlert) {
			inputValue = TextBoxControl.value;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if (inputValue.length < 2)
			{	
				alert("이름은 2자 이상이어야 합니다.") ;
				TextBoxControl.value="";
				TextBoxControl.focus();
				return false;		
			}
			
			return true;
		}
		
		/*[비밀번호 질문 UI 변경 (직접입력 or 선택)]*/
		function ShowHideQuestionText(ComboBox, SpanQuestion, TextBoxQuestion, TextBoxAnswer)
		{
			if(ComboBox.value == "direct_input")
			{
				SpanQuestion.style.display='block';
				TextBoxQuestion.focus();
			}
			else 
			{
				SpanQuestion.style.display='none';
				TextBoxAnswer.focus();
			}
		}
		
		/*[이메일 도메인 UI 변경 (직접입력 or 선택)]*/
		function ShowHideEmailDomainText(ComboBox, SpanDisplay1, SpanDisplay2, SpanDisplay3, TextBoxEmailDomain)
		{
			if(ComboBox.value == "direct_input")
			{
				ShowEmailDomainText(SpanDisplay1, SpanDisplay2, SpanDisplay3);
				TextBoxEmailDomain.value="";
				TextBoxEmailDomain.focus();
			}
			else 
			{
				HideEmailDomainText(SpanDisplay1, SpanDisplay2, SpanDisplay3);
			}
		}
		
		/*[이메일 도메인 UI 변경 (직접입력 숨기기)]*/
		function HideEmailDomainText(SpanDisplay1, SpanDisplay2, SpanDisplay3)
		{
			SpanDisplay1.style.display='none';
			SpanDisplay2.style.display='none';
			SpanDisplay3.style.display='none';
		}
		/*[이메일 도메인 UI 변경 (직접입력 보이기]*/
		function ShowEmailDomainText(SpanDisplay1, SpanDisplay2, SpanDisplay3)
		{
			SpanDisplay1.style.display='block';
			SpanDisplay2.style.display='block';
			SpanDisplay3.style.display='block';
		}
		
		/*[숫자값으로만 구성되었는지 검증]*/
		function CheckOnlyNumber(TextBoxControl, disableNullAlert)
		{	
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if(inputValue.replace(/\d/g,"").length!=0)
			{
				alert("숫자만 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}	
			return true ;
		}
		
		/*[다음 콘트롤로 커서 이동]*/
		function MoveToNextControl(Control1, Control2, count)
		{
			if(Control1.value.length==count) 
			{
				Control2.focus();
			}
		}		
		
		/*[주민등록번호 앞 6자 검증]*/
		function CheckSsn1(TextBoxControl, disableNullAlert)
		{		
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length ==0) {
				alert("주민등록번호를 넣어주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}

			if (inputValue.length !=6) {
				alert("주민등록번호 앞자리는 6자입니다. 다시 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			
			return true ;
		}
		
		/*[주민등록번호 뒤 7자 검증]*/
		function CheckSsn2(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if (inputValue.length !=7) {
				alert("주민등록번호 뒷자리는 7자입니다. 다시 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			// 0,9일때만 에러 처리(1800년대 출생자는 사용안하는 것으로 가정)
			if ((inputValue.charAt(0)=='9') || (inputValue.charAt(0)=='0')) {
				alert("잘못된 양식입니다. 다시 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			return true ;
		}

		/*[법인등록번호 앞 6자 검증]*/
		function CheckSsn1Company(TextBoxControl, disableNullAlert)
		{		
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length ==0) {
				alert("법인등록(사업자주민)번호 앞자리를 입력하세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}

			if (inputValue.length !=6) {
				alert("법인등록번호 앞자리는 6자입니다. 다시 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[법인등록번호 뒤 7자 검증]*/
		function CheckSsn2Company(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if (inputValue.length ==0) {
				alert("법인등록(사업자주민)번호 뒷자리를 입력하세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if (inputValue.length !=7) {
				alert("법인등록번호 뒷자리는 7자입니다. 다시 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[사업자등록번호 앞 3자 검증]*/
		function CheckBusinessRegistrationNumber1(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length ==0) {
				alert("사업자등록번호를 넣어주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}

			if (inputValue.length !=3) {
				alert("사업자등록번호 앞자리는 3자입니다. 다시 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[사업자등록번호 중간 2자 검증]*/
		function CheckBusinessRegistrationNumber2(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length !=2) {
				alert("사업자등록번호 뒷자리는 2자입니다. 다시 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[사업자등록번호 뒤 5자 검증]*/
		function CheckBusinessRegistrationNumber3(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length !=5) {
				alert("사업자등록번호 뒷자리는 5자입니다. 다시 입력해주세요.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[우편번호 앞,뒤 3자 검증]*/
		function CheckPostNo(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length !=3) {
				alert("우편번호를 선택하세요.") ;
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[휴대폰 체크]*/
		function CheckMobilePhone(ComboBox1, TextBox2, TextBox3, isOptional, disableNullAlert)
		{
			tel1 = ComboBox1.value.replace(/ /g, "") ;
			tel2 = TextBox2.value.replace(/ /g, "") ;
			tel3 = TextBox3.value.replace(/ /g, "") ;
			if(isOptional==false)
			{
				if(tel1.length==0){
					alert("휴대폰번호를 입력해 주세요.") ;	
					ComboBox1.focus();	
					return false;
				}
			}
			if(tel1.length!=0){
				if(tel2.length ==0){
					alert("휴대폰번호를 확인하여 주세요.") ;					
					TextBox2.value="";	
					TextBox2.focus();	
					return false;
				}
				if(tel3.length ==0){
					alert("휴대폰번호를 확인하여 주세요.") ;					
					TextBox3.value="";	
					TextBox3.focus();	
					return false;
				}
			}
			if(tel1.length==0){
				if(tel2.length !=0 || tel3.length !=0){
				alert("휴대폰번호를 확인하여 주세요.") ;
				ComboBox1.focus();	
				return false;
				}
			}		
			return true;
		}
		
		/*[일반전화 체크]*/
		function CheckLinePhone(ComboBox1, TextBox2, TextBox3, isOptional, msg1)
		{
			tel1 = ComboBox1.value.replace(/ /g, "") ;
			tel2 = TextBox2.value.replace(/ /g, "") ;
			tel3 = TextBox3.value.replace(/ /g, "") ;
			
			if(isOptional==false)
			{
				if(tel1.length==0){
					alert(msg1+"를 입력해 주세요.") ;	
					ComboBox1.focus();	
					return false;
				}
			}
			if(tel1.length!=0){
				if(tel2.length==0){
					alert(msg1+"를 확인하여 주세요.") ;	
					TextBox2.value="";	
					TextBox2.focus();	
					return false;
				}
				if(tel1.indexOf("1")!=0 && tel3.length==0){
					alert(msg1+"를 확인하여 주세요.") ;	
					TextBox3.value="";	
					TextBox3.focus();	
					return false;
				}
			}			
			if(tel1.length==0){
				if(tel2.length !=0 || tel3.length !=0){
					alert(msg1+"를 확인하여 주세요.") ;
					ComboBox1.focus();	
					return false;
				}
			}
			return true;
		}		
		
		//(일단 2006-02-09일 asp 그대로 사용, 향후 보완 필요)
		function CheckValidSSN( vSSN )
		{
			var strSSN = vSSN.toString();
			a = strSSN.substring(0, 1);
			b = strSSN.substring(1, 2);
			c = strSSN.substring(2, 3);
			d = strSSN.substring(3, 4);
			e = strSSN.substring(4, 5);
			f = strSSN.substring(5, 6);
			g = strSSN.substring(6, 7);
			h = strSSN.substring(7, 8);
			i = strSSN.substring(8, 9);
			j = strSSN.substring(9, 10);
			k = strSSN.substring(10, 11);
			l = strSSN.substring(11, 12);
			m = strSSN.substring(12, 13);
			month = strSSN.substring(2,4);
			day = strSSN.substring(4,6);
			strSSN1 = strSSN.substring(0, 7);
			strSSN2 = strSSN.substring(7, 13);
		
			// 482 외국인등록증 check
			if(g>=5 && g<=8)
			{
				if(CheckForeignSSN(strSSN))
					return 'Y';
				else
					return 'N';
			}else{
				/* 월일 valid check */
				if(month <= 0 || month > 12) return 'N';
				if(day <= 0 || day > 31) return 'N';
		
			/* 주민등록뒷자리 첫번째 번호 유효성 체크 (1,2,3,4) are only valid  */
				if(g > 4 || g == 0) return 'N';
			
				/* 주민등록번호에 공백이 들어가도 가입이 되는 경우가 발생하지 않도록 */
				if (isNaN(strSSN1) || isNaN(strSSN2))
				{
					return 'N';
				}
			
				temp=a*2+b*3+c*4+d*5+e*6+f*7+g*8+h*9+i*2+j*3+k*4+l*5;
				temp=temp%11;
				temp=11-temp;
				temp=temp%10;
			    
				if(temp == m)
					return 'Y';
				else
					return 'N'; 
			}	        
		}

		// 482 외국인등록증 check logic(일단 2006-02-09일 asp 그대로 사용, 향후 보완 필요)
		function CheckForeignSSN(fgnno)
		{
			if(fgnno.length!=13){	return false }	
			buf = new Array(13);
			for(i=0; i<13; i++) { buf[i]=parseInt(fgnno.charAt(i)); }
			if( (buf[11]!=7) && (buf[11]!=8) && (buf[11]!=9) ) {
					return false;
			}
			return true;
		}
		
		/*****************************************
			비밀번호 검증 함수
			2008-02-12 박철진 로직 재구성
			2008-08-04 박형만 로직 재구성(BC1023) 
		******************************************/
		/*[입력한 비밀번호 유효성 검사]*/
		
		var passwordType = 6;
		
		// 패스워드 클래스
		function PasswordValidation()
		{
			this.strSecType = "" ;
			this.strHtml = "";

			this.setInit = function(){
				this.strSecType="";
				this.strHtml = "";
				if(document.getElementById("bmsgPassword1")!=null){document.getElementById("bmsgPassword1").innerHTML =objPw.getHtml("");}
				if(document.getElementById("bmsgPassword2")!=null){document.getElementById("bmsgPassword2").style.display="none";}
			}
		}

		PasswordValidation.prototype.getType = getPasswordValidateType;
		PasswordValidation.prototype.getHtml = getPasswordValidateHtml;
		
		var objPw = new PasswordValidation();

		function CheckPasswordWithIDnSSN(passwordControl, disableNullAlert, id, ssn)
		{
			if(!CheckPasswordWithID(passwordControl, disableNullAlert, id))
				return false;

			var pwd1=passwordControl.value;
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y') //키보드 보안동작시
			{
				pwd1=GetPwdValue_K(passwordControl.form,passwordControl,"KingsE2E", "", "");
			}
			
			//SSN과 비밀번호가 4자 이상 중복되는지 체크
			if(checkDuplicate(ssn, pwd1, 4) == false)
			{
				objPw.setInit();
				alert("소중한 회원정보 보호를 위하여\n회원님 주민(법인)등록번호 일부가 포함된 비밀번호는 사용할 수 없습니다.");
				passwordControl.value ="";
				passwordControl.value ="";
				passwordControl.focus();
				return false;
			}
			return true;
		}
		
		function CheckPasswordWithID(passwordControl, disableNullAlert, id)
		{
			if(!CheckPassword(passwordControl, disableNullAlert))
				return false;

			var pwd1=passwordControl.value;
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y') //키보드 보안동작시
			{
				pwd1=GetPwdValue_K(passwordControl.form,passwordControl,"KingsE2E", "", "");
			}
			
			//ID와 비밀번호가 4자 이상 중복되는지 체크
			if(checkDuplicate(id, pwd1, 4) == false)
			{
				alert("소중한 회원정보 보호를 위하여\n회원님 ID 일부가 포함된 비밀번호는 사용할 수 없습니다.");
				objPw.setInit();
				passwordControl.value ="";
				passwordControl.value ="";
				passwordControl.focus();
				return false;
			}
			return true;
		}
		
		function CheckPassword(passwordControl, disableNullAlert)
		{
			var bFlag = true ;
			if (disableNullAlert && passwordControl.value.length ==0) {return false;}

			var secType = objPw.getType(passwordControl) ; 
			if( secType.length == 2 ) 
			{				
				if(parseInt(secType.split("")[0]) < 2) //사용불가
				{
					bFlag=false;
				}
			}
			else
			{
				bFlag=false;
				
			}
			if(bFlag==false)
			{
				alert("비밀번호는 영문,숫자,특수문자중 두가지를 포함한\n"+ passwordType+"~15자리 문자로 입력하셔야 합니다");
				objPw.setInit();
				passwordControl.value = "" ; 
				passwordControl.focus();
				return false ; 
			}
			return true;
		}
		
		/*[입력한 비밀번호 일치 검사]*/
		function CheckPasswordSync(TextBoxControl1, TextBoxControl2, disableNullAlert) 
		{
			var bFlag = true ;
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y') //키보드 보안동작시
			{
				if(stringOP_K('strcmp', TextBoxControl1, TextBoxControl2)==false) //kdefense_object.js
				{			
					bFlag=false;
				}
			}
			else
			{
				var pwd1 = TextBoxControl1.value.replace(/ /g, "") ;
				var	pwd2 = TextBoxControl2.value.replace(/ /g, "") ;

				if (disableNullAlert && pwd1.length ==0) {return false;}
				if (disableNullAlert && pwd2.length ==0) {return false;}
				if (pwd1.length == 0 || pwd1 != pwd2) 
				{
					bFlag=false;
				}
			}

			if(bFlag==false)
			{
				alert('입력하신 두개의 비밀번호가 일치하지 않습니다.');
				objPw.setInit();
				TextBoxControl1.value='';
				TextBoxControl2.value='';
				TextBoxControl1.focus();
				return false;
			}
			return true;
		}
		
		
		/* 2008-08-05 BC1023 관련 비밀번호체크 TypeCode ( 앞자리 숫자가 2 이상일때 사용가능 ) 
		
		00	PW 숫자가 7자 이하일때 
		01	숫자만 입력됐을때
		02	영문만 입력됐을때
		03	특수문자만 입력됐을떄
		04	연속되는 숫자와 문자를 사용했을 때 (일련 자판 포함)
		05	동일한 문자, 숫자가 4개 반복됐을때
		11	8자 이상으로 숫자만 입력됐을때
		12	8자 이상으로 영문만 입력됐을때
		13	8자 이상으로 특수문자만 입력됐을떄
		21	8자 이상으로 영문, 숫자, 특수문자 중 2가지 문자가 포함된 경우
		31	8자 이상으로 영문, 숫자, 특수문자가 모두 포함된 경우
		*/
		
		function getPasswordValidateType(objPassWord)
		{
			getPasswordValidateType(objPassWord, "");
		}

		// 비밀번호타입체크 : 키보드 입력시 마다 체크 (숫자영문특수문자포함여부,연속문자체크만)
		// 키보드 보안작동시(암호화) Kdefense 제공 함수를 이용하여 유효성검사
		// - 현재 연속4자리 문자 체크는 Kdefense 에서 지원하지 않음 : 입력값을 복호화하여 체크
		function getPasswordValidateType(objPassWord, type)
		{
			var pwdLength = objPassWord.value.length
			if (type == "E") passwordType = 8
			
			if(pwdLength==0)
				return "";

			//전체여부
			var isOnlyNum = false ;
			var isOnlyEng = false ;
			var isOnlySpc = false ;
			
			//키보드 보안 작동시
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y')
			{
				var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"; // 영문
				var nums = "0123456789"; //숫자
				var percul = "!@#$%^&*()\"_\/+=\-\[\]{}';:?<>.,~`|\\]";//특수문자
					
				isOnlyNum = hasCharsOnly_K(objPassWord, nums);  //kdfense_object.js
				isOnlyEng = hasCharsOnly_K(objPassWord, chars);
				isOnlySpc = hasCharsOnly_K(objPassWord, percul);
			}
			else //키보드 보안 미작동시
			{
				var filterNum = /[0-9]/ ;			// 숫자만 있을경우
				var filterEng = /[a-zA-Z]/;				// 영문만 있을경우
				var filterSpc = /[!@#$%^&*()\"_\/+=\-\[\]{}';:?<>.,~`|\\]/ ;  // 특수문자만 있을경우 

				var isIncNum = filterNum.test(objPassWord.value);
				var isIncEng = filterEng.test(objPassWord.value);
				var isIncSpc = filterSpc.test(objPassWord.value);
				
				isOnlyNum = isIncNum && !isIncEng && !isIncSpc;
				isOnlyEng = !isIncNum && isIncEng && !isIncSpc;
				isOnlySpc = !isIncNum && !isIncEng && isIncSpc;
			}
	
			//반복문자체크
			if( pwdLength > 3) //4자리 부터 연속문자,반복문자 검사
			{
				// 키보드 보안 작동시 변환 하여검사
				var tmpValue = objPassWord.value ;
				if(window.ActiveXObject && GetCookie('KeySecurity')=='Y')
				{
					tmpValue = GetPwdValue_K(objPassWord.form,objPassWord,"KingsE2E", "", ""); //변환  //kdfense_object.js
				}
				
				if (checkSequence(tmpValue, 4)==false) //연속된 숫자,문자가 4번 반복되었을때
					return "04";
				else if (checkRepetition(tmpValue, 4)==false) //동일한 숫자,문자가 4번 반복됐을때
					return "05";
			}

			//한가지종류만 입력체크
			if( pwdLength < passwordType )
			{
				if(isOnlyNum)  //숫자만 입력되었을때
					return "01";  
				else if(isOnlyEng) //영문만 입력되었을때
					return "02";  
				else if(isOnlySpc) //특수문자만 입력되었을때
					return "03";  
				else
					return "00";   //6자 이하일때
			}
			else  
			{
				if(isOnlyNum)  //숫자만 입력되었을때 //취약
					return "11";  
				else if(isOnlyEng) //영문만 입력되었을때 //취약
					return "12";  
				else if(isOnlySpc) //특수문자만 입력되었을때 //취약 
					return "13";  
			}

			//**3단계 
			if(pwdLength > 11 ) //12자 이상으로 영문, 숫자, 특수문자중 두가지 이상 포함된 경우
				return "31";
			else //8자 이상으로 영문, 숫자, 특수문자중 두가지 이상 포함된 경우
				return "21";
			
		}

		// 비밀번호TypeCode에 따른 풍선도움말 HTML 반환
		function getPasswordValidateHtml(type)
		{
			var strBasicMsg = "비밀번호는 영문, 숫자, 특수문자 중<br />2가지를 포함하여 "+ passwordType+"~15자 이내로 입력해주세요.";
			var strOnlyNumMsg = "<span class=\"gray\">비밀번호는 숫자만 사용할 수 없습니다.</span>";
			var strOnlyEngMsg = "<span class=\"gray\">비밀번호는 영문만 사용할 수 없습니다.</span>";
			var strOnlySpcMsg = "<span class=\"gray\">비밀번호는 특수문자만 사용할 수 없습니다.</span>";
			
			var strHeadHtml = "<strong class=\"fsm name\">보안등급 :</strong> <span class=\"gray3\"> </span> <strong class=\"fsm org\">";
			
			var strNotUse = "<img src=\"https://pics.auction.co.kr/icon/pw_use_00.gif\" alt=\"사용불가\" class=\"vm\"></strong><br />";
			var strWeak = "<img src=\"https://pics.auction.co.kr/icon/pw_use_01.gif\" alt=\"취약\" class=\"vm\"></strong><br />";
			var strNomal = "<img src=\"https://pics.auction.co.kr/icon/pw_use_02.gif\" alt=\"적정\" class=\"vm\"></strong><br />";
			var strSafe = "<img src=\"https://pics.auction.co.kr/icon/pw_use_03.gif\" alt=\"안전\" class=\"vm\"></strong><br />";
			
			var strRetHtml = "";
			
			if(type=="")
				strRetHtml = strBasicMsg ;
			else if(type=="00")
				strRetHtml = strHeadHtml + strNotUse + "<span class=\"gray\">비밀번호는 "+ passwordType+"자 이상 입력해주세요.</span>" ;
			else if(type=="01")
				strRetHtml = strHeadHtml + strNotUse + strOnlyNumMsg ;
			else if(type=="02")
				strRetHtml = strHeadHtml + strNotUse + strOnlyEngMsg ;
			else if(type=="03")
				strRetHtml = strHeadHtml + strNotUse + strOnlySpcMsg ;
			else if(type=="04")
				strRetHtml = strHeadHtml + strNotUse + "<span class=\"gray\">연속되는 문자와 숫자를  사용하실 수 없습니다.</span>"
			else if(type=="05")
				strRetHtml = strHeadHtml + strNotUse + "<span class=\"gray\">동일한 문자, 숫자를 반복해서 사용하실 수 없습니다.</span>";
			else if(type=="11")
				strRetHtml = strHeadHtml + strWeak + strOnlyNumMsg;
			else if(type=="12")
				strRetHtml = strHeadHtml + strWeak + strOnlyEngMsg;
			else if(type=="13")
				strRetHtml = strHeadHtml + strWeak + strOnlySpcMsg;
			else if(type=="21")
				strRetHtml = strHeadHtml + strNomal + "<span class=\"gray\">사용가능한 적정수준의 비밀번호입니다.</span>";
			else if(type=="31")
				strRetHtml = strHeadHtml + strSafe + "<span class=\"gray\">매우 안전한 비밀번호 입니다.</span>" ;
			else 
				strRetHtml = strBasicMsg ;
		
			return "<p>"+strRetHtml+"</p>";
		}

		

		
		//알파벳과 숫자를 사용했는지 체크
		function checkAlphaNumeric(str)
		{
			//영숫자 조합여부 체크
			//var filter1=/[^a-zA-Z0-9_]/	; // a~z,A-Z,0~9,"_"에 해당하는 문자만 허용한다.
			var filter3=/[a-zA-Z]{1,15}/	;    //a~z 중 하나를 포함하며, 4~15자인 정규 표현식
 			var filter4=/[0-9]{1,15}/	;     //0~9 중 하나를 포함하며, 4~15자인 정규 표현식
 			var filter5=/[!@#$%^&*()\"_\/+=\-\[\]{}';:?<>.,~`|\\]{1,15}/	;     //특수 문자 포함한 15자
 			

			if((filter3.test(str) && filter4.test(str) && filter5.test(str)))
			{
				return true;
			}
			
			return false;
		}

		//연속 문자 체크(예-abcd, 2345)
		function checkSequence(str,len)
		{
			var seqCnt=1;
			
			for(i=0;i < str.length;i++){
				next_p = str.charAt(i);
		   
				next_char = (parseInt(next_p.charCodeAt(0)))+1;


				temp_p = str.charAt(i+1);    
				temp_char = (parseInt(temp_p.charCodeAt(0)));
				
				if (next_char == temp_char)
						seqCnt = seqCnt + 1;
				else
						seqCnt = 1;

				if (seqCnt > len-1)
				{
    			return false;
				}
			}
			
			return true;
		}

		//반복 문자 체크(예-aaaa, 1111)
		function checkRepetition(str, len) {
			var repeatCnt=1;
			
			for(i=0;i < str.length;i++){
				temp_char = str.charAt(i);
				next_char = str.charAt(i+1);

				if (temp_char == next_char)
						repeatCnt = repeatCnt + 1;
				else
						repeatCnt = 1;
		        
				if (repeatCnt > len-1)
				{
    			return false;
				}
			}
			
			return true;
		}

		//두 입력값의 중복 문자 체크(예-myid12, id12pwd)
		function checkDuplicate(str1, str2, len) {
			var temp="";

			if(str1.length < len)
				return true;

			for(i=0;i < str1.length-(len-1);i++)
			{
				temp = str1.substr(i, len);
				index = str2.indexOf(temp);
				
				if(index >= 0)	//중복문자를 검사한다.
					return false;
			}

			return true;
		}

		// 주민번호, 사업자번호 신규 체크 로직(2008-06-24)
		// 주민번호 체크
		function CheckNewValidSSN(ssn) 
		{
			ssn = ssn.replace(/ /g, "");
			
			if(ssn=="" || ssn==null || ssn.length!=13) {
				alert("주민등록번호를 넣어주세요.");
				return false;
			}
			var jumin1 = ssn.substr(0,6);
			var jumin2 = ssn.substr(6,7);
			var yy = jumin1.substr(0,2);        // 년도
			var mm = jumin1.substr(2,2);        // 월
			var dd = jumin1.substr(4,2);        // 일
			var genda = jumin2.substr(0,1);     // 성별
			var msg, ss, cc;
			
			// 숫자가 아닌 것을 입력한 경우
			if (!isNumeric(jumin1)) {
				alert("주민등록번호 앞자리를 숫자로 입력하세요.");
				return false;
			}
			// 길이가 6이 아닌 경우
			if (jumin1.length != 6) {
				alert("주민번호 앞자리 6자를 다시 입력해 주세요.");
				return false;
			}
			// 첫번째 자료에서 연월일(YYMMDD) 형식 중 기본 구성 검사
			if (yy < "00" || yy > "99" ||
				mm < "01" || mm > "12" ||
				dd < "01" || dd > "31") {
				alert("주민등록번호 앞자리를 다시 입력하세요.");
				return false;
			}
			// 숫자가 아닌 것을 입력한 경우
			if (!isNumeric(jumin2)) {
				alert("주민등록번호 뒷자리를 숫자로 입력하세요.");
				return false;
			}
			// 길이가 7이 아닌 경우
			if (jumin2.length != 7) {
				alert("주민번호 뒷자리 7자를 다시 입력해 주세요.");
				return false;
			}
			// 성별부분이 1 ~ 4 가 아닌 경우
			if (genda < "1" || genda > "4") {
				alert("주민등록번호 뒷자리를 다시 입력하세요.");
				return false;
			}
			// 연도 계산 - 1 또는 2: 1900년대, 3 또는 4: 2000년대
			cc = (genda == "1" || genda == "2") ? "19" : "20";
			// 첫번째 자료에서 연월일(YYMMDD) 형식 중 날짜 형식 검사
			if (isYYYYMMDD(parseInt(cc+yy), parseInt(mm), parseInt(dd)) == false) {
				alert("주민등록번호 앞자리를 다시 입력하세요.");
				return false;
			}
			// Check Digit 검사
			if (!isSSN(jumin1, jumin2)) {
				alert("유효하지 않은 주민번호입니다.");
				return false;
			}
			
			return true;
		}
		
		// 재외국인 번호 체크
		function CheckValidForeignSSN(ssn) 
		{
			ssn = ssn.replace(/ /g, "");
			
			if(ssn=="" || ssn==null || ssn.length!=13) {
				alert("주민등록번호를 넣어주세요.");
				return false;
			}
			var jumin1 = ssn.substr(0,6);
			var jumin2 = ssn.substr(6,7);
			
			// 숫자가 아닌 것을 입력한 경우
			if (!isNumeric(jumin1)) {
				alert("주민등록번호 앞자리를 숫자로 입력하세요.");
				return false;
			}
			// 길이가 6이 아닌 경우
			if (jumin1.length != 6) {
				alert("주민번호 앞자리 6자를 다시 입력해 주세요.");
				return false;
			}
			// 숫자가 아닌 것을 입력한 경우
			if (!isNumeric(jumin2)) {
				alert("주민등록번호 뒷자리를 숫자로 입력하세요.");
				return false;
			}
			// 길이가 7이 아닌 경우
			if (jumin2.length != 7) {
				alert("주민번호 뒷자리 7자를 다시 입력해 주세요.");
				return false;
			}
			
			var sum=0;
			var odd=0;
			
			buf = new Array(13);
			
			for(i=0; i<13; i++) { buf[i]=parseInt(ssn.charAt(i)); }
			
			odd = buf[7]*10 + buf[8];
			
			if(odd%2 != 0)
			{ 
				alert("유효하지 않은 주민번호입니다.");
				return false; 
			}
			
			multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
			
			for(i=0, sum=0; i<12; i++) { sum += (buf[i] *= multipliers[i]); }
			
			sum = 11 - (sum%11);
			if(sum >= 10) { sum -= 10; }
			sum += 2;
			if(sum >= 10) { sum -= 10; }
			
			if(sum != buf[12])
			{ 
				alert("유효하지 않은 주민번호입니다.");
				return false 
			}
			
			return true;
		}
	
		// 14세 미만 체크
		function CheckUnder14(ssn)
		{
			var jumin1 = ssn.substr(0,6);
			var jumin2 = ssn.substr(6,7);
			var yy     = jumin1.substr(0,2);
			var mm     = jumin1.substr(2,2);
			var dd     = jumin1.substr(4,2);
			var genda  = jumin2.substr(0,1);
	
			var today = new Date();
			var c_year  = today.getFullYear();
			var c_month = today.getMonth()+1;
			var c_day   = today.getDate();
			var c_yy, c_mm, c_dd;
			
			if (genda == "1" || genda == "2" || genda == "5" || genda == "6")
				c_yy = parseInt("19"+yy);
			else
				c_yy = parseInt("20"+yy);
				
			c_mm = parseInt(mm);
			c_dd = parseInt(dd);

			if(c_year-c_yy<14){
				alert("14세이하 미성년자는 회원가입이 불가능합니다.");
				return false;
			}
			else if((c_year-c_yy==14)&&(c_mm>c_month)){
				alert("14세이하 미성년자는 회원가입이 불가능합니다.");
				return false;
			}
			else if((c_year-c_yy==14)&&(c_mm==c_month)&&(c_dd>c_day)){
				alert("14세이하 미성년자는 회원가입이 불가능합니다.");
				return false;
			}
			
			return true;
		}
		
		// 사업자등록번호 체크
		function CheckValidBusinessRegistrationNumber(regiNumber) 
		{
			regiNumber = regiNumber.replace(/ /g, "");
			
			if(regiNumber=="" || regiNumber==null || regiNumber.length!=10) {
				alert("사업자번호를 넣어주세요.");
				return false;
			}
			var regiNumber1 = regiNumber.substr(0,3);
			var regiNumber2 = regiNumber.substr(3,2);
			var regiNumber3 = regiNumber.substr(5,5);
			
			// 숫자가 아닌 것을 입력한 경우
			if (!isNumeric(regiNumber1)) {
				alert("사업자번호 첫번째 자리를 숫자로 입력하세요.");
				return false;
			}
			// 길이가 3이 아닌 경우
			if (regiNumber1.length != 3) {
				alert("사업자번호 첫번째 자리 3자를 다시 입력해 주세요.");
				return false;
			}
			// 숫자가 아닌 것을 입력한 경우
			if (!isNumeric(regiNumber2)) {
				alert("사업자번호 두번째 자리를 숫자로 입력하세요.");
				return false;
			}
			// 길이가 2이 아닌 경우
			if (regiNumber2.length != 2) {
				alert("사업자번호 두번째 자리 2자를 다시 입력해 주세요.");
				return false;
			}
			// 숫자가 아닌 것을 입력한 경우
			if (!isNumeric(regiNumber3)) {
				alert("사업자번호 세번째 자리를 숫자로 입력하세요.");
				return false;
			}
			// 길이가 5이 아닌 경우
			if (regiNumber3.length != 5) {
				alert("사업자번호 세번째 자리 5자를 다시 입력해 주세요.");
				return false;
			}
	
			var sum = 0;
			var getlist =new Array(10);
			var chkvalue =new Array("1","3","7","1","3","7","1","3","5");
			
			for(var i=0; i<10; i++) { getlist[i] = regiNumber.substring(i, i+1); }
			for(var i=0; i<9; i++) { sum += getlist[i]*chkvalue[i]; }
			sum = sum + parseInt((getlist[8]*5)/10);
			sidliy = sum % 10;
			sidchk = 0;
			if(sidliy != 0) { sidchk = 10 - sidliy; }
			else { sidchk = 0; }
			if(sidchk != getlist[9]) 
			{
				alert("유효하지 않은 사업자번호입니다.");
				return false; 
			}
			
			return true;
		}
		
		// Trim 함수
		function TrimString(s)
		{
			var m = s.match(/^\s*(\S+(\s+\S+)*)\s*$/);
			return (m == null) ? "" : m[1];
		}
		
		function isYYYYMMDD(y, m, d) 
		{
			switch (m) {
				case 2:        // 2월의 경우
					if (d > 29) return false;
					/*if (d == 29) {
							// 2월 29의 경우 당해가 윤년인지를 확인
							if ((y % 4 != 0) || (y % 100 == 0) && (y % 400 != 0))
								return false;
					}*/
					break;
				case 4:        // 작은 달의 경우
				case 6:
				case 9:
				case 11:
					if (d == 31) return false;
			}
			// 큰 달의 경우
			return true;
		}
		
		function isNumeric(s) 
		{
			for (i=0; i<s.length; i++) {
				c = s.substr(i, 1);
				if (c < "0" || c > "9") return false;
			}
			return true;
		}
		
		function isLeapYear(y) 
		{
			if (y < 100)
			y = y + 1900;
			if ( (y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0) ) {
				return true;
			} else {
				return false;
			}
		}
		
		function getNumberOfDate(yy, mm) 
		{
			month = new Array(29,31,28,31,30,31,30,31,31,30,31,30,31);
			if (mm == 2 && isLeapYear(yy)) mm = 0;
			return month[mm];
		}
		
		function isSSN(s1, s2) 
		{
			n = 2;
			sum = 0;
			for (i=0; i<s1.length; i++)
				sum += parseInt(s1.substr(i, 1)) * n++;
			for (i=0; i<s2.length-1; i++) {
				sum += parseInt(s2.substr(i, 1)) * n++;
				if (n == 10) n = 2;
			}
			c = 11 - sum % 11;
			if (c == 11) c = 1;
			if (c == 10) c = 0;
			if (c != parseInt(s2.substr(6, 1))) return false;
			else return true;
		}
	
    /*-----------------------------------------------------------------------------
    // 법인 등록번호 체크 - arguments[0] : 등록번호 구분자
    // XXXXXX-XXXXXXX
    // @return : boolean
    //----------------------------------------------------------------------------*/
    String.prototype.isCorporationSSN = function() {
        var arg = arguments[0] ? arguments[0] : "";
        var corpnum = eval("this.match(/[0-9]{6}" + arg + "[0-9]{7}$/)");
        if(corpnum == null) {
            return false;
        }
        else {
            corpnum = this;
        }
        
        if(corpnum.length < 13)
        	return false;
        				
        var sum = 0;
        var num = [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2]
        var last = parseInt(corpnum.charAt(12));
        for(var i = 0; i < 12; i++) {
            sum += parseInt(corpnum.charAt(i)) * num[i];
        }
        
        return ((10 - sum % 10) % 10 == last) ? true : false;
    }
    
    //법인 등록번호 체크
    function ChecValidCorporationSSN(ssn)
  	{
  		return ssn.isCorporationSSN();
  	}	
  	
  	//초중종성 정규표현식 체크(ㅇㅇㄴㅇㄴㅈㄷㄱㅈㄷ)
	function checkRepetitionHangeul(str) 
	{
		var pattern = /(ㄱ|ㄲ|ㄴ|ㄷ|ㄸ|ㄹ|ㅁ|ㅂ|ㅃ|ㅅ|ㅆ|ㅇ|ㅈ|ㅉ|ㅊ|ㅋ|ㅌ|ㅍ|ㅎ|ㅏ|ㅐ|ㅑ|ㅒ|ㅓ|ㅔ|ㅕ|ㅖ|ㅗ|ㅘ|ㅙ|ㅚ|ㅛ|ㅜ|ㅝ|ㅞ|ㅟ|ㅠ|ㅡ|ㅢ|ㅣ|ㄲ|ㄳ|ㄵ|ㄶ|ㄺ|ㄻ|ㄼ|ㄽ|ㄾ|ㄿ|ㅀ|ㅄ|ㅆ){2,}/;
		var reg = new RegExp(pattern);
		return !reg.test(str)
	}
 	
 	//반복 문자 (예-aaaa) --회원정보의 상세주소 위함
 	function checkRepetitionForAddress(str, len) {
		var repeatCnt=1;

		for(i=0;i < str.length;i++){
			temp_char = str.charAt(i);
			next_char = str.charAt(i+1);

			if (temp_char == next_char)
				repeatCnt = repeatCnt + 1;
			else
				repeatCnt = 1;
		      
			if (repeatCnt > len-1)
			{
				if (isNaN(temp_char)) //문자인 경우만 반복문자 체크
				{
					return false;
				}
			}
		}
		return true;
	}				
	
 	//반복 문자 (예- 000,0000,111,1111) --회원정보의 전화번호 필터링를 위함
 	function checkRepetitionForTel(str, len) {
		var repeatCnt=1;

		for(i=0;i < str.length;i++){
			temp_char = str.charAt(i);
			next_char = str.charAt(i+1);
			
			if (temp_char == next_char)
			{
				repeatCnt = repeatCnt + 1;
			}
			else
				repeatCnt = 1;
		      
			if (repeatCnt > len-1)
			{
				if (temp_char == "0" || temp_char == "1") //입력값이 0,1인 경우의 반복문자만 체크
				{			
					if ((str.length > repeatCnt) && (temp_char != str.charAt(i+2))) //반복제약수보다 전체 입력값의 길이가 긴경우 체크
					{
						return true;
					}
					return false;
				}
			}
		}
		return true;
	}		
	
		
	//반복 숫자 (예-1111222, 1111356)
	function checkNumRepetition(str, len) {
		var repeatCnt=0;

		for(i=0;i < str.length;i++){
			
			temp_char = str.charAt(i);
			next_char = str.charAt(i+1);
							
		  if (!isNaN(temp_char)) 
		  {
				repeatCnt = repeatCnt + 1;
				if ((isNaN(next_char) && (repeatCnt <= len-1)) || (temp_char == " "))
				{
					repeatCnt=0;
				}
			}
		  else
				repeatCnt = 0;
		      
			if (repeatCnt > len-1)
			{
				return false;
			}
		}
		return true;
	}			