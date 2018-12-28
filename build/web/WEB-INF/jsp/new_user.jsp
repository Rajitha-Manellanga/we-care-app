



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include file="resourcefile.jsp" %>
<%@include  file="menu_admin.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
    <script src="${angularJS}" type="text/javascript"></script>

    <title>Home</title>
</head>
<script type="text/javascript">
    var app = angular.module('diffabapp', []);
    app.controller('provinceCtrl', function ($scope, $http) {
        $http({
            method: 'GET',
            url: '/DifferentlyAbledTracker/loadprovince.htm'

        }).then(function displayData(response) {
            $scope.prdata = response.data;
            $scope.statuscode = response.status;
        });
    });
    app.controller('districtCtrl', function ($scope, $http) {
        $http({
            method: 'GET',
            url: '/DifferentlyAbledTracker/loaddistrict.htm'

        }).then(function displayData(response) {
            $scope.dctdata = response.data;

        });
    });
    app.controller('dsCtrl', function ($scope, $http) {
        $http({
            method: 'GET',
            url: '/DifferentlyAbledTracker/loadds.htm'

        }).then(function displayData(response) {
            $scope.dsdata = response.data;

        });
    });
</script>
<body>



    <div id="wrapper">

        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Add New User
                </h4>
                <ol class="breadcrumb">
                    <li><a href="adminhome.htm">Home</a></li>
                 
                </ol> 

            </div>

            <div id="page-inner"> 
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-action">
                                User Profile
                            </div>

                            <div class="card-content">
                                <s:url var="addURL" value="registerdeo.htm"></s:url>
                                <form  method="POST" action="${addURL}">                                      

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="firstName">First Name</label>
                                            <input type="text" class=" validate" name="firstname"/>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="lastName">Last Name</label>

                                            <input type="text"  class=" validate" name="lastname"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="input-field col s1">
                                            <label for="gender">Gender</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <p>
                                                <input class="with-gap" name="gender" type="radio" id="test1"  />
                                                <label for="test1">Male</label>
                                            </p>
                                            <p>
                                                <input class="with-gap" name="gender" type="radio" id="test2"  />
                                                <label for="test2">Female</label>

                                            </p>
                                            <input type="radio" value = "M" label = "Male" name="gender"/>
                                            <input type="radio"value = "F" label = "Female" name="gender"/>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="dob">Date of Birth</label>
                                            <input type="date" name="dob"/>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="nic">NIC</label>
                                            <input type="text" name="nic" class=" validate"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="address">Address Line 1</label>
                                            <input type="text" name="addressline1" class=" validate"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="address">Address Line 2</label>
                                            <input type="text" name="addressline2" class=" validate"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="address">City</label>
                                            <input type="text" name="city" class=" validate"/>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="address">Postal Code</label>
                                            <input type="text" name="postalcode" class=" validate"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="level">Level</label>
                                            <br/>
                                            <br/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s2">
                                            <input class="with-gap" name="deolevel" type="radio" id="pr"  value="province"/>
                                            <label for="pr">Province</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <select class="form-control validate" name="cprovince" ng-controller="provinceCtrl">
                                                <option ng-repeat="x in prdata">{{x.name}}</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="input-field col s2">
                                            <input class="with-gap" name="deolevel" type="radio" id="drct" value="district"/>
                                            <label for="drct">District</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <select class="form-control validate" name="cdistrict" ng-controller="districtCtrl">
                                                <option ng-repeat="x in dctdata">{{x.name}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s2">
                                            <input class="with-gap" name="deolevel" type="radio" id="ds"  value="ds"/>
                                            <label for="ds">Divisional Secretariat</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <select class="form-control validate" name="cds" ng-controller="dsCtrl">
                                                <option ng-repeat="x in dsdata">{{x.name}}</option>
                                            </select>
                                        </div>
                                        
                                    </div>

                                    <br/>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="mobile">Mobile Number</label>
                                            <input type="text" name="mobile" class=" validate"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="email">Email</label>
                                            <input type="email" name="useremail" class=" validate"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <br/>







                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input type="submit" value="Register User" class="waves-effect waves-light btn"/>

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
    <%@include file="resourcefilejs.jsp" %>

</body>
</html>

