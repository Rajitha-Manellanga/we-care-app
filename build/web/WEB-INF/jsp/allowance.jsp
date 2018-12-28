<%-- 
    Document   : allowance
    Created on : Dec 10, 2018, 6:21:57 PM
    Author     : Rajitha
--%>



<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include file="resourcefile.jsp" %>
<%@include file="menu_admin.jsp" %>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<script src="${angularJS}" type="text/javascript"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript">
        var app = angular.module('diffabapp', []);
        app.controller('disabilityCtrl', function ($scope, $http) {
            $http({
                method: 'GET',
                url: '/DifferentlyAbledTracker/loadallowance.htm'

            }).then(function displayData(response) {
                $scope.disabilitydata = response.data;

                $scope.statuscode = response.status;


                //alert($scope.disabilitydata[0].subName);

            });

            $scope.getValue = function () {
                var select = document.getElementById('subcat');
                var length = select.options.length;
                for (i = 0; i < length; i++) {
                    select.options[i] = null;
                }
                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/loadsuballowance.htm?allowcat=' + $scope.result

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



                    //for(i=0;$scope.disabilitydata2.)
                    //alert($scope.disabilitydata[0].subName);

                });
            };


        });
    </script>






    <title>Allowances</title>
</head>
<body>
    <div id="wrapper">


        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Allowances
                </h4>
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Forms</a></li>
                    <li class="active">Data</li>
                </ol> 

            </div>

            <div id="page-inner"> 
                <div class="row">


                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-action">
                                Add New Allowance
                            </div>



                            <div class="card-content">

                                <form  method="POST" action="/DifferentlyAbledTracker/saveallowance.htm">                                      


                                    <div class="row" >

                                        <div class="input-field col s3" ng-controller="disabilityCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>

                                            <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="al1" id="cat"> 

                                                <option ng-repeat="x in disabilitydata" >{{x.name}}</option>
                                            </select>
                                        </div>
                                        <div class="input-field col s3">
                                            <label>Sub Category</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate" id="subcat" name="al2"> 

                                            </select>
                                        </div> 
                                        <div class="input-field col s6">
                                            <label for="add1">Date</label>
                                            <br/>
                                            <br/>
                                            <input type="date"  class=" validate" name="aldate"/>
                                        </div>
                                    </div>




                                    <div class="row">

                                        <div class="input-field col s6">
                                            <label for="unit">Unit</label>
                                            <input type="text"  class=" validate" name="unit"/>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="unit">Amount</label>
                                            <input type="text"  class=" validate" name="amount"/>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="comment">Comment</label>
                                            <input type="text"  class=" validate" name="comment"/>
                                        </div>


                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="did">Donor Email</label>
                                            <input type="email"  class=" validate" name="demail"/>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="code">Neddy Person Code</label>
                                            <input type="text"  class=" validate" name="code"/>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input type="submit" value="Save Allowance" class="waves-effect waves-light btn"/>

                                        </div>
                                    </div>

                                </form>
                            </div>
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



