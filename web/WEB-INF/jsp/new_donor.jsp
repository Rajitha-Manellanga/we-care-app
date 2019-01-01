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
<s:url value="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.min.js" var="angularUIJS"/>
<script src="${angularJS}" type="text/javascript"></script>
<script src="${angularUIJS}" type="text/javascript"></script>
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
        ///
        app.controller('disabilityCtrl', function ($scope, $http) {
            $http({
                method: 'GET',
                url: '/DifferentlyAbledTracker/loaddonor.htm'

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
                    url: '/DifferentlyAbledTracker/loadsubdonor.htm?eventcat=' + $scope.result

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

    <script type="text/javascript">
        var datefield = document.createElement("input");
        datefield.setAttribute("type", "date");
        if (datefield.type != "date") { //if browser doesn't support input type="date", load files for jQuery UI Date Picker
            document.write('<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />\n');
            document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"><\/script>\n');
            document.write('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"><\/script>\n');
        }


    </script>


    <script>
        if (datefield.type != "date") { //if browser doesn't support input type="date", initialize date picker widget:
            jQuery(function ($) { //on document.ready
                $('#bdate').datepicker();
                $('#edate').datepicker();
            });
        }
    </script>



    <title>Allowances</title>
</head>
<body>
    <div id="wrapper">


        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Events
                </h4>
                <ol class="breadcrumb">
                    <li><a href="checkauth.com">Home</a></li>

                </ol> 

            </div>

            <div id="page-inner"> 
                <div class="row">


                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-action">
                                Add New Donor:
                            </div>



                            <div class="card-content">

                                <form  method="POST" action="savedonor.htm">                                      

                                    <div class="row">
                                        <div class="input-field col s3" ng-controller="disabilityCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>

                                            <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="evt1" id="cat"> 

                                                <option ng-repeat="x in disabilitydata|unique : 'name'" >{{x.name}}</option>
                                            </select>
                                        </div>
                                        <div class="input-field col s3">
                                            <label>Sub Category</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate" id="subcat" name="evt2"> 

                                            </select>
                                        </div>


                                    </div>

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="name">Name</label>
                                            <input type="text"  class=" validate" name="dname"/>
                                        </div>


                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="venue">Address Line1</label>
                                            <input type="text"  class=" validate" name="address1"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="venue">Address Line2</label>
                                            <input type="text"  class=" validate" name="address2"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="venue">City</label>
                                            <input type="text"  class=" validate" name="city"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label>Country</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate" id="subcat" name="country"> 
                                                <option>Sri Lanka</option>
                                                <option>India</option>
                                                <option>Japan</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="venue">Mobile</label>
                                            <input type="tel"  class=" validate" name="mobile"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="venue">Email</label>
                                            <input type="email"  class=" validate" name="email"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="venue">Fax</label>
                                            <input type="tel"  class=" validate" name="fax"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input type="submit" value="Save Donor" class="waves-effect waves-light btn"/>

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

    </div>
    <%@include file="resourcefilejs.jsp" %>

</body>
</html>



