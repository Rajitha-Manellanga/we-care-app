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
        app.controller('disabilityCtrl', function ($scope, $http) {
            $http({
                method: 'GET',
                url: '/DifferentlyAbledTracker/adddisability.htm'

            }).then(function displayData(response) {

                $scope.disabilitydata = response.data;


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
                                <form  method="POST" action="addpr.htm?cat=DISABILITY">                                      


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

                                <form  method="POST" action="addsubpr.htm?cat=DISABILITY">                                      

                                    <div class="row">
                                        <div class="input-field col s12" ng-controller="disabilityCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>

                                            <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="category" id="cat"> 

                                                <option ng-repeat="x in disabilitydata|unique:'name'" >{{x.name}}</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="name">Sub Category:</label>
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
                                Add Skills
                            </div>

                            <div class="card-content">
                                <form  method="POST" action=addpr.htm?cat=SKILL">                                      


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
                                        <div class="input-field col s6">
                                            <input type="submit" value="Add Category" class="waves-effect waves-light btn"/>

                                        </div>
                                    </div>

                                </form>

                                <form  method="POST" action=addsubpr.htm?cat=SKILL">                                      

                                    <div class="row">
                                        <div class="input-field col s12" ng-controller="skillCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>

                                            <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="category" id="cat"> 

                                                <option ng-repeat="x in skilldata|unique:'name'" >{{x.name}}</option>
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
                    

                </div>
            </div>
        </div>


    </div>
    <%@include file="resourcefilejs.jsp" %>

</body>
</html>


