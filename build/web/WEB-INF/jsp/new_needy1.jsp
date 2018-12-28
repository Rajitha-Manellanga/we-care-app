<%-- 
    Document   : index
    Created on : Jul 17, 2018, 12:34:33 PM
    Author     : Rajitha
--%>


<%@page import="com.daoimp.RoleName"%>
<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>

<%@include file="resourcefile.jsp" %>


<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<script src="${angularJS}" type="text/javascript"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript">
        var displayResult = function () {
            var msg = location.search;
           
        }
    </script>


    <script type="text/javascript">

        var app = angular.module('diffabapp', []);

        app.controller('addbloodgrp', function ($scope) {
            $scope.bloodcat = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
        });
        app.controller('addmartial', function ($scope) {
            $scope.martial = ["Single", "Married", "Divorced", "Widowed"];
        });

        app.controller('addedu', function ($scope) {
            $scope.edu = ["Below Ordinary Level", "Upto Ordinary Level", "Upto Advanced Level", "Bachelor Degree", "Master/Phd Degree"];
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
        // here we define our unique filter
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



                    //for(i=0;$scope.disabilitydata2.)
                    //alert($scope.disabilitydata[0].subName);

                });
            };


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

        app.controller('displayCtrl', function ($scope) {

            $scope.disabilityList = [];
            $scope.addDisabilityData = function () {
                var primary = document.getElementById('cat').value;
                var second = document.getElementById('subcat').value;
                var timefrom = document.getElementById('from').value;
                var timeto = document.getElementById('to').value;
                var bool = false;
                var tbl = document.getElementById('displayTable');
                for (var i = 0, row; row = tbl.rows[i]; i++) {

                    //iterate through rows
                    //rows would be accessed using the "row" variable assigned in the for loop
                    for (var j = 0, col; col = row.cells[j]; j++) {
                        //iterate through columns
                        //columns would be accessed using the "col" variable assigned in the for loop
                        var count = 0;

                        if (i > 0) {
                            var x = col.innerHTML.split('<')[0];
                            if (row.cells[j + 1] != null) {
                                var y = row.cells[j + 1].innerHTML.split('<')[0];
                                if(x==primary && y==second){
                                    bool=true;
                                    break;
                                }
                            }
                            //alert(x + "_"+y);
                        }


                    }
                }


                if (bool === false) {

                    for (var i = 0; i < $scope.disabilityList.length; i++) {
                        var value = $scope.disabilityList[i];

                    }

                    if (primary !== '? undefined:undefined ?') {
                        $scope.disabilityList.push({Category: primary, SubCategory: second, from: timefrom, to: timeto});
                    }
                    else
                        alert('Please select a value from Category');

                }else{
                    alert('Item has already added');
                }
                
            };

            $scope.removeList = function (index) {
                $scope.disabilityList.splice(index, 1);
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
                $('#birthday').datepicker();
                $('#deathday').datepicker();
            });
        }
    </script>


    <title>Add New</title>
</head>

