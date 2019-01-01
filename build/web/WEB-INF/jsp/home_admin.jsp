<%-- 
    Document   : home
    Created on : Aug 17, 2018, 7:45:15 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include file="resourcefile.jsp" %>

<%@page import="com.pojos.User"%>


<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>


<!DOCTYPE html>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<script src="${angularJS}" type="text/javascript"></script>
<html ng-app="diffabapp" xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <script type="text/javascript">
            var app = angular.module('diffabapp', []);

            app.controller('countCtrl', function ($scope, $http) {

                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/getrowcount.htm'

                }).then(function displayData(response) {
                    $scope.rowdata = response.data;
                    $scope.tot = JSON.parse($scope.rowdata[0]);
                    $scope.death = JSON.parse($scope.rowdata[1]);
                    $scope.deathrate = Math.round(($scope.death / $scope.tot) * 1000);

                    $scope.statuscode = response.status;

                    //alert($scope.disabilitydata[0].subName);

                });
            });
            app.controller('disbCtrl', function ($scope, $http) {

                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/discategory.htm'

                }).then(function displayData(response) {
                    $scope.disbdata = response.data;
                    
                    for(var i=0;i<=$scope.disbdata.length;i++){
                       var val=$scope.disbdata[i];
                    }

                });
            });

        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



            <title>Home</title>



    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu_admin.jsp" %>
            <div id="page-wrapper">
                <div class="header"> 
                    <h3 class="page-header">
                        Welcome&nbsp;<small>${user_name}</small>
                    </h3>
                    <ol class="breadcrumb">
                        <li><a href="">Home</a></li>

                    </ol> 

                </div>
                <div id="page-inner"> 

                    <div class="row">

                        <div class="col-xs-12 col-sm-6 col-md-3">

                            <div class="card horizontal cardIcon waves-effect waves-dark">
                                <div class="card-image">
                                    <i class="fa fa-users fa-5x"></i>
                                </div>
                                <div class="card-stacked">
                                    <div class="card-content" ng-controller="countCtrl">
                                        <div>
                                            <h3>{{rowdata[0]}}</h3> 
                                        </div>
                                    </div>
                                    <div class="card-action">
                                        <strong> Total Members</strong>
                                    </div>
                                </div>
                            </div> 

                        </div>
                       
                        <div class="col-xs-12 col-sm-6 col-md-3">

                            <div class="card horizontal cardIcon waves-effect waves-dark">
                                <div class="card-image red">
                                    <i class="fa fa-eye fa-5x"></i>
                                </div>
                                <div class="card-stacked">
                                    <div class="card-content" ng-controller="countCtrl">
                                        <div>
                                            <h3>{{deathrate}}</h3> 
                                        </div>
                                    </div>
                                    <div class="card-action">
                                        <strong>Death Rate</strong>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">

                            <div class="card horizontal cardIcon waves-effect waves-dark">
                                <div class="card-image blue">
                                    <i class="fa fa-eye fa-5x"></i>
                                </div>
                                <div class="card-stacked">
                                    <div class="card-content" ng-controller="countCtrl">
                                        <div>
                                            <h3>{{rowdata[2]}}</h3> 
                                        </div>
                                    </div>
                                    <div class="card-action">
                                        <strong>No of survivals</strong>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5"> 
                            <div class="card">
                                <div class="card-image">
                                    <div id="morris-line-chart"></div>
                                </div> 


                            </div>

                            <div class="row">                     


                            </div>
                        </div>



                    </div>
                    <div class="row"> 


                       
                        <div class="col-md-10 col-sm-12 col-xs-12">
                            <div class="card">
                                <div class="card-action">
                                    <b>Recent Statistics</b>
                                </div>
                                <div ng-controller="disbCtrl">
                                    <div class="card-image" >
                                        <div  ng-repeat="x in disbdata" >
                                            <ul class="collection">
                                                <li class="collection-item avatar">
                                                    <i class="material-icons circle green">folder</i>
                                                    <span class="title">Disability Category</span>

                                                    <p>{{x.name}} &nbsp; {{x.subName}}</p>
                                                    <p></p>
                                                    <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
                                                </li>


                                            </ul>
                                        </div>
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
