<%-- 
    Document   : new_needy3
    Created on : Jul 23, 2018, 8:24:45 PM
    Author     : Rajitha
--%>



<%@page import="com.daoimp.RoleName"%>
<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<%@include file="resourcefile.jsp" %>

<script src="${angularJS}" type="text/javascript"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <script type="text/javascript">
        var app = angular.module('diffabapp', []);
        app.controller('addrel', function ($scope) {
            $scope.rel = ["Father", "Mother", "Relation", "Non Relation"];
        });
        app.controller('addyear', function ($scope) {
            var year = new Date().getFullYear();
            var range = [];
            range.push(year);
            for (var i = 1; i < 50; i++) {
                range.push(year - i);
            }
            $scope.years = range;

        });

    </script>

    <script type="text/javascript">
        function goBack() {
            window.history.back();
        }
    </script>




    <title>Home</title>
</head>
<body>
    <div id="wrapper">
        <%
            User u;
            u = (User) request.getSession().getAttribute("LOGGEDIN_USER");

           if (u.getRole().getName().equals(RoleName.ADMIN.toString())) {%>
        <%@include  file="menu_admin.jsp" %>
        <%}%>
        <%
            if (u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_PRO.toString())
                    || u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DIS.toString())
                    || u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DS.toString())) {%>
        <%@include  file="menu_user.jsp" %>
        <%}
        %>
        %>
        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Add New Differently Abled Person
                </h4>
                <ol class="breadcrumb">

                    <li><a onclick="goBack()">Basic Profile</a></li>
                </ol> 

            </div>

            <div id="page-inner"> 
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-action">
                                Guardians/Parents
                            </div>

                            <div class="card-content">

                                <form  method="POST" action="registerneedy3.htm">

                                    <div class="row">
                                        <div class="input-field col s6" ng-controller="addrel">
                                            <label>Guardian's Type</label>
                                            <br/>
                                            <br/>
                                            <select class="form-control validate" name="gtype">
                                                <option ng-repeat="x in rel">{{x}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s3" ng-controller="addyear">
                                            <label>From</label>
                                            <br/>
                                            <br/>
                                            <select class="form-control validate" name="gfrom">
                                                <option ng-repeat="year in years">{{year}}</option>
                                            </select>
                                        </div>
                                        <div class="input-field col s3" ng-controller="addyear">
                                            <label>To</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate" name="gto">
                                                <option ng-repeat="year in years" >{{year}}</option>  
                                                <select>
                                                    </div>
                                                    </div>



                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <label for="firstName">First Name</label>
                                                            <input type="text"  required=""class=" validate" name="firstname"/>
                                                        </div>
                                                        <div class="input-field col s6">
                                                            <label for="lastName">Last Name</label>
                                                            <input type="text" required="" class=" validate" name="lastname"/>
                                                        </div>
                                                    </div>
                                                    <br/>
                                                    <div class="row">

                                                        <div class="input-field col s6">
                                                            <label for="gender">Gender</label>
                                                            <br/>
                                                            <p>
                                                                <input name="gender" type="radio" value="M" id="test1"/>
                                                                <label for="test1">Male</label>
                                                            </p>
                                                            <div class="clearfix"></div>
                                                            <p>
                                                                <input name="gender" type="radio" value="F" id="test2"/>
                                                                <label for="test2">Female</label>
                                                            </p>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <label for="nic">NIC</label>
                                                            <input type="text" required="" class=" validate" name="nic"/>
                                                        </div>

                                                    </div>
                                                    <br/>
                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <label for="addressLine1">Address Line 1</label>
                                                            <input type="text" required="" class=" validate" name="addr1"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <label for="addressLine2">Address Line 2</label>
                                                            <input type="text" class=" validate" name="addr2"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <label for="city">City</label>
                                                            <input type="text"  required=""class=" validate" name="city"/>
                                                        </div>
                                                        <div class="input-field col s6">
                                                            <label for="city">Postal Code</label>
                                                            <input type="text" class=" validate" required=""name="postalcode"/>
                                                        </div>
                                                    </div>
                                                    <br/>

                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <label for="mobile">Mobile Number</label>
                                                            <input type="text" class=" validate" name="mobile"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <label for="email">Email</label>
                                                            <input type="email" class=" validate" name="email"/>
                                                        </div>
                                                    </div>







                                                    <div class="row">
                                                        <div class="input-field col s6">

                                                            <input type="button" value="Back" class="waves-effect waves-light btn" onclick="goBack()"/>
                                                           

                                                            <input type="submit" value="Finish" class="waves-effect waves-light btn"/>
                                                        </div>
                                                    </div>

                                                    </form>

                                                    </div>
                                                    </div>
                                                    </div>
                                                    </div>

                                                  
                                                    </div>
                                                    <!-- /. PAGE INNER  -->
                                                    </div>
                                                    <!-- /. PAGE WRAPPER  -->
                                                    </div>


                                                    <%@include file="resourcefilejs.jsp" %>

                                                    </body>
                                                    </html>

