<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>用户管理页面 >> 用户添加页面</span>
  </div>
  <div class="providerAdd">
    <form id="userForm" name="userForm" method="post" action="adduser.do">
      <input type="hidden" name="method" value="add">
      <!--div的class 为error是验证错误，ok是验证成功-->
      <div>
        <label for="usercode">用户编码：</label> <input type="text" name="usercode" id="usercode" value="">
        <!-- 放置提示信息 -->
        <font color="red"></font>
      </div>
      <div>
        <label for="username">用户名称：</label> <input type="text" name="username" id="username" value=""> <font color="red"></font>
      </div>
      <div>
        <label for="userpassword">用户密码：</label> <input type="text" name="userpassword" id="userpassword" value=""> <font color="red"></font>
      </div>
      <div>
        <label for="ruserpassword">确认密码：</label> <input type="text" name="ruserpassword" id="ruserpassword" value=""> <font color="red"></font>
      </div> 
      <div>
        <label>用户性别：</label> 
        <select name="gender" id="gender">
          <option value="0" selected="selected">请选择</option>
          <option value="1">男</option>
          <option value="2">女</option>
        </select>
        <font color="red"></font>
      </div>
<!--       <div> -->
<!--         <label for="birthday">出生日期：</label> <input type="date" Class="Wdate" id="birthday" name="birthday"  -->
<!--           onclick="WdatePicker();"> <font color="red"></font> -->
<!--       </div> -->
<!--       <div> -->
        <label for="phone">用户电话：</label> <input type="text" name="phone" id="phone" value=""> <font color="red"></font>
      </div>
      <div>
        <label for="address">用户地址：</label> <input name="address" id="address" value=""> <font color="red"></font>
      </div>
      <div>
        <label>用户角色：</label>
        <!-- 列出所有的角色分类 -->
        <select name="userrole" id="userrole">
        <option value="0" selected="selected">请选择</option>
        <option value="1">管理员</option>
        <option value="2">经理</option>
        <option value="2">员工</option>
        </select>
        <font color="red"></font> 
      </div>
      <div class="providerAddBtn">
        <input type="submit" name="add" id="add" onclick="alert('添加成功')" value="保存"> <input type="button" id="back" name="back" onclick="location.href='userlist.do'" value="返回">
      </div>
      <font color="red"></font>
    </form>
  </div>
</div>
</section>
<%@include file="common/foot.jsp"%>
<!-- <script type="text/javascript" src="js/useradd.js"></script> -->
<script type="text/javascript" src="statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

$(function(){
	
$("#usercode").next().text("*")
$("#username").next().text("*")
$("#userpassword").next().text("*")
$("#ruserpassword").next().text("*")
$("#gender").next().text("*")
$("#userrole").next().text("*")
$(".providerAddBtn").next().text("带*号必填内容")
var result=0;


$("input[name=usercode]").focus();


$("input[name=usercode]").blur(function(){
 		var usercode = $("input[name=usercode]").val().trim();
	if(usercode==""){
	$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 用户编码不能为空");
	result=1;
		}else{
	//验证用户编码是否存在
 	$.post("findeUserCode.do",{"usercode":usercode},function(data){
//  	 	alert(data)
		if(data=="0"){
			$("input[name=usercode]").next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
			result=0;
			}else{
				$("input[name=usercode]").next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 编码已经存在");
				result=1;
				}
		}); 
		}
});

//验证用户名称
$("input[name=username]").blur(function(){
	var username = $("input[name=username]").val().trim();
	var flag = /^[\u4e00-\u9fa5]{1,5}$/;
	if(username==null||username==""){
	$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 用户名称不能为空");
	result=1;
	}else if(!flag.test(username)){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 用户名称在5个字以内");
		result=1;
		}else{
      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
      result=0;
		}
})

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



//验证用户电话号码
$("input[name=phone ]").blur(function(){
	var phone = $("input[name=phone]").val().trim();
	var flag = /(\d){11}/;
	if(!flag.test(phone)){
		$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 用户电话号码为11位");
		result=1;
		}
	else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
})
//验证用户地址
$("input[name=address]").blur(function(){
	var address = $("input[name=address]").val().trim();
	var flag = /^(\w|-|[\u4E00-\u9FA5])*$/
	if(address==null||address==""){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 地址不能为空");
			result=1;
		}else if(!flag.test(address)){
			$(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/n.png' > 请输入详细地址");
			result=1;
			}else{
		      $(this).next().html("<img style='width:15px;height=18px ' src= 'statics/images/y.png' > ");
		      result=0;
				}
})

$("#billForm").submit(function(){
// 	alert(result)
if(result==0){
	return true;
}else{
	return false;
}

});
});


</script>