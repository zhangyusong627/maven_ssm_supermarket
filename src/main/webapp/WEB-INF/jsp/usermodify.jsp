<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>用户管理页面 >> 用户修改页面</span>
  </div>
  <div class="providerAdd">
    <form id="userForm" name="userForm" method="post" action="updateUser.do">
      <input type="hidden" name="method" value="modifyexe"> <input type="hidden" name="idno" id="idno" value="${userById.idno }" />
      <!--div的class 为error是验证错误，ok是验证成功-->
      <div >
        <label for="username">用户名称：</label> <input type="text" name="username" id="username" value="${userById.username }" ><font
          color="red"></font> 
      </div>
      <div> 
        <label>用户性别：</label> <select name="gender" id="gender">
          <c:choose>
            <c:when test="${userById.gender==1 }">
              <option value="1" selected="selected">男</option>
              <option value="2">女</option>
            </c:when>
            <c:otherwise>
              <option value="1">男</option>
              <option value="2" selected="selected">女</option>
            </c:otherwise>
          </c:choose>
        </select>
      </div>
<!--       <div> -->
<!--         <label for="birthday">出生日期：</label> <input type="date" id="birthday" name="birthday" value=""  -->
<!--           > <font color="red"></font> -->
<!--       </div> -->
      <div>
        <label for="phone">用户电话：</label> <input type="text" name="phone" id="phone" value="${userById.phone }"><font
          color="red"></font> 
      </div>
      <div>
        <label for="address">用户地址：</label> <input type="text" name="address" id="address" value="${userById.address }"><font
          color="red"></font>
      </div>
      <div>
        <label>用户角色：</label>
        <!-- 列出所有的角色分类 -->
        <input type="hidden" value="" id="rid" /> 
        <select name="userrole" id="userrole">
            <c:choose>
            <c:when test="${userById.userrole==1 }">
              <option value="1" selected="selected">管理员</option>
              <option value="2">经理</option>
              <option value="3">员工</option>
            </c:when>
            <c:otherwise>
              <option value="1">管理员</option>
              <option value="2" selected="selected">经理</option>
              <option value="3">员工</option>
            </c:otherwise>
          </c:choose>
        
        </select> <font color="red"></font>
      </div>
      <div class="providerAddBtn">
<%--          <c:if test="${updateUser==1 }"> --%>
<%--          </c:if> --%>
           <input type="submit" name="save" id="save" onclick="alert('修改成功')" value="保存" /> 
        <input type="button" id="back" name="back" onclick="location.href='userlist.do'" value="返回" />
      </div>
    </form>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<script type="text/javascript" src="js/usermodify.js"></script>
