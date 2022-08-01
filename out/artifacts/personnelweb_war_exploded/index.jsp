<%--
  Created by IntelliJ IDEA.
  User: WU
  Date: 2021/6/1
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/loginstyle/css/supersized.css">
    <script src="${pageContext.request.contextPath}/loginstyle/js/jquery-1.8.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/loginstyle/js/supersized.3.2.7.min.js"></script>
    <script src="${pageContext.request.contextPath}/loginstyle/js/supersized-init.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>

    <style>
      *{
        margin: 0 auto;
      }
      .login-div1{
        position: absolute;
        width: 350px;
        height: 350px;
        top: 100px;
        right: 300px;
        background-color: #FFFFFF;
        text-align: center;
      }
      .login-p1{
        margin-top: 15px;
        color: #393D49;
        font-size: 18px;
        font-weight: bold;
      }

      #lable1{
        margin-left: 28px;
        margin-top: 10px;
        width: 70px;
      }


    </style>

  </head>
  <body>
  <div class="login-div1">
    <p class="login-p1">人事系统-后台登录</p>

    <form class="layui-form layui-form-pane" action="login" method="post" id="demo1">
      <div class="layui-form-item" >
        <label class="layui-form-label" id="lable1">
          <i class="layui-icon layui-icon-user" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i>
        </label>
        <div class="layui-input-inline" style="margin-top: 10px">
          <input type="text" name="username" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item" >
        <label class="layui-form-label" style="margin-left: 28px;width: 70px">
          <i class="layui-icon layui-icon-password" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i>
        </label>
        <div class="layui-input-inline" >
          <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item" >
        <label class="layui-form-label" style="width: 70px;margin-left: 28px;">
          <i class="layui-icon layui-icon-vercode" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i>
        </label>
        <div class="layui-input-inline" style="width: 100px">
          <input type="text" name="checkcode" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-label" style="width: 100px;height: 38px">
          <a href="javascript:void(0)" id="checkcode"><img src="${pageContext.request.contextPath}/CheckCode" width="100px" height="38px" style="margin-left: -15px;margin-top: -10px" id="imgcode"></a>
        </div>
      </div>
        <div class="layui-form-item ">
            <button class="layui-btn" lay-submit="" style="width: 270px;">登录</button>
        </div>
    </form>
      <div>
          <div class="layui-form-item" id="layerDemo">
              <button data-method="notice" class="layui-btn" style="width: 270px;">注册</button>
          </div>
      </div>
  </div>
  </body>


  <script>

      $(function () {
            $("#checkcode").click(function () {
                $("#imgcode").attr("src","${pageContext.request.contextPath}/CheckCode?time"+new Date().getTime());
            })
      })

    layui.use(['form', 'layedit', 'laydate','layer','jquery'], function(){
      var form = layui.form
              ,layer = layui.layer
              ,layedit = layui.layedit
              ,$ = layui.jquery
              ,laydate = layui.laydate;

      var login = "${loginInfo}";
      if (login != ""){
        layer.msg(login,{icon: 5});
      }


        //触发事件
        var active = {
            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 2
                    ,title: "<span style=\'font-weight: bold;font-size: 25px;color: #1E9FFF\'>用户注册</span>"//不显示标题栏
                    ,closeBtn: false
                    ,area: ['460px;','450px;']
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: 'register.html'
                });
            }

        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });








      //自定义验证规则
      form.verify({
        title: function(value){
          if(value.length < 5){
            return '标题至少得5个字符啊';
          }
        }
        ,pass: [
          /^[\S]{6,12}$/
          ,'密码必须6到12位，且不能出现空格'
        ]
        ,content: function(value){
          layedit.sync(editIndex);
        }
      });



      //监听提交
      form.on('submit(demo1)', function(data){

        return true;
      });



      //表单取值
      layui.$('#LAY-component-form-getval').on('click', function(){
        var data = form.val('example');
        alert(JSON.stringify(data));
      });

    });
  </script>

</html>
