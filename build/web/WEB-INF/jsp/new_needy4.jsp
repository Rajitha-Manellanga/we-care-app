<%-- 
    Document   : new_needy3
    Created on : Jul 23, 2018, 8:24:45 PM
    Author     : Rajitha
--%>


<%@page import="com.pojos.User "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<script src="${angularJS}" type="text/javascript"></script>
<%@include file="resourcefile.jsp" %>
<%@include  file="menu_admin.jsp" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <script type="text/javascript">
        var app = angular.module('diffabapp', []);
        app.controller('skillCtrl', function ($scope, $http) {
            $http({
                method: 'GET',
                url: '/DifferentlyAbledTracker/skill.htm'

            }).then(function displayData(response) {
                $scope.skilldata = response.data;
                $scope.statuscode = response.status;
            });
        });
        app.controller('achiv', function ($scope) {
            $scope.ach = ["Participation", "Win"];
        });
        app.controller('addfreq', function ($scope) {
            $scope.freq = ["Dialy", "Monthly", "Annualy", "Other"];
        });
        app.controller('addtype', function ($scope) {
            $scope.type = ["Financial", "Equipment", "Medical", "Food & Beverages", "Other"];
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





    <title>Home</title>
</head>
<body>
    <div id="wrapper">

        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Add New Differently Abled Person
                </h4>
                <ol class="breadcrumb">
                    <li><a href="newneedy1.htm">Basic Profile</a></li>
                    <li><a href="newneedy2.htm">Contact Details</a></li>
                    <li><a href="newneedy3.htm">Guardians Details</a></li>

                </ol> 

            </div>

            <div id="page-inner"> 
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <form  method="POST" action="/DifferentlyAbledTracker/addnewneedy1.htm" modelAttribute="skill">
                                <div class="card-action">
                                    Skills
                                </div>

                                <div class="card-content">



                                    <div class="row">

                                        <div class="input-field col s3" ng-controller="skillCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>
                                            <select path="name" class="form-control validate">
                                                <option ng-repeat="x in skilldata">{{x.name}}</option>
                                            </select>
                                        </div>
                                        <div class="input-field col s3">
                                            <label>Sub Category</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate">



                                            </select>
                                        </div>

                                        <div class="input-field col s3" ng-controller="addyear">
                                            <label>From</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate">
                                                <option ng-repeat="year in years">{{year}}</option> 
                                            </select>
                                        </div>
                                        <div class="input-field col s3" ng-controller="addyear">
                                            <label>To</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate">
                                                <option ng-repeat="year in years">{{year}}</option> 
                                            </select>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="input-field col s3">
                                            <a class="waves-effect waves-light btn">Add</a>
                                        </div>
                                    </div>




                                </div>
                                <div class="card-action">
                                    Events
                                </div>
                                <div class="card-content">

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label><strong>Event</strong> </label>
                                            </br>
                                            <a>Select Event</a>
                                        </div>


                                        <div class="input-field col s6">
                                            <label>Sub Event</label>
                                            <input type="text"  class=" validate"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s6" ng-controller="achiv">
                                            <label>Achievement</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate">
                                                <option ng-repeat="x in ach">{{x}}</option>
                                            </select>
                                        </div>
                                        <div class="input-field col s6">
                                            <label>Comment</label>
                                            <input type="text" class=" validate"/>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="photo">Photo</label>
                                            </br>
                                            <br/>
                                            <input type="file" class="btn-success" value="Upload File" style="width: 70px;">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s3">
                                            <a class="waves-effect waves-light btn">Add</a>
                                        </div>
                                    </div>

                                </div>






                                <div class="card-action">
                                    Allowances
                                </div>
                                <div class="card-content">
                                   
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label><strong>Allowance</strong> </label>
                                                </br>
                                                <a>Select Allowance</a>
                                            </div>


                                            <div class="input-field col s6">
                                                <label>Date</label>
                                                <input type="date"  class=" validate"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6" ng-controller="addtype">
                                                <label>Type</label>
                                                <br/>
                                                <br/>
                                                <select  class="form-control validate">
                                                    <option ng-repeat="x in type">{{x}}</option>

                                                </select>
                                            </div>
                                            <div class="input-field col s6" ng-controller="addfreq">
                                                <label>Frequency</label>
                                                <br/>
                                                <br/>
                                                <select  class="form-control validate">
                                                    <option ng-repeat="x in freq">{{x}}</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="photo">Photo</label>
                                                </br>
                                                <br/>
                                                <input type="file" class="btn-success" value="Upload File" style="width: 70px;">

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label>Unit</label>
                                                <input type="text"  class=" validate"/>
                                            </div>
                                            <div class="input-field col s6">
                                                <label>Amount</label>
                                                <input type="text"  class=" validate"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label>Comment</label>
                                                <input type="text" class=" validate"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <a class="waves-effect waves-light btn">Add</a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">


                                                <input type="submit" value="Finish" class="waves-effect waves-light btn"/>
                                            </div>
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


    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <%@include file="resourcefilejs.jsp" %>
    <script src="${jqueryJS}" type="text/javascript"></script>

    <!-- Bootstrap Js -->
    <script src="${bootstrapminJS}" type="text/javascript"></script>

    <script src="${materializeminJS}" type="text/javascript"></script>

    <!-- Metis Menu Js -->
    <script src="${metismenuJS}" type="text/javascript"></script>
    <!-- Morris Chart Js -->
    <script src="${raphaelminJS}" type="text/javascript"></script>
    <script src="${morrisJS}" type="text/javascript"></script>


    <script src="${easypiechartJS}" type="text/javascript"></script>
    <script src="${easypiechartdataJS}" type="text/javascript"></script>

    <script src="${jquerychartJS}"></script>

    <!-- Custom Js -->
    <script src="${customJS}" type="text/javascript"></script> 

</body>
</html>