<body onload="displayResult">


    <div id="wrapper">
        <%
            User u;
            u = (User) request.getSession().getAttribute("LOGGEDIN_USER");

            if (u.getRole().getName().equals(RoleName.ADMIN.toString())) {%>
        <%@include  file="menu_admin.jsp" %>
        <%}%>
        <%
            if (u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_PRO.toString())||
                    u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DIS.toString())||
                    u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DS.toString())
            ) {%>
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

                    <li><a href="checkauth.htm">Home</a></li>
                </ol> 

            </div>
            <p style="color: #ff0000">${errormsg}</p>
            <div id="page-inner"> 
                <div class="row" >
                    <div class="col-lg-12">
                        <div class="card">
                            <h5><b>Basic Profile</b></h5>


                            <div class="card-content">
                                <s:url var="addURL" value="newneedy2.htm"></s:url>
                                <form  method="POST" action="${addURL}">

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="code">Code</label>
                                            <br/>
                                            <p >${needycode}</p>
                                            <input type="hidden" value="${needycode}" name="code">
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="nic">NIC</label>
                                            <input type="text"class=" validate" name="nic" value="${nic}" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="fname">First Name</label>
                                            <input type="text"  class=" validate" name="firstname" value="${firstname}" />
                                            <p>${fname}</p>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="lname">Last Name</label>
                                            <input type="text" class=" validate" name="lastname" value="${lastname}"/>
                                            <p>${lname}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <label for="fullName">Full Name</label>
                                            <br/>
                                            <input type="text" class=" validate" name="fullname" value="${fullname}"/>
                                            <p>${flname}</p>
                                        </div>

                                    </div>
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
                                            <p>${gn}</p>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="dob">Date of Birth</label>
                                            <br/>
                                            <br/>
                                            <input type="date" id="birthday" name="dob"  placeholder="DD/MM/YYYY"/>
                                            <p>${doberror}</p>

                                        </div>


                                    </div>
                                    <div class="row">

                                        <div class="input-field col s4">
                                            <label for="photo">Photo</label>
                                            <br/>
                                            <br/>
                                            <input type="file" class="btn-success" value="Upload File" style="width: 70px;">

                                        </div>


                                    </div>

                                    <div class="row" >
                                        <div class="input-field col s6" ng-controller="addbloodgrp">
                                            <label>Blood Group</label>
                                            <br/>
                                            <br/>
                                            <select class="form-control validate" name="bloodgroup">
                                                <option ng-repeat="x in bloodcat">{{x}}</option>
                                            </select>

                                        </div>
                                        <div class="input-field col s6" ng-controller="addmartial">
                                            <label>Martial Status</label>
                                            <br/>
                                            <br/>
                                            <select class="form-control validate" name="martialstatus">
                                                <option ng-repeat="x in martial">{{x}}</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="row">

                                        <div class="input-field col s6" ng-controller="dsCtrl">

                                            <label>Divisional Secretariat</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate" name="ds">
                                                <option ng-repeat="x in dsdata">{{x.name}}</option>
                                            </select>


                                        </div>

                                        <div class="input-field col s6" ng-controller="addedu">

                                            <label>Educational Level</label>
                                            <br/>
                                            <br/> 
                                            <select class="form-control validate" name="edulevel">
                                                <option ng-repeat="x in edu">{{x}}</option>
                                            </select>

                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s3">
                                            <label>Disabilities</label>
                                            <br/>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="input-field col s3" ng-controller="disabilityCtrl">
                                            <label>Category</label>
                                            <br/>
                                            <br/>

                                            <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="disb1" id="cat"> 

                                                <option ng-repeat="x in disabilitydata|unique : 'name'" >{{x.name}}</option>
                                            </select>
                                        </div>
                                        <div class="input-field col s3">
                                            <label>Sub Category</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate" id="subcat" > 

                                            </select>
                                        </div>


                                        <div class="input-field col s3" ng-controller="addyear">
                                            <label>From</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate" id="from">
                                                <option ng-repeat="year in years">{{year}}</option>
                                            </select>

                                        </div>
                                        <div class="input-field col s3" ng-controller="addyear">
                                            <label>To</label>
                                            <br/>
                                            <br/>
                                            <select  class="form-control validate" id="to">
                                                <option ng-repeat="year in years">{{year}}</option>
                                            </select>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="input-field col s3" ng-controller="displayCtrl">
                                            <button type="button"class="waves-effect waves-light btn" ng-click="addDisabilityData()">Add</button>
                                            <br/>
                                            <br/>
                                            <table id="displayTable" class="table table-striped table-bordered table-hover responsive-table">
                                                <tr>
                                                    <th>Category</th>
                                                    <th>Sub Category</th>
                                                    <th>From Year</th>
                                                    <th>To Year</th>
                                                </tr>
                                                <tbody ng-repeat="x in disabilityList">
                                                    <tr>
                                                        <td>{{x.Category}}<input type="hidden" name="cat" value="{{x.Category}}"></td>
                                                        <td>{{x.SubCategory}}<input type="hidden" name="subcat" value="{{x.SubCategory}}"></td>
                                                        <td>{{x.from}}<input type="hidden" name="from"value="{{x.from}}"></td>
                                                        <td>{{x.to}}<input type="hidden" name="to" value="{{x.to}}"></td>
                                                        <td><input type="button" ng-click="removeList($index)" value="Remove" /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <p style="color: #ff0000">${disberror}</p>

                                        </div>
                                        <br/>



                                    </div>
                                    <br/>


                                    <br/>

                                    <p>
                                        <input type="checkbox" id="indeterminate-checkbox" ng-model="death" ng-checked="checked == true" name="booleandeath" ng-disabled="checked == false"/>
                                        <label for="indeterminate-checkbox">Death</label>
                                    </p>

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="fname">Died On</label>
                                            <br/>
                                            <input type="date" id="deathday" name="deathday" ng-disabled="death == false"/>
                                            <p>${deatherror}</p>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="fname">Reason</label>
                                            <br/>
                                            <input type="text"  class=" validate" name="reason" ng-disabled="death == false"/>
                                            <p>${deathvalue}</p>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="fname">Location</label>
                                            <br/>
                                            <input type="text"  class=" validate" name="location" ng-disabled="death == false" />
                                            <p>${deathvalue}</p>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="fname">Comment</label>
                                            <br/>
                                            <input type="text"  class=" validate" name="comment" ng-disabled="death == false"/>
                                            <p>${deathvalue}</p>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="input-field col s12">

                                            <input type="submit" value="Next" class="waves-effect waves-light btn" />
                                        </div>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- /.col-lg-12 --> 
                <footer><p>All right reserved. Template by: <a href="https://webthemez.com/admin-template/">WebThemez.com</a></p></footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>


    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->


    <!-- Bootstrap Js -->

    <%@include file="resourcefilejs.jsp" %>

</body>
</html>
