<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
			<col style="width:20%" />
			<col style="width:20%" />
			<col style="width:40%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr style="font-weight: 900;">
				<th class="board-default-th-no" style="font-weight: 900;">번호</th>
				<th class="board-default-th-title">환경구분</th>
				<th class="board-default-th-title"">물질정보</th>
				<th class="board-default-th-title">유해인자</th>
				<th class="board-default-th-title">비고</th>				
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="nvo" items="${nvolist}" varStatus="status">
			<tr class="notPointer">
				<td class="board-default-td-no detailMove"><c:out value="${(nVo.pageIndex-1) * nVo.pageSize + status.count}"/></td>	
				<td class="board-default-td-no detailMove"><c:out value='${nvo.envName}'/></td>
				<td class="board-default-td-title"><c:out value="${nvo.matName}"/></td>
				<td class="board-default-td-title">
					<c:forEach var="mappinglist" items="${nvo.mappingList}" varStatus="i">
						<c:out value="${mappinglist.kName}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<a onclick="doMapiingdelete('${mappinglist.envId}','${mappinglist.matId}','${mappinglist.idx}');" style="background-color: yellow; cursor: pointer;">
							삭제
						</a><br/>
					</c:forEach>
				</td>
				<td class="board-default-td-title" style="color: rgb(232,219,107); cursor: pointer;">
					<a href="#none" onclick="doAddPopup('<c:out value='${nvo.envId}'/>','<c:out value='${nvo.matId}'/>');"><c:out value="추가"/></a>
				</td>				
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(nvolist) == 0}">
			<tr>
				<td class="lt_text3" colspan="9">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty nVo.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div>
</div>
</c:if>



