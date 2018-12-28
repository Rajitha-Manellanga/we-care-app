<%-- 
    Document   : needy_profile
    Created on : Oct 26, 2018, 10:50:11 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<%@include file="resourcefile.jsp" %>
<%@include  file="menu_admin.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <head>
        <title>Home</title>
    </head>
    <body>
        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Account Settings
                </h4>
                <ol class="breadcrumb">
                    <li><a href="adminhome.htm">Home</a></li>
                </ol> 
                <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.js"></script>
                <script src="${angularJS}" type="text/javascript"></script>

            </div>

            <div id="page-inner"> 
                <div class="row">
                    <div class="col-lg-12">
                        <s:url var="addURL" value="searchNeedy.htm"></s:url>
                        <s:url var="needyURL" value="n.htm"></s:url>

                            <div class="card">
                                <div class="card-action">
                                    Account Settings
                                </div>

                                <div class="card-content">
                                    <div class="row">
                                        <h5>Change Password</h5>
                                    </div>
                                <s:url var="addURL" value="updateneedyprofile.htm"></s:url>
                                    <form id="basicprofile" action="" method="POST">

                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Email</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <h5>${authuser.email}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="">Current password</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="password">Password</label>
                                            <input type="password" class=" validate" name="password"/>

                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="">New password</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="newpassword">New Password</label>
                                            <input type="password" class=" validate" name="newpassword"/>

                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="">Retype New password</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="newpassword">New Password</label>
                                            <input type="password" class=" validate" name="newpassword"/>

                                        </div>

                                    </div>



                                    <div class="row">
                                        <input type="submit" value="Save Changes" class="waves-effect waves-light btn" />
                                    </div>

                                </form>



                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- /.col-lg-12 --> 
            <footer><p>All right reserved. Template by: <a href="https://webthemez.com/admin-template/">WebThemez.com</a></p></footer>
        </div>
        <%@include file="resourcefilejs.jsp" %>
    </body>
</html>
