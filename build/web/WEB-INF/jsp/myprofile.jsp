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
                    My Account
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
                                   My Profile
                            </div>

                            <div class="card-content">
                                <div class="row">
                                    <h5>Basic Profile</h5>
                                </div>
                                <s:url var="addURL" value="updateneedyprofile.htm"></s:url>
                                <form id="basicprofile" action="" method="POST">

                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">NIC</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${auser.nic}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">First Name</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${auser.firstName}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Last Name</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${auser.lastName}</h5>
                                        </div>


                                    </div>

                                    <div class="row" >
                                        <div class="input-field col s3">

                                            <label for="fname">Gender</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <c:if test="${auser.gender=='M'}">
                                                <h5>Male</h5>
                                            </c:if>
                                            <c:if test="${deo.gender=='F'}">
                                                <h5>Female</h5>
                                            </c:if>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <h5>Contact Details</h5>
                                    </div>


                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Address Line1</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${auser.addressLine1}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Address Line2</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${auser.addressLine2}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">City</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${auser.city}</h5>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Postal Code</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${auser.postalCode}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Email</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${auser.email}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Mobile</label>
                                        </div>
                                         <div class="input-field col s6">
                                            <h5>${auser.mobile}</h5>
                                        </d

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
