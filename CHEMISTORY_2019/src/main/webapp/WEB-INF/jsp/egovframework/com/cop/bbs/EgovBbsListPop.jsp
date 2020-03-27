<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<link rel="stylesheet" href="<c:url value='/css/zTree/zTreeStyle.css' />" type="text/css" />

<script type="text/javascript" src="<c:url value='/js/zTree/jquery.ztree.core-3.5.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/zTree/jquery.ztree.excheck-3.5.js' />"></script>

<script language="javascript" type="text/javascript">

	var tempSearchStr = "";
	var searchLength = 0;
	var searchIdx = 0;

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
		
		// 메뉴 펼치기, 닫기
		$("#btn_expand_t, #btn_expand_f").click(function(){
			
			var expandFlag = $(this).attr("id") == "btn_expand_t" ? true : false;
			
			$.fn.zTree.getZTreeObj("menuTree").expandAll(expandFlag);
		});
		
		// 게시판명 찾기
		$("#btn_search_menu").click(function(){
			
			var searchStr = $("#searchStr").val();
			
			var zTree = $.fn.zTree.getZTreeObj("menuTree");		
			var nodeList = zTree.getNodesByParamFuzzy("name", searchStr);
			
			if(nodeList.length > 0){
				
				if(tempSearchStr == searchStr){
					searchIdx++;
				}else{
					searchIdx = 0;
				}
				
				if(searchIdx >= nodeList.length){
					searchIdx = 0;
				}
				
				zTree.selectNode(nodeList[searchIdx]);
				
				searchLength = nodeList.length;
				tempSearchStr = searchStr;
				
			}else{
				searchIdx = 0;
				searchLength = 0;
				tempSearchStr = "";
			}
			
			$("#searchStr").focus();
			
		});
		
		// 게시판명 찾기 엔터 
		$("#searchStr").keyup(function(e){
			
			if(e.keyCode == 13 && $(this).val() != "")$("#btn_search_menu").click();
		});
		
		// 선택
		$("#btn_select_bbs").click(function(){
			
			var selectBbsList = "";
			var selectBbsListNm = "";
			
			var zTree = $.fn.zTree.getZTreeObj("menuTree").getCheckedNodes();
			
			$(zTree).each(function(idx, val){
				
				selectBbsList += "," + this.bbsId;
				selectBbsListNm += "," + this.name;
			});
			
			if(selectBbsList != "")selectBbsList = selectBbsList.substring(1);
			if(selectBbsListNm != "")selectBbsListNm = selectBbsListNm.substring(1);
			
			opener.$("#linkBbsId").val(selectBbsList);
			opener.$("#btn_link_bbs_nm").text(selectBbsListNm);
			
			self.close();
			
		});
		
		// 닫기
		$("#btn_close").click(function(){
			self.close();
		});
		
		fnCbSetMenuTree();
		fnMenuTreeInit();
		
		$.fn.zTree.getZTreeObj("menuTree").expandAll(true);
		
	});
	
	function fnCbSetMenuTree(){
		
		var data = ${bbsList};
		var linkBbsId = "<c:out value='${boardInfo.linkBbsId}'/>";
		
		zNodes = new Array(data.resultMap.length);
		
		var disFlag = false;
		var chkFlag = true;
	
		for (var i = 0; i < data.resultMap.length ;i ++){
			
			disFlag = data.resultMap[i].bbsId == null || data.resultMap[i].bbsId == "" ? true : false;
			
			if(linkBbsId == null || linkBbsId == "" || data.resultMap[i].bbsId == null || data.resultMap[i].bbsId == ""){
				chkFlag = false;
			}else{
				chkFlag = linkBbsId.indexOf(data.resultMap[i].bbsId) > -1 ? true : false;
			}
			
			zNodes[i] = {
					id:data.resultMap[i].menuNo,
					pId:data.resultMap[i].upperMenuNo,
					name:data.resultMap[i].menuNm,
					bbsId:data.resultMap[i].bbsId,
					chkDisabled:disFlag,
					checked:chkFlag
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

</script>

<body>

<div class="content-body">
<div class="board-list">
	
	<table class="board-write">
	<caption>게시판 선택</caption>
		<colgroup>
		    <col style="width:110px;" />
		    <col />
		    <col style="width:110px;" />
		    <col />
		</colgroup>
	    <tbody>
		<tr>
		    <th class="board-write-th">게시판명</th>
		    <td class="board-write-td">
		    	<input id="searchStr" name="searchStr" type="text" size="20"  maxlength="30" title="게시판명" />
		    	<a href="#" id="btn_search_menu" class="btn-sm btn-primary">찾기</a>
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
      	<a href="#" id="btn_select_bbs" class="btn btn-primary">선택</a>
      	<a href="#" id="btn_close" class="btn btn-default">닫기</a>
	</div>
</div>
</div>


</body>
</html>

