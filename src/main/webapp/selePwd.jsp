<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>渲染网上服装商城</title>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" href="css/commons.css">

        <style>

            body {
                margin: 0;
            }


            .pg-body .left-menu {
                width: 220px;
                background: #EAEDF1;
                position: fixed;
                top: 48px;
                left: 0;
                bottom: 0;
            }


            .pg-body .right-container {
                padding: 15px;
            }


        </style>
    </head>
    <body>
        <%
            /*
            String loginId = (String) session.getAttribute("loginId");
            if (loginId == null) {
                // 保存错误信息到request中, 然后转发到login3.jsp中, 提醒登录
               request.setAttribute("message", "请登录!");

                // 转发到登录页面
                response.getWriter().write("<script language='javascript'>alert('请先登录');window.location.href='login';</script>");
           }
           */
        %>
        <jsp:useBean id="user" scope="session" class="dev.xuanran.clothesshop.model.User"></jsp:useBean>
        <div class="pg-header">
            <div class="nav">
                <div class="logo-area left ">
                    <a href="#">
                        <span style="font-size: 20px;color:black">渲染网上服装商城</span>
                    </a>
                </div>

                <div class="left-menu left">
                    <c:choose>
                        <c:when test="${user.loginId!=null}">
                            <a href="<c:url value="/main"/>" class="menu-item">服装信息</a>
                            <a href="<c:url value="/shopping"/>" class="menu-item">我的购物车</a>
                            <a href="<c:url value="/order_search"/>" class="menu-item">订单查询</a>
                            <div class="menu-item">
                                <span>个人信息</span>
                                <i class="fa fa-caret-down" aria-hidden="true"></i>
                                <div class="more-info">
                                    <a href="<c:url value="/editUser"/>" class="more-item">修改个人信息</a>
                                    <a href="<c:url value="/editPassword"/>" class="more-item">修改密码</a>
                                    <a href="<c:url value="/selePwd"/>" class="more-item">找回密码</a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value="/main"/>" class="menu-item">服装信息</a>
                            <a href="#" class="menu-item" onclick="return tc()">我的购物车</a>
                            <a href="#" class="menu-item" onclick="return tc()">订单查询</a>
                            <div class="menu-item">
                                <span>个人信息</span>
                                <i class="fa fa-caret-down" aria-hidden="true"></i>
                                <div class="more-info">
                                    <a href="#" class="more-item" onclick="return tc()">修改个人信息</a>
                                    <a href="#" class="more-item" onclick="return tc()">修改密码</a>
                                    <a href="<c:url value="/selePwd"/>" class="more-item">找回密码</a>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>

                <div class="right-menu right clearfix">

                    <div class="user-info right">
                        <!----
                <a href="#" class="avatar" style="color: #0f0f0f">
                    欢迎你:${sessionScope.loginId}
                </a>
                   ---->
                        <c:choose>
                            <c:when test="${user.loginId!=null}">
                                <span style="color: black">欢迎您：<c:out value="${user.userName}"></c:out></span>
                                <a href="<c:url value="/exit" />"><span style="color: black">【退出】</span></a>
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value="/login" />"><span style="color: black">【登录】</span></a>
                                <a href="<c:url value="/register" />"><span style="color: black">【注册】</span></a>
                            </c:otherwise>
                        </c:choose>
                        <!------
                <div class="more-info">
                    <a href="#" class="more-item">个人信息</a>
                    <a href="<c:url value="/login" />" class="more-item">注销</a>
                </div>
                ---->

                    </div>
                    <!------
                    <a class="user-menu right">
                        消息
                        <i class="fa fa-commenting-o" aria-hidden="true"></i>
                        <span class="badge bg-success">2</span>
                    </a>

                    <a class="user-menu right">
                        通知
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <span class="badge bg-success">2</span>
                    </a>

                    <a class="user-menu right">
                        任务
                        <i class="fa fa-bell-o" aria-hidden="true"></i>
                        <span class="badge bg-danger">4</span>
                    </a>
                     ----->
                </div>

            </div>
        </div>
        <div class="pg-body">
            <div class="right-body">
                <div class="right-container">
                    <form method="get" action="<c:url value="/pwdSele"/>" onsubmit="return validatePsw()">
                        <div style="margin:0 auto;width: 200px;height: 800px;">
                            <h1 style="text-align: center;">找回密码</h1>
                            <div class="form-group" style="margin-top:20px;">
                                <label>账　　　号：</label>
                                <input type="text" class="form-control" name="loginId" placeholder="账号"
                                       style="width: 200px;" required autofocus>
                            </div>
                            <div class="form-group" style="margin-top:20px;">
                                <label>邮　　　箱：</label>
                                <input type="email" class="form-control" name="email" placeholder="邮箱"
                                       style="width: 200px;" required>
                            </div>
                            <div class="form-group" style="margin-top:20px;">
                                <label>新　密　码：</label>
                                <input type="password" class="form-control" name="password1" placeholder="密码" id="psw1"
                                       style="width: 200px;" required>
                            </div>
                            <div class="form-group" style="margin-top:20px;">
                                <label>确认密码：</label>
                                <input type="password" class="form-control" name="password2" placeholder="密码" id="psw2"
                                       style="width: 200px;" required>
                            </div>
                            <div class="form-group" style="width:200px;">
                                <button class="btn btn-lg btn-primary btn-block" type="submit">找回密码</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        </div>


        <script src="/Ordering/jquery/jquery.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="/Ordering/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <!----js判断两次密码是否一致------>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript">
            function validatePsw() {
                var psw1 = document.getElementById('psw1').value;
                var psw2 = document.getElementById('psw2').value;
                if (psw1 != psw2) {
                    alert('两次密码输入不一致！');
                    return false;
                }
                return true;
            }

            function tc() {
                alert('请先登录！！！');
            }
        </script>
    </body>
</html>
