<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<link rel="stylesheet" href="<c:url value='/css/zTree/zTreeStyle.css' />" type="text/css">

<script type="text/javascript" src="<c:url value='/js/zTree/jquery.ztree.core-3.5.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/zTree/jquery.ztree.excheck-3.5.js' />"></script>

<script language="javascript" type="text/javascript">

	if("<c:out value='${resultMsg}'/>" != "")alert("<c:out value='${resultMsg}'/>");

	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			
		}	
	};

	var zNodes =[];

	$(document).ready(function(){
		
		// 메뉴 생성
		$("#btn_create_menu").click(function(){
			
			if($("#checkedAuthorForInsert").val() == ""){
				alert("권한코드를 확인할 수 없습니다.");
				return;
			}
			
			var zTree = $.fn.zTree.getZTreeObj("menuTree").getCheckedNodes();
			
			if(zTree.length < 1){
				alert("선택된 메뉴가 없습니다.");
				return;
			}
			
			var strMenuNo = "";
			
			$(zTree).each(function(idx, val){
				
				if(this.useYn == "Y")strMenuNo += "," + this.id;
			});
			
			if(strMenuNo.length < 1){
				alert("선택된 메뉴가 없습니다.");
				return;
			}
			
			if(!confirm("선택하신 메뉴를 생성하시겠습니까?"))return;
			
			$("#checkedMenuNoForInsert").val(strMenuNo.substring(1));
			$("#menuCreatManageForm").attr("action", "<c:url value='/sym/mnu/mcm/EgovMenuCreatInsert.do'/>");
			$("#menuCreatManageForm").submit();
		});
		
		// 사이트맵 생성
		$("#btn_create_sitemap").click(function(){
			
			var authorCode = $("#checkedAuthorForInsert").val();
			
			if(authorCode == ""){
				alert("권한코드를 확인할 수 없습니다.");
				return;
			}
			
			window.open("<c:url value='/sym/mnu/mcm/EgovMenuCreatSiteMapSelect.do'/>?authorCode="+authorCode,'Pop_SiteMap','scrollbars=yes, width=550, height=700');
		});
		
		// 메뉴 펼치기, 닫기
		$("#btn_expand_t, #btn_expand_f").click(function(){
			
			var expandFlag = $(this).attr("id") == "btn_expand_t" ? true : false;
			
			$.fn.zTree.getZTreeObj("menuTree").expandAll(expandFlag);
		});
		
		// 목록
		$("#btn_list").click(function(){
			$("#menuCreatManageForm").attr("action", "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>");
			$("#menuCreatManageForm").attr("target", "main_right");
			$("#menuCreatManageForm").submit();
		});
		
		fnGetMenuTree();
		fnMenuTreeInit();
		
	});
	
	function fnGetMenuTree(){
		var params = {};
		params["authorCode"] = $("#authorCode").val(); 
		
		fnGetSyncAjaxData("<c:url value='/sym/mnu/mcm/menuTree.do'/>", params, fnCbSetMenuTree, false, "조회중입니다." );
	} 
	
	function fnCbSetMenuTree(data){
		
		if (data.msg != "Y"){
			alert("메뉴정보를 확인할 수 없습니다.");
			return;
		}
	
		zNodes = new Array(data.resultMap.length);
	
		for (var i = 0; i < data.resultMap.length ;i ++){
			
			zNodes[i] = {
					id:data.resultMap[i].menuNo,
					pId:data.resultMap[i].upperMenuNo,
					name:data.resultMap[i].menuNm,
					chk:data.resultMap[i].chkYn,
					useYn:data.resultMap[i].useYn,
			};
		}
	}
	
	function fnMenuTreeInit(){
		
		$.fn.zTree.init($("#menuTree"), setting, zNodes);
		setCheck();
		$("#py").bind("change", setCheck);
		$("#sy").bind("change", setCheck);
		$("#pn").bind("change", setCheck);
		$("#sn").bind("change", setCheck);
		
		fnChkNodes();
		
		//$.fn.zTree.getZTreeObj("menuTree").expandAll(true);
	}
	

	function setCheck() {
		var zTree = $.fn.zTree.getZTreeObj("menuTree"),
			py = $("#py").attr("checked")? "p":"",
			sy = $("#sy").attr("checked")? "s":"",
			pn = $("#pn").attr("checked")? "p":"",
			n = $("#sn").attr("checked")? "s":"",

		type = { "Y":"ps", "N":"ps"};
		zTree.setting.check.chkboxType = type;
	}
	
	function fnChkNodes(){
		
		var zTree = $.fn.zTree.getZTreeObj("menuTree");		
		var nodeList = zTree.getNodesByParamFuzzy("name", "");
		
		$(nodeList).each(function(idx, val){
			
			if(this.chk == "Y")zTree.checkNode(this);
		});
		
	}

</script>

</head>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<body>

<div class="content-body">
<div class="board-list">
<form id="menuCreatManageForm" name="menuCreatManageForm" action ="<c:url value='/sym/mnu/mcm/EgovMenuCreatSiteMapSelect.do' />" method="post">
	<input id="checkedMenuNoForInsert" name="checkedMenuNoForInsert" type="hidden" />
	<input id="checkedAuthorForInsert" name="checkedAuthorForInsert" type="hidden" value="<c:out value='${resultVO.authorCode}'/>" />
	
	<table class="board-write">
	<caption>메뉴 생성</caption>
		<colgroup>
		    <col style="width:110px;" />
		    <col />
		    <col style="width:110px;" />
		    <col />
		</colgroup>
	    <tbody>
		<tr>
		    <th class="board-write-th">권한코드</th>
		    <td class="board-write-td"><c:out value='${resultVO.authorCode}'/><input id="authorCode" name="authorCode" type="hidden" size="50"  maxlength="30" title="권한코드" value="<c:out value='${resultVO.authorCode}'/>" readonly /></td>
		    <th class="board-write-th"></th>
		    <td class="board-write-td" style="text-align:right;">
		    	<a href="#" id="btn_create_menu" class="btn btn-primary">메뉴생성</a>
      			<a href="#" id="btn_create_sitemap" class="btn btn-warning" style="display:none;">사이트맵생성</a>
      		</td>
		</tr>
		<tr>
		    <th class="board-write-th" valign="top" style="padding-top: 10px;">
		    	<a href="#" id="btn_expand_t" class="btn-sm btn-primary">+</a>
		    	<a href="#" id="btn_expand_f" class="btn-sm btn-warning">-</a>
		    </th>
		    <td class="board-write-td" colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
		    	<div class="zTreeDemoBackground left" style="width:99%;">
					<ul id="menuTree" class="ztree" style="margin:0 auto; overflow-y:auto; height:500px;"></ul>
				</div>
		    </td>
		</tr>
		</tbody>
	</table>
  	 <div class="text-center">
      	<a href="#" id="btn_list" class="btn btn-default">목록</a>
	</div>
</form>
</div>
</div>


</body>
</html>

