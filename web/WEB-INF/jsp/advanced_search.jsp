<%-- 
    Document   : advanced_search
    Created on : Oct 25, 2018, 10:15:43 PM
    Author     : Rajitha
--%>



<%@page import="com.daoimp.RoleName"%>
<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<%@include file="resourcefile.jsp" %>
<%
    User u;
    u = (User) request.getSession().getAttribute("LOGGEDIN_USER");

    if (u.getRole().getName().equals(RoleName.ADMIN.toString())) {%>
<%@include  file="menu_admin.jsp" %>
<%}%>
<%
    if (u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_PRO.toString())
            || u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DS.toString())
            || u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DIS.toString())) {%>
<%@include  file="menu_user.jsp" %>
<%}
%>
%>
<script src="${angularJS}" type="text/javascript"></script>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript">
            var app = angular.module('diffabapp', []);

            app.filter('unique', function () {
                // we will return a function which will take in a collection
                // and a keyname
                return function (collection, keyname) {
                    // we define our output and keys array;
                    var output = [],
                            keys = [];

                    // we utilize angular's foreach function
                    // this takes in our original collection and an iterator function
                    angular.forEach(collection, function (item) {
                        // we check to see whether our object exists
                        var key = item[keyname];
                        // if it's not already part of our keys array
                        if (keys.indexOf(key) === -1) {
                            // add it to our keys array
                            keys.push(key);
                            // push this item to our final output array
                            output.push(item);
                        }
                    });
                    // return our array which should be devoid of
                    // any duplicates
                    return output;
                };
            });
            app.controller('addage', function ($scope) {
                $scope.age = [];

                for (var i = 1; i <= 100; i++) {
                    $scope.age.push(i);
                }
            });
            app.controller('addcategory', function ($scope) {
                $scope.category = ["All", "Code", "NIC", "Name", "Gender", "Age"];
            });

            app.controller('addgender', function ($scope) {
                $scope.gender = ["Male", "Female"];
            });
            app.controller('addbloodgrp', function ($scope) {
                $scope.bloodcat = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
            });

            app.controller('dsCtrl', function ($scope, $http) {
                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/addds.htm'

                }).then(function displayData(response) {
                    $scope.dsdata = response.data;
                    $scope.statuscode = response.status;
                });
            });
            app.controller('provinceCtrl', function ($scope, $http) {
                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/addprovince.htm'

                }).then(function displayData(response) {
                    $scope.prdata = response.data;
                    $scope.statuscode = response.status;
                });
            });
            app.controller('districtCtrl', function ($scope, $http) {
                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/adddistrict.htm'

                }).then(function displayData(response) {
                    $scope.dsdata = response.data;
                    $scope.statuscode = response.status;
                });
            });
            app.controller('disabilityCtrl', function ($scope, $http) {
                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/adddisability.htm'

                }).then(function displayData(response) {
                    $scope.disabilitydata = response.data;
                    $scope.statuscode = response.status;

                    //alert($scope.disabilitydata[0].subName);

                });

                $scope.getValue = function () {
                    var select = document.getElementById('subcat');
                    var length = select.options.length;
                    //length=0;
                    for (i = 0; i <= length; i++) {
                        select.options[i] = null;
                        if ((i - 1) >= 0)
                            select.options[i - 1] = null;
                    }

                    $http({
                        method: 'GET',
                        url: '/DifferentlyAbledTracker/adddisabilitysub.htm?cat=' + $scope.result

                    }).then(function displayData(response) {
                        $scope.disabilitydata2 = response.data;
                        $scope.subresult = [];
                        for (var i in $scope.disabilitydata2) {
                            $scope.subresult.push($scope.disabilitydata2[i].subName);


                        }
                        for (var i in $scope.subresult) {
                            var opt = $scope.subresult[i];
                            var el = document.createElement("option");
                            el.textContent = opt;
                            el.value = opt;
                            document.getElementById('subcat').appendChild(el);
                        }



                    });
                };


            });

        </script>

        <title>Home</title>
    </head>
    <body>
        <div id="wrapper">

            <div id="page-wrapper" >
                <div class="header"> 
                    <h4 class="page-header">
                        Search Differently Abled Person
                    </h4>
                    <ol class="breadcrumb">
                        <li><a href="checkauth.htm">Home</a></li>
                        <li><a href="viewneedy.htm">Search Pesons</a></li>
                    </ol> 

                </div>

                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <s:url var="addURL" value="advancedsearchneedy.htm"></s:url>

                                <div class="card">
                                    <div class="card-action">
                                        Search Profile
                                    </div>

                                    <div class="card-content"style="height: auto">
                                        <form action="${addURL}" method="GET">

                                        <div class="row">
                                            <div class="input-field col s3">
                                                <label>Key Word</label>
                                                <br/>
                                                <br/>
                                                <input type="search" class=" validate" name="keyword"/>
                                            </div>

                                            <div class="input-field col s6" ng-controller="addcategory">
                                                <label>Category</label>
                                                <br/>
                                                <br/>
                                                <select class="form-control validate" name="category">
                                                    <option ng-repeat="x in category">{{x}}</option>
                                                </select>

                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3" >
                                                <input type="checkbox" name="age" id="indeterminate-checkbox0" class="filled-in"/>
                                                <label for="indeterminate-checkbox0">Age</label>
                                            </div>
                                            <div class="input-field col s3" ng-controller="addage">
                                                <select class="form-control validate" name="age1">
                                                    <option ng-repeat="x in age">{{x}}</option>
                                                </select>
                                            </div>
                                            <div class="input-field col s3" ng-controller="addage">
                                                <select class="form-control validate" name="age2">
                                                    <option ng-repeat="x in age">{{x}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3">

                                                <input type="checkbox"  id="indeterminate-checkbox1" class="filled-in" name="gender"/>
                                                <label for="indeterminate-checkbox1">Gender</label>

                                            </div>
                                            <div class="input-field col s6" ng-controller="addgender">
                                                <select class="form-control validate" name="genderans">
                                                    <option ng-repeat="x in gender">{{x}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <input type="checkbox"  id="indeterminate-checkbox2" class="filled-in" name="bloodgroup"/>
                                                <label for="indeterminate-checkbox2">Blood Group</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <select class="form-control validate" name="bloodgroupans" ng-controller="addbloodgrp">
                                                    <option ng-repeat="x in bloodcat">{{x}}</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <input type="checkbox"  id="indeterminate-checkbox3" class="filled-in" name="ds"/>
                                                <label for="indeterminate-checkbox3">Divisional Secretariat</label>
                                            </div>
                                            <div class="input-field col s6" >
                                                <select class="form-control validate" name="dsans" ng-controller="dsCtrl">
                                                    <option ng-repeat="x in dsdata">{{x.name}}</option
                                                </select>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="input-field col s3" style="visibility: hidden">
                                                <input type="checkbox"  id="indeterminate-checkbox8" class="filled-in" name="prodemo" disabled=""/>
                                                <label for="indeterminate-checkbox8" style="visibility: hidden">AGe</label>
                                            </div>
                                            <div class="input-field col s6">

                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <input type="checkbox"  id="indeterminate-checkbox4" class="filled-in" name="province"/>
                                                <label for="indeterminate-checkbox4">Province</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <select class="form-control validate" name="provinceans" ng-controller="provinceCtrl">
                                                    <option ng-repeat="x in prdata">{{x.name}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <input type="checkbox"  id="indeterminate-checkbox5" class="filled-in" name="district"/>
                                                <label for="indeterminate-checkbox5">District</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <select class="form-control validate" name="districtans" ng-controller="districtCtrl">
                                                    <option ng-repeat="x in dsdata">{{x.name}}</option>
                                                </select>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="input-field col s3">
                                                <input type="checkbox"  id="indeterminate-checkbox6" class="filled-in" name="disability"/>
                                                <label for="indeterminate-checkbox6">Disability</label>
                                            </div>
                                            <div class="input-field col s3" ng-controller="disabilityCtrl">
                                                <label>Category</label>
                                                <br/>
                                                <br/>

                                                <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="disbans" id="cat"> 

                                                    <option ng-repeat="x in disabilitydata|unique:'name'" >{{x.name}}</option>
                                                </select>
                                            </div>
                                            <div class="input-field col s3">
                                                <label>Sub Category</label>
                                                <br/>
                                                <br/>
                                                <select  class="form-control validate" id="subcat" name="subdisbans"> 

                                                </select>
                                            </div>

                                        </div>









                                        <div class="row">
                                            <div class=" input-field col s4">
                                                <input type="submit" value="Search" class="waves-effect waves-light btn" />
                                            </div>
                                            <div class="input-field col s1"></div>
                                            <div class="input-field col s4">

                                            </div>

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
        </div>

        <!-- /. PAGE INNER  -->


        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <%@include file="resourcefilejs.jsp" %>




        <!-- Custom Js -->

    </body>
</html>


