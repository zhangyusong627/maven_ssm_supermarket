<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>用户管理页面 >> 用户添加页面</span>
  </div>
  <div class="providerAdd">
    <form id="userForm" name="userForm" method="post" enctype="multipart/form-data" action="fileUpload.do">
      <div>
        <label for="file">文件：</label> <input type="file" name="uploadFile" id="file" value="">
      </div>
      <div>
        <label for="disc">描述：</label> <input type="text" name="disc" id="disc" value="">
      </div>
      <div class="providerAddBtn">
        <input type="submit" name="add" id="add" value="保存"> <input type="button" id="back" name="back" value="返回">
      </div>
    </form>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
