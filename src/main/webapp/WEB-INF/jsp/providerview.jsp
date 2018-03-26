<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>供应商管理页面 >> 信息查看</span>
  </div>
  <div class="providerView">
    <p>
      <strong>供应商编码：</strong>
      <span>${provider.procode }</span>
    </p>
    <p>
      <strong>供应商名称：</strong>
      <span>${provider.proname }</span>
    </p>
    <p>
      <strong>联系人：</strong>
      <span>${provider.procontact }</span>
    </p>
    <p>
      <strong>联系电话：</strong>
      <span>${provider.prophone }</span>
    </p>
    <p>
      <strong>传真：</strong>
      <span>${provider.profax }</span>
    </p>
    <p>
      <strong>描述：</strong>
      <span>${provider.prodesc }</span>
    </p>
    <div class="providerAddBtn">
      <input type="button" id="back" name="back" value="返回">
    </div>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<script type="text/javascript" src="js/providerview.js"></script>
<script type="text/javascript">
$(function(){
	$("#back").click(function(){
		window.history.go(-1);
	})
})
</script>