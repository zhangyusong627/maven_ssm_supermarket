<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>密码修改页面</span>
  </div>
  <div class="providerAdd">
    <form id="userForm" name="userForm" method="post" action="updateUserpassword.do">
      <input type="hidden" name="idno" id="idno" value="${ marketUser.idno }">
      <!--div的class 为error是验证错误，ok是验证成功-->
      <div class="info"></div>
      <div class="">
        <label for="oldPassword">旧密码：</label> <input type="text" name="oldpassword" id="oldpassword" value="${ marketUser.userpassword }"> <font color="red"></font>
      </div>
      <div>
        <label for="userpassword">新密码：</label> <input type="text" name="userpassword" id="userpassword" value=""> <font color="red"></font>
      </div>
      <div>
        <label for="ruserpassword">确认新密码：</label> <input type="text" name="ruserpassword" id="ruserpassword" value=""> <font color="red"></font>
      </div>
      <div class="providerAddBtn">
        <!--<a href="#">保存</a>-->
        <input type="submit" name="save" id="save" value="保存" onclick="alert('修改成功')" > 
        <input type="button" id="back" name="back" onclick="location.href='userlist.do'" value="返回" />
      </div>
    </form>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<!-- <script type="text/javascript" src="js/pwdmodify.js"></script> -->
<script type="text/javascript" src="statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
	//验证用户密码
	$("input[name=userpassword]").blur(function(){
		var userpassword = $("input[name=userpassword]").val().trim();
		var flag = /^(\w|\d){6,16}$/;
		if(userpassword==null||userpassword==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 用户密码不能为空");
			result=1;
		}else if(!flag.test(userpassword)){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 用户密码为6-16位以内");
			result=1;
			}else{
			      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
			      result=0;
					}
	})

	//验证用户密码（2）
	$("input[name=ruserpassword]").blur(function(){
		var ruserpassword = $("input[name=ruserpassword]").val().trim();
		var userpassword = $("input[name=userpassword]").val().trim();
		var flag = /^(\w|\d){6,16}$/;
		if(ruserpassword==null||ruserpassword==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 用户密码不能为空");
			result=1;
		}if(ruserpassword!=userpassword){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 两次密码不一致");
			result=1;
		}else if(!flag.test(ruserpassword)){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 用户密码为6-16位以内");
			result=1;
			}else{
			      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
			      result=0;
					}
	})
	
	
});


</script>