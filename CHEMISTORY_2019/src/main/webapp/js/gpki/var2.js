//------------------------------------------- [Init 에 필요한 정보] --------------------------------------------------------------------//
// 서버인증서(Base64Encode)
var ServerCert   		= "MIID5jCCAs6gAwIBAgIQTM5h3wKnZK/Q7E61L+RQ2jANBgkqhkiG9w0BAQUFADBQMQswCQYDVQQGEwJLUjEcMBoGA1UEChMTR292ZXJubWVudCBvZiBLb3JlYTENMAsGA1UECxMER1BLSTEUMBIGA1UEAxMLQ0ExMzEwMDAwMDEwHhcNMTAxMTAxMDY0NDQ3WhcNMTMwMjAxMDY0NDQ3WjBdMQswCQYDVQQGEwJLUjEcMBoGA1UECgwTR292ZXJubWVudCBvZiBLb3JlYTEYMBYGA1UECwwPR3JvdXAgb2YgU2VydmVyMRYwFAYDVQQDDA1TVlIxNDgwMDAwMDI2MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+/OI2rtBgip10g2lPbo3X75ARn4lX4cX8/qcSrUFQdAK3Y4h5qPfGB5HuRwabBVB1hKODrMDLlEDerJ2gbP6zq5BoyTnINPxVZldMClW8uImLzLqpOZgllEuB9U9BjUgZJsrcRvC0C/ZzTBhFbGLhQI4fMMFeeJlH/V31DPD7ZQIDAQABo4IBMTCCAS0wHwYDVR0jBBgwFoAUAc8XrgSNh8y3VQtxbGtInOaxspUwHQYDVR0OBBYEFA2UHvfzKooKbctaCSoEY5IqkpxTMA4GA1UdDwEB/wQEAwIFIDAYBgNVHSAEETAPMA0GCSqDGoaNIQIBAjAAMIGIBgNVHR8EgYAwfjB8oHqgeIZ2bGRhcDovL2Nlbi5kaXIuZ28ua3I6Mzg5L2NuPWNybDAwMjksY249Q0ExMzEwMDAwMDEsb3U9R1BLSSxvPUdvdmVybm1lbnQgb2YgS29yZWEsYz1LUj9jZXJ0aWZpY2F0ZVJldm9jYXRpb25saXN0O2JpbmFyeTA2BggrBgEFBQcBAQQqMCgwJgYIKwYBBQUHMAGGGmh0dHA6Ly9ndmEuZ3BraS5nby5rcjo4MDgwMA0GCSqGSIb3DQEBBQUAA4IBAQAncaVwidezXqnBJYHIYyRw9WzgnWXDsxfQMuAHbiPNkrMsAh0LbEoyNwOCb5E300NHT2ibX/6IsJHFY1DqJ5g04IoXWiLD98vInEsOqoEvAZmP3mo9MuDtLmXreY80Adjx2wACwreMUWLgXD43BuA3eH7I35ysxDWUknzl5eHzbooqxASIW3V3zAQQyO7c0IRhqSTFEbRF7qw8tea6SPswjZ+maBc+OP6AS6pht8/sqmJcfj5zxsKf+x5t67a3WXeOp9pCYm4nXa2o6+lvDS8UaTm/w+189rvXZOrHyAZgLRTHItLH/BCbwihHMSZaEhwm2JaJvWEmQWRSTBLeyIKe";

var AlgoMode 			= 0x30;				         			// 암복호 알고리즘 (
												// 0x20 : SYM_ALG_3DES_CBC, 
												// 0x30 : SYM_ALG_SEED_CBC, 
												// 0x40 : SYM_ALG_NEAT_CBC, 
												// 0x50 : SYM_ALG_ARIA_CBC,
			         								// 0x60 : SYM_ALG_NES_CBC)

var WorkDir		        = "GPKISecureWeb";						// 작업디렉토리(모듈 설치된 위치) 		

var GNCertType  		= 0x00;				         			// GPKI, NPKI 인증서 모두 : 0x00, GPKI 만 : 0x01, NPKI 만 :0x02	
var ValidCertInfo 		= "";

//var ValidCertInfo 		= "1 2 410 100001 2 2 1|1 2 410 100001 2 1 2|";			// 특정인증서만 로딩 할 경우에 정책코드를 나열한다.	
var ValidCertInfo 		= "";			// 특정인증서만 로딩 할 경우에 정책코드를 나열한다.	


var ReadCertType 		= 0x01; 				        		// 서명용인증서 : 0x01, 암호키분배용 인증서 : 0x02

var KeyStrokeType 		= 0x00;			 	         			// 키보드 보안 API (0x00:적용안함, 0x01:softcamp, 0x02:INCA, 0x03:Ahnlab, 0x04:Soft Security, 0x05:Space International )

var CertOption			= 0x01;							        // 0x00 : 로그인한 세션인증서로만 서명한다. (해당인증서만 로딩한다.) 

// SiteID
var SiteID 			= "www.nier.go.kr";			        		        // SiteID :세션정보를 획득하는 키값

// 서명시에 
// [setup.conf : 설치파일 위치정보]

// GPKIInstaller 사용시
		
var ServerAddr 			= "www.nier.go.kr:8282"; 								
var ConfigFilePath 		= "/admin/demo/JSP/setup/setup.conf";

// [설치 파일 경로 변수(html내부에서 사용됨)]

var SetupOffLineFilePath        = "/admin/demo/JSP/setup/install_off_v1.0.4.1.exe";

// [설치완료후 이동할 페이지 설정]
var ServiceStartPageURL		= "/admin/gpki_login4.jsp";

var UbikeyVersion = "1.0.3.1";
var UbikeyPopupURL = "http://www.gpki.go.kr/wire/infovine/download.html";
var UbikeyWParam = "SITE_NAME|";
var UbikeylParam = "DREAMSECURITY|KEYBOARD_SECURITY_COMP_CODE";
//---------------------------------------------- [ActiveX 버전번호] --------------------------------------------------------------------//

// [ActiveX Object 테그 형태]																					

var CodeBase_GPKIInstaller	= " CODEBASE='http://www.nier.go.kr:8282/admin/demo/JSP/setup/GPKIInstaller.cab#version=1,0,1,6'";

var Object_GPKIInstaller 	= "<OBJECT ID ='GPKIInstaller' CLASSID = 'CLSID:531BBB4D-B043-4D70-8A88-0A416C7F7CD0' width = 0 height =0";
Object_GPKIInstaller            += CodeBase_GPKIInstaller;
Object_GPKIInstaller            += "></OBJECT >";
