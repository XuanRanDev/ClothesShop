<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>渲染网上服装商城</title>
        <link href="/Ordering/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
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

            .pg-body .right-body {
                position: fixed;
                top: 48px;
                right: 0;
                bottom: 0;
                left: 220px;
                overflow: auto;
            }

            .pg-body .right-container {
                padding: 15px;
            }


        </style>
    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="dev.xuanran.clothesshop.model.User"></jsp:useBean>
        <jsp:useBean id="clothes" scope="page" class="dev.xuanran.clothesshop.model.Clothes"></jsp:useBean>

        <div class="pg-header">
            <div class="nav">
                <div class="logo-area left ">
                    <a href="#">
                        <span style="font-size: 20px;color:white">渲染网上服装商城</span>
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
                        ${sessionScope.loginId}
                        <c:choose>
                            <c:when test="${user.loginId!=null}">
                                <span style="color: white">欢迎您：<c:out value="${user.userName}"></c:out></span>
                                <a href="<c:url value="/exit" />"><span style="color: white">【退出】</span></a>
                                <span style="color: white">上次登录时间：<c:out value="${user.lastOnline}"></c:out></span>
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value="/login" />"><span style="color: black">【登录】</span></a>
                                <a href="<c:url value="/register" />"><span style="color: black">【注册】</span></a>
                            </c:otherwise>
                        </c:choose>


                    </div>
                </div>

            </div>
        </div>

        <div class="pg-body">
            <div class="left-menu">
                <div class="menu-body">
                    <h4 style="margin-left: 10px;">搜索服装:</h4>
                    <form action="<c:url value="/seleF_name"/>" method="get">
                        <div style="margin-left: 10px;margin-top:10px;">
                            <input type="text" name="key" value="<c:out value="${param.key}"/>"/>
                            <input type="submit" value="搜索"/>
                        </div>
                    </form>
                </div>
            </div>

            <div class="right-body">

                <div class="right-container">

                    <table class="table">

                        <div style="background: #8c8c8c">
                            所有服装
                        </div>

                        <tr>
                            <c:forEach items="${f_list}" var="clothes">
                                <div style="float: left;margin-right: 13px;margin-top: 10px;">
                                    <img src="getClothesImg?name=<c:out value="${clothes.f_image}"/>"
                                         style="width: 140px;height: 150px;"><br>
                                    <span style="text-align: center">服装名：<c:out value="${clothes.f_name}"/></span><br>
                                    <span style="text-align: center">价格：￥<c:out value="${clothes.price}"/>元 / 件</span>
                                    <div>
                                        <a href="<c:url value="/information"/>?id=<c:out value="${clothes.f_id}"/>">加入购物车</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </tr>
                    </table>

                </div>
            </div>
        </div>


        <script src="/Ordering/jquery/jquery.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="/Ordering/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function tc() {
                alert('请先登录！！！');
            }
        </script>
    </body>
</html>
