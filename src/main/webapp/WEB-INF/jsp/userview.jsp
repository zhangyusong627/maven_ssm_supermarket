<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>用户管理页面 >> 用户信息查看页面</span>
  </div>
  
  <div class="providerView">
  
    <p><strong>用户编号：</strong><span>${user.idno }</span></p>
    <p><strong>用户名称：</strong><span>${user.username}</span></p>
    <p><strong>用户性别：</strong>
       <span> <c:if test="${user.gender==1}">男</c:if></span>
       <span> <c:if test="${user.gender==2}">女</c:if></span>
    </p>
    <p>
      <strong>出生日期：</strong>
      <span> <fmt:formatDate value="${user.birthday}" type="both" pattern="yyyy年MM月dd日"/></span>
    </p>
    <p><strong>用户电话：</strong><span>${user.phone}</span></p>
    <p><strong>用户地址：</strong><span>${user.address}</span></p>
    <p>
      <strong>用户角色：</strong>
      <span><c:if test="${user.userrole ==1}">管理员 </c:if> </span>
      <span><c:if test="${user.userrole ==3}">员工 </c:if> </span>
    </p>
  
    
    <div class="providerAddBtn">
      <a href="userlist.do"><input type="button" id="back" name="back"   value="返回"></a>
    </div>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<script type="text/javascript" src="js/userview.js"></script>