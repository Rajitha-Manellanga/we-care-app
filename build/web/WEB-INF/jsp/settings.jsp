<%-- 
    Document   : new_donor
    Created on : Aug 18, 2018, 12:43:12 PM
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
                url: '/DifferentlyAbledTracker/loaddisability.htm '

            }).then(function displayData(response) {
                $scope.disabilitydata = response.data;
                $scope.statuscode = response.status;

                //alert($scope.disabilitydata[0].subName);

            });
        });
        app.controller('skillCtrl', function ($scope, $http) {
            $http({
                method: 'GET',
                url: '/DifferentlyAbledTracker/loadskill.htm '

            }).then(function displayData(response) {
                $scope.skilldata = response.data;
                $scope.statuscode = response.status;

                //alert($scope.disabilitydata[0].subName);

            });
        });
        app.controller('eventCtrl', function ($scope, $http) {
            $http({
                method: 'GET',
                url: '/DifferentlyAbledTracker/loadevent.htm '

            }).then(function displayData(response) {
                $scope.eventdata = response.data;
                $scope.statuscode = response.status;

                //alert($scope.disabilitydata[0].subName);

            });
            $scope.getEventValue = function () {
                var select = document.getElementById('evtcat');
                var length = select.options.length;
                for (i = 0; i < length; i++) {
                    select.options[i] = null;
                }
                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/loadsubevent.htm?eventcat=' + $scope.result


                }).then(function displayData(response) {
                    $scope.eventdata2 = response.data;
                    $scope.subresult = [];
                    for (var i in $scope.eventdata2) {

                        $scope.subresult.push($scope.eventdata2[i].subName);
                    }
                    for (var i in $scope.subresult) {
                        var opt = $scope.subresult[i];
                        var el = document.createElement("option");
                        el.textContent = opt;
                        el.value = opt;
                        document.getElementById('evtsubcat').appendChild(el);
                    }



                    //for(i=0;$scope.disabilitydata2.)
                    //alert($scope.disabilitydata[0].subName);

                });
            };
        });



    </script>





    <title>Settings</title>
</head>
<body>
    <div id="wrapper">


        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Add New Event
                </h4>
                <ol class="breadcrumb">
                    <li><a href="checkauth.htm">Home</a></li>

                </ol> 

            </div>

            <div id="page-inner"> 
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-action">
                                Add Disabilities
                            </div>

                            <div class="card-content">
                                <form  method="POST" action="/DifferentlyAbledTracker/adddisability.htm">                                      


                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Category</label>
                                            <input type="text"  name="category"class=" validate"/>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Sub Category</label>
                                            <input type="text"  name="subcategory"class=" validate"/>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="submit" value="Add Category" class="waves-effect waves-light btn"/>

                                        </div>
                                    </div>

                                </form>

                                <form  method="POST" action="/DifferentlyAbledTracker/addsubdisability.htm">                                      

                                    <div class="row">
                                        <div class="input-field col s12" ng-controller="disabilityCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>

                                            <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="disb" id="cat"> 

                                                <option ng-repeat="x in disabilitydata" >{{x.name}}</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Sub Category</label>
                                            <input type="text"  class=" validate" name="subdisb"/>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input type="submit" value="Add Sub Category" class="waves-effect waves-light btn"/>

                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-action">
                                Add Skills
                            </div>

                            <div class="card-content">
                                <form  method="POST" action="/DifferentlyAbledTracker/addskill.htm">                                      


                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Category</label>
                                            <input type="text"  name="skill"class=" validate"/>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Sub Category</label>
                                            <input type="text"  name="subcategory"class=" validate"/>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input type="submit" value="Add Category" class="waves-effect waves-light btn"/>

                                        </div>
                                    </div>

                                </form>

                                <form  method="POST" action="/DifferentlyAbledTracker/addsubskill.htm">                                      

                                    <div class="row">
                                        <div class="input-field col s12" ng-controller="skillCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>

                                            <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="category" id="cat"> 

                                                <option ng-repeat="x in skilldata" >{{x.name}}</option>
                                            </select>
                                        </div>

                                    </div>
                                    
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Sub Category</label>
                                            <input type="text"  class=" validate" name="subcategory"/>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input type="submit" value="Add Sub Category" class="waves-effect waves-light btn"/>

                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-action">
                                Add Events
                            </div>

                            <div class="card-content">
                                <form  method="POST" action="/DifferentlyAbledTracker/addevent.htm">                                      


                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Category</label>
                                            <input type="text"  class=" validate" name="event"/>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input type="submit" value="Add Category" class="waves-effect waves-light btn"/>

                                        </div>
                                    </div>

                                </form>

                                <form  method="POST" action="/DifferentlyAbledTracker/addnewneedy1.htm">                                      

                                    <div class="row">
                                        <div class="input-field col s12" ng-controller="eventCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>

                                            <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="event" id="cat"> 

                                                <option ng-repeat="x in eventdata" >{{x.name}}</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Sub Category</label>
                                            <input type="text"  class=" validate"/>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input type="submit" value="Add Sub Category" class="waves-effect waves-light btn"/>

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


