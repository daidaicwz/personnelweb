<%--
  Created by IntelliJ IDEA.
  User: WU
  Date: 2021/6/1
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-bg-green">
        <div class="layui-logo layui-hide-xs "style="color: #FFFFFF;font-size: 23px;font-weight: bold;font-style: italic">广州城市理工学院</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>
            <li class="layui-nav-item">
                <img src="imgs/log.png" alt="华广" style="width: 60px;height: 60px">
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" >
                <i class="layui-icon layui-icon-time" style="font-size: 18px; color: #FFFFFF;font-weight: bold"></i>
                <span id="timeText"></span>
            </li>

            <li class="layui-nav-item" >
                <a href="${pageContext.request.contextPath}/logout"><i class="layui-icon layui-icon-logout" style="font-size: 20px; color: #FFFFFF;font-weight: bold"></i> 退出登录
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <div style="text-align: center;margin-top: 15px;margin-bottom: 15px">
                <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                    <a href="javascript;">
                        <img src="imgs/tx.jpg" style="width: 110px ;height: 110px" class="layui-nav-img">
                    </a>
                    <p>欢迎，${user.username}</p>
                </li>
            </div>
            <li class="layui-nav-item layui-bg-green" style="height: 40px;color: #FFFFFF;font-size: 20px;text-align: center;font-weight: bold;line-height: 40px" >人事信息管理</li>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item ">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-user" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 用户管理</a>
                    <dl class="layui-nav-child">
                        <dd style="padding-left: 40px"><a href="javascript:;"
                                                          data-url="addUser.html"
                                                          data-id="addUser"
                                                          data-title="<i class='layui-icon layui-icon-add-1' style='font-size: 17px; font-weight: bold; color:#009688;'></i>添加用户"
                                                          class="site-demo-active"
                        ><i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 添加用户</a></dd>
                        <dd style="padding-left: 40px"><a href="javascript:;"
                                                          data-url="searchUser.jsp"
                                                          data-id="searchUser"
                                                          data-title="<i class='layui-icon layui-icon-search' style='font-size: 17px; font-weight: bold; color:#009688;'></i>查询用户"
                                                          class="site-demo-active"
                        ><i class="layui-icon layui-icon-search" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 查询用户</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item ">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-app" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 部门管理</a>
                    <dl class="layui-nav-child">
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 添加部门</a></dd>
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 查询部门</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item ">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-friends" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 职位管理</a>
                    <dl class="layui-nav-child">
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 添加用户</a></dd>
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 管理用户</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item ">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-group" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 员工管理</a>
                    <dl class="layui-nav-child">
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 添加用户</a></dd>
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 管理用户</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item ">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-face-surprised" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 角色管理</a>
                    <dl class="layui-nav-child">
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 添加用户</a></dd>
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 管理用户</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item ">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-date" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 公告管理</a>
                    <dl class="layui-nav-child">
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 添加用户</a></dd>
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 管理用户</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item ">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-download-circle" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 上传下载</a>
                    <dl class="layui-nav-child">
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 添加用户</a></dd>
                        <dd style="padding-left: 40px"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 20px; color: #1E9FFF;font-weight: bold"></i> 管理用户</a></dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-brief" lay-filter="demo" lay-allowclose="true">
            <ul class="layui-tab-title">
                <li class="layui-this">首页</li>
            </ul>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md6">
                    <div class="layui-panel">
                        <div class="layui-tab-item layui-show">
                            <iframe src="welcome.html" width="99%" height="525px"></iframe>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">快速入口</div>
                        <div class="layui-card-body">
                            <button class="layui-btn layui-btn-danger" style="width: 120px;height: 90px; font-size: 30px"><i
                                    class="layui-icon layui-icon-username" style="font-size: 45px; color: #FFFFFF;"></i>
                                <br>
                                ${counts.userCount}
                            </button>
                            <button class="layui-btn layui-btn-warm" style="width: 120px;height: 90px; font-size: 30px"><i
                                    class="layui-icon layui-icon-app" style="font-size: 45px; color: #FFFFFF;"></i>
                                <br>
                                ${counts.deptCount}
                            </button>
                            <button class="layui-btn layui-btn-normal" style="width: 120px;height: 90px; font-size: 30px"><i
                                    class="layui-icon layui-icon-friends" style="font-size: 45px; color: #FFFFFF;"></i>
                                <br>
                                ${counts.employeeCount}
                            </button>


                        </div>
                        <div class="layui-card-body">
                            <button class="layui-btn layui-btn-warm" style="width: 120px;height: 90px; font-size: 30px"><i
                                    class="layui-icon layui-icon-group" style="font-size: 45px; color: #FFFFFF;"></i>
                                <br>
                                ${counts.jobCount}
                            </button>
                            <button class="layui-btn layui-btn-normal " style="width: 120px;height: 90px; font-size: 30px"><i
                                    class="layui-icon layui-icon-face-surprised" style="font-size: 45px; color: #FFFFFF;"></i>
                                <br>
                                ${counts.noticeCount}
                            </button>
                            <button class="layui-btn layui-btn-danger" style="width: 120px;height: 90px; font-size: 30px"><i
                                    class="layui-icon layui-icon-date" style="font-size: 45px; color: #FFFFFF;"></i>
                                <br>
                                ${counts.uploadfileCount}
                            </button>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">系统信息</div>
                        <div class="layui-card-body">
                            结合 layui 的栅格系统<br>
                            轻松实现响应式布局
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>
<script>

    $(function () {
        var mytime = setInterval(function () {
            getTime();
        },1000);
    });

    function getTime(){
        var date = new Date();
        var y = date.getFullYear();
        var M = (date.getMonth()+1)<10?'0'+(date.getMonth()+1):(date.getMonth()+1);
        var d = date.getDate()<10?'0'+date.getDate():date.getDate();
        var h = date.getHours()<10?'0'+date.getHours():date.getHours();
        var m = date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes();
        var s = date.getSeconds()<10?'0'+date.getSeconds():date.getSeconds();

        var timeString = y+"年"+M+"月"+d+"日"+"&nbsp;&nbsp"+h+":"+m+":"+s+"&nbsp;&nbsp星期"+"日一二三四五六".charAt(date.getDay());

        $("#timeText").html(timeString);
    }


    //JS
    layui.use(['element', 'layer', 'util', 'jquery'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.jquery;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            , menuRight: function () {
                layer.open({
                    type: 1,
                    title: " <img src='imgs/log.jpg' alt='' style='height: 40px;width: 60px'>华广简介"
                    , content: '<iframe src="leftInfo.html" width="240px" height="100%"></iframe>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });


        //触发事件
        var active = {
            tabAdd: function (url, id, title) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: title,
                    content: '<iframe data-frameid="' + id
                        + '" scrolling="auto" frameborder="0" src="'
                        + url + '" style="width:100%;height: 475px"></iframe>',
                    id: id
                    //规定好的id
                })
                element.render('tab');
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            },
            tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };

        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on(
            'click',
            function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    //如果比零小，则直接打开新的tab项
                    active
                        .tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                } else {
                    //否则判断该tab项是否以及存在

                    var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                    $.each($(".layui-tab-title li[lay-id]"),
                        function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") == dataid
                                .attr("data-id")) {
                                isData = true;
                            }
                        })
                    if (isData == false) {
                        //标志为false 新增一个tab项
                        active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                    }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
            });


    });
</script>
</body>
</html>
