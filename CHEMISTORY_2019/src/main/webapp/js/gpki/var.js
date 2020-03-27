//------------------------------------------- [Init �� �ʿ��� ����] --------------------------------------------------------------------//
// ����������(Base64Encode)
var ServerCert   		= "MIID5jCCAs6gAwIBAgIQTM5h3wKnZK/Q7E61L+RQ2jANBgkqhkiG9w0BAQUFADBQMQswCQYDVQQGEwJLUjEcMBoGA1UEChMTR292ZXJubWVudCBvZiBLb3JlYTENMAsGA1UECxMER1BLSTEUMBIGA1UEAxMLQ0ExMzEwMDAwMDEwHhcNMTAxMTAxMDY0NDQ3WhcNMTMwMjAxMDY0NDQ3WjBdMQswCQYDVQQGEwJLUjEcMBoGA1UECgwTR292ZXJubWVudCBvZiBLb3JlYTEYMBYGA1UECwwPR3JvdXAgb2YgU2VydmVyMRYwFAYDVQQDDA1TVlIxNDgwMDAwMDI2MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+/OI2rtBgip10g2lPbo3X75ARn4lX4cX8/qcSrUFQdAK3Y4h5qPfGB5HuRwabBVB1hKODrMDLlEDerJ2gbP6zq5BoyTnINPxVZldMClW8uImLzLqpOZgllEuB9U9BjUgZJsrcRvC0C/ZzTBhFbGLhQI4fMMFeeJlH/V31DPD7ZQIDAQABo4IBMTCCAS0wHwYDVR0jBBgwFoAUAc8XrgSNh8y3VQtxbGtInOaxspUwHQYDVR0OBBYEFA2UHvfzKooKbctaCSoEY5IqkpxTMA4GA1UdDwEB/wQEAwIFIDAYBgNVHSAEETAPMA0GCSqDGoaNIQIBAjAAMIGIBgNVHR8EgYAwfjB8oHqgeIZ2bGRhcDovL2Nlbi5kaXIuZ28ua3I6Mzg5L2NuPWNybDAwMjksY249Q0ExMzEwMDAwMDEsb3U9R1BLSSxvPUdvdmVybm1lbnQgb2YgS29yZWEsYz1LUj9jZXJ0aWZpY2F0ZVJldm9jYXRpb25saXN0O2JpbmFyeTA2BggrBgEFBQcBAQQqMCgwJgYIKwYBBQUHMAGGGmh0dHA6Ly9ndmEuZ3BraS5nby5rcjo4MDgwMA0GCSqGSIb3DQEBBQUAA4IBAQAncaVwidezXqnBJYHIYyRw9WzgnWXDsxfQMuAHbiPNkrMsAh0LbEoyNwOCb5E300NHT2ibX/6IsJHFY1DqJ5g04IoXWiLD98vInEsOqoEvAZmP3mo9MuDtLmXreY80Adjx2wACwreMUWLgXD43BuA3eH7I35ysxDWUknzl5eHzbooqxASIW3V3zAQQyO7c0IRhqSTFEbRF7qw8tea6SPswjZ+maBc+OP6AS6pht8/sqmJcfj5zxsKf+x5t67a3WXeOp9pCYm4nXa2o6+lvDS8UaTm/w+189rvXZOrHyAZgLRTHItLH/BCbwihHMSZaEhwm2JaJvWEmQWRSTBLeyIKe";

var AlgoMode 			= 0x30;				    // �Ϻ�ȣ �˰���
																		// 0x30 : SYM_ALG_SEED_CBC, 
																		// 0x40 : SYM_ALG_NEAT_CBC, 
																		// 0x50 : SYM_ALG_ARIA_CBC,

var WorkDir		        = "GPKISecureWeb";						// �۾����丮(��� ��ġ�� ��ġ) 		

var GNCertType  		= 0x00;				         			// GPKI, NPKI ������ ��� : 0x00, GPKI �� : 0x01, NPKI �� :0x02	
var ValidCertInfo 		= "";

//var ValidCertInfo 		= "1 2 410 100001 2 2 1|1 2 410 100001 2 1 2|";			// Ư���������� �ε� �� ��쿡 ��å�ڵ带 �����Ѵ�.	
var ValidCertInfo 		= "";			// Ư���������� �ε� �� ��쿡 ��å�ڵ带 �����Ѵ�.	


var ReadCertType 		= 0x01; 				        		// ����������� : 0x01, ��ȣŰ�й�� ������ : 0x02

var KeyStrokeType 		= 0x00;			 	         			// Ű���� ���� API (0x01 : softcamp, 0x00 : �������)

var CertOption			= 0x01;							        // 0x00 : �α����� �����������θ� �����Ѵ�. (�ش��������� �ε��Ѵ�.) 

// SiteID
var SiteID 			= "www.nier.go.kr";			        		        // SiteID :���������� ȹ���ϴ� Ű��

//Ubikey ���� �ش� ��ü�� ���� �Ͽ� �����Ѵ�.
//var	UbikeyVersion="1.1.0.5";
//var	UbikeyPopupURL="";
//var	UbikeyWParam="";
//var	UbikeylParam="";

// ����ÿ� 
// [setup.conf : ��ġ���� ��ġ����]

// GPKIInstaller ����
		
var host = location.host;

var ServerAddr 			= host;

// [��ġ ���� ��� ����(html���ο��� ����)]

var SetupOffLineFilePath        = "/admin/demo/JSP/setup/GPKISecureWebX.exe";

// [��ġ�Ϸ��� �̵��� ������ ����]
var ServiceStartPageURL		= "/admin/gpki_login.jsp";


//---------------------------------------------- [ActiveX ������ȣ] --------------------------------------------------------------------//

// [ActiveX Object �ױ� ����]																					

var CodeBase_GPKIInstaller	= "CODEBASE='http://"+ServerAddr+"/admin/demo/JSP/setup/GPKISecureWebX.cab#version=2,0,1,3'";

var Object_GPKIInstaller 	= "<OBJECT ID ='GPKISecureWeb' CLASSID = 'CLSID:C8223F3A-1420-4245-88F2-D874FC081572' width = 0 height =0";
Object_GPKIInstaller            += CodeBase_GPKIInstaller;
Object_GPKIInstaller            += "></OBJECT >";
