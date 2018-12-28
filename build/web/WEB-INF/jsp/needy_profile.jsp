<%-- 
    Document   : needy_profile
    Created on : Oct 26, 2018, 10:50:11 PM
    Author     : Rajitha
--%>

<%@page import="com.daoimp.RoleName"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            || u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DIS.toString())
            || u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DS.toString())) {%>
<%@include  file="menu_user.jsp" %>
<%}
%>
%>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <head>
        <title>Differently Abled Person Profile</title>
    </head>
    <body>
        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Search Differently Abled Person
                </h4>
                <ol class="breadcrumb">
                    <li><a href="checkauth.htm">Home</a></li>
                    <li><a href="viewneedy.htm">Search Persons</a></li>
                </ol> 
                <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.js"></script>
                <script src="${angularJS}" type="text/javascript"></script>
                <script>
                    var app = angular.module('diffabapp', []);
                    // here we define our unique filter
                    app.controller('addmartialnf', function ($scope) {
                        $scope.martial = ["Single", "Married", "Divorced", "Widowed"];
                    });

                    app.controller('addedunf', function ($scope) {
                        $scope.edu = ["Below Ordinary Level", "Upto Ordinary Level", "Upto Advanced Level", "Bachelor Degree", "Master/Phd Degree"];
                    });
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

//skills
                    app.controller('skillCtrl', function ($scope, $http) {
                        $http({
                            method: 'GET',
                            url: '/DifferentlyAbledTracker/loadskill.htm '

                        }).then(function displayData(response) {
                            $scope.skilldata = response.data;

                        });
                        $scope.getSkillValue = function () {
                            var select = document.getElementById('skillcat');
                            var length = select.options.length;
                            for (i = 0; i <= length; i++) {
                                select.options[i] = null;
                                if ((i - 1) >= 0)
                                    select.options[i - 1] = null;
                            }
                            $http({
                                method: 'GET',
                                url: '/DifferentlyAbledTracker/loadsubskill.htm?skillcat=' + $scope.result


                            }).then(function displayData(response) {
                                $scope.skilldata = response.data;
                                $scope.subresult = [];
                                for (var i in $scope.skilldata) {

                                    $scope.subresult.push($scope.skilldata[i].subName);
                                }
                                for (var i in $scope.subresult) {
                                    var opt = $scope.subresult[i];
                                    var el = document.createElement("option");
                                    el.textContent = opt;
                                    el.value = opt;
                                    document.getElementById('skillsubcat').appendChild(el);
                                }



                                //for(i=0;$scope.disabilitydata2.)
                                //alert($scope.disabilitydata[0].subName);

                            });
                        };
                    });
                    app.controller('eventCtrl', function ($scope, $http) {
                        $http({
                            method: 'GET',
                            url: '/DifferentlyAbledTracker/loadneedyevent.htm'

                        }).then(function displayData(response) {
                            $scope.disabilitydata = response.data;

                            $scope.statuscode = response.status;


                            //alert($scope.disabilitydata[0].subName);

                        });
                    });
                    app.controller('allowanceCtrl', function ($scope, $http) {
                        $http({
                            method: 'GET',
                            url: '/DifferentlyAbledTracker/loadallowance.htm'

                        }).then(function displayData(response) {
                            $scope.disabilitydata = response.data;

                            $scope.statuscode = response.status;


                            //alert($scope.disabilitydata[0].subName);

                        });

                        $scope.getValue = function () {
                            var select = document.getElementById('allowsubcat');
                            var length = select.options.length;
                            for (i = 0; i <= length; i++) {
                                select.options[i] = null;
                                if ((i - 1) >= 0)
                                    select.options[i - 1] = null;
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
                                    document.getElementById('allowsubcat').appendChild(el);
                                }



                                //for(i=0;$scope.disabilitydata2.)
                                //alert($scope.disabilitydata[0].subName);

                            });
                        };


                    });
///
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
                    app.controller('addyear', function ($scope) {
                        var year = new Date().getFullYear();
                        var range = [];
                        range.push(year);
                        for (var i = 1; i < 50; i++) {
                            range.push(year - i);
                        }
                        $scope.years = range;
                    });
                    app.controller('displayCtrl', function ($scope) {

                        $scope.disabilityList = [];
                        $scope.addDisabilityData = function () {
                            var primary = document.getElementById('cat').value;
                            var second = document.getElementById('subcat').value;
                            var timefrom = document.getElementById('from').value;
                            var timeto = document.getElementById('to').value;
                            var bool = false;
                            var tbl = document.getElementById('displayTableDisb2');
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
                                            if (x == primary && y == second) {
                                                bool = true;
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

                            } else {
                                alert('Item has already added');
                            }

                        };

                        $scope.removeList = function (index) {
                            $scope.disabilityList.splice(index, 1);
                        };

                    });
                    app.controller('skilldisplayCtrl', function ($scope) {

                        $scope.skillList = [];
                        $scope.addSkillData = function () {
                            var primary = document.getElementById('skillcat').value;
                            var second = document.getElementById('skillsubcat').value;
                            var timefrom = document.getElementById('skillfrom').value;
                            var timeto = document.getElementById('skillto').value;
                            var bool = false;
                            var tbl = document.getElementById('displayTableSkill');
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
                                            if (x == primary && y == second) {
                                                bool = true;
                                                break;
                                            }
                                        }
                                        //alert(x + "_"+y);
                                    }


                                }
                            }
                            if (bool == false) {
                                if (primary !== '? undefined:undefined ?') {
                                    $scope.disabilityList.push({Category: primary, SubCategory: second, from: timefrom, to: timeto});
                                } else {
                                    alert('Please select a value from Category');
                                }

                            } else {
                                alert('Item has already added');
                            }
                        };
                        $scope.removeList = function (index) {
                            $scope.skillList.splice(index, 1);
                        };
                    });

                </script>

            </div>

            <div id="page-inner"> 
                <div class="row">
                    <div class="col-lg-12">
                        <s:url var="addURL" value="searchNeedy.htm"></s:url>
                        <s:url var="needyURL" value="n.htm"></s:url>

                            <div class="card">
                                <div class="card-action">
                                    Profile 
                                </div>

                                <div class="card-content">
                                    <div class="row">
                                        <div class="col">
                                            <ul class="tabs">
                                                <li class="tab col s2"><a href="#test1">Basic Profile</a></li>
                                                <li class="tab col s2"><a  href="#test2">Contact Details</a></li>
                                                <li class="tab col s2"><a href="#test3">Guardians Details</a></li>
                                                <li class="tab col s2"><a href="#test4">Skills & Abilities</a></li>
                                                <li class="tab col s2"><a href="#test5">Allowances</a></li>
                                                <li class="tab col s2"><a href="#test6">Events</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="clearBoth"><br/></div>
                                    <div id="test1">
                                        <div class="row">
                                            <h5>Basic Profile</h5>
                                        </div>
                                    <s:url var="addURL" value="updateneedyprofile.htm"></s:url>
                                    <form id="basicprofile" action="${addURL}" method="POST">
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="code">Code</label>
                                            </div>
                                            <div class="input-field col s6" >
                                                <h5 >${needyperson.code}</h5>
                                                <input type="hidden" value="${needyperson.code}" name="ncode"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">First Name</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="text"  class=" validate" name="firstname" value="${needyperson.firstName}"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Last Name</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="text"  class=" validate" name="lastname" value="${needyperson.lastName}"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Full Name</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="text"  class=" validate" name="fullname" value="${needyperson.fullName}"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Gender</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <c:if test="${needyperson.gender=='M'}">
                                                    <h5>Male</h5>
                                                </c:if>
                                                <c:if test="${needyperson.gender=='F'}">
                                                    <h5>Female</h5>
                                                </c:if>

                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Date of Birth</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <h5>${needyperson.dob.toString().substring(0, 10)}</h5>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Marital Status</label>
                                            </div>
                                            <div class="input-field col s1">
                                                <h5>${needyperson.martialStatus}</h5>
                                            </div>
                                            <div class="input-field col s2">
                                                <input type="checkbox"  id="indeterminate-checkbox2" class="filled-in" name="martiallevel"/>
                                                <label for="indeterminate-checkbox2">Update</label>
                                            </div>
                                            <div class="input-field col s3">
                                                <select class="form-control validate" name="martialans" ng-controller="addmartialnf">
                                                    <option ng-repeat="x in martial">{{x}}</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Educational Level</label>
                                            </div>
                                            <div class="input-field col s1">
                                                <h5>${needyperson.educationalLevel}</h5>
                                            </div>
                                            <div class="input-field col s2">
                                                <input type="checkbox"  id="indeterminate-checkbox3" class="filled-in" name="edulevel"/>
                                                <label for="indeterminate-checkbox3">Update</label>
                                            </div>
                                            <div class="input-field col s3">
                                                <select class="form-control validate" name="eduans" ng-controller="addedunf">
                                                    <option ng-repeat="x in edu">{{x}}</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Died On</label>
                                            </div>
                                            <div class="input-field col s6">

                                                <table id="displayTable" class="table table-striped table-bordered table-hover responsive-table">
                                                    <tr>
                                                        <th>Died On</th>
                                                        <th>Reason</th>
                                                        <th>Location</th>
                                                        <th>Comment</th>
                                                    </tr>
                                                    <tbody>
                                                        <c:forEach var="ndeath" items="${needyperson.deathDetails}">
                                                            <tr>
                                                                <td>${ndeath.deathDate.toString().substring(0, 10)}</td>
                                                                <td>${ndeath.reason}</td>
                                                                <td>${ndeath.location}</td>
                                                                <td>${ndeath.comment}</td>
                                                            </tr> 

                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                            </div>

                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <label for="fname">Disabilities</label>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="input-field col s3"></div>
                                            <div class="input-field col s6">
                                                <table id="displayTableDisb" class="table table-striped table-bordered table-hover responsive-table">
                                                    <tr>
                                                        <th>Category</th>
                                                        <th>Sub Category</th>
                                                        <th>From Year</th>
                                                        <th>To Year</th>
                                                    </tr>
                                                    <tbody>


                                                        <c:forEach var="ndisability" items="${needyperson.privateRecordHasNeedyPersons}">
                                                            <c:if test="${ndisability.privateRecord.type=='DISABILITY'}">


                                                                <tr>
                                                                    <td>${ndisability.privateRecord.name}</td>
                                                                    <td>${ndisability.privateRecord.subName}</td>
                                                                    <td>${ndisability.startingYear}</td>
                                                                    <td>${ndisability.endingYear}</td>
                                                                </tr> 
                                                            </c:if>
                                                        </c:forEach>


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3"></div>
                                            <div class="input-field col s2" ng-controller="disabilityCtrl">
                                                <label>Category</label>
                                                <br/>
                                                <br/>

                                                <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="disb" id="cat"> 

                                                    <option ng-repeat="x in disabilitydata|unique : 'name'" >{{x.name}}</option>
                                                </select>
                                            </div>
                                            <div class="input-field col s2">
                                                <label>Sub Category</label>
                                                <br/>
                                                <br/>
                                                <select  class="form-control validate" id="subcat" > 

                                                </select>
                                            </div>


                                            <div class="input-field col s2" ng-controller="addyear">
                                                <label>From</label>
                                                <br/>
                                                <br/>
                                                <select  class="form-control validate" id="from">
                                                    <option ng-repeat="year in years">{{year}}</option>
                                                </select>

                                            </div>
                                            <div class="input-field col s2" ng-controller="addyear">
                                                <label>To</label>
                                                <br/>
                                                <br/>
                                                <select  class="form-control validate" id="to">
                                                    <option ng-repeat="year in years">{{year}}</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3"></div>
                                            <div class="input-field col s3" ng-controller="displayCtrl">
                                                <button type="button"class="waves-effect waves-light btn" ng-click="addDisabilityData()">Add</button>
                                                <br/>
                                                <br/>
                                                <table id="displayTableDisb2" class="table table-striped table-bordered table-hover responsive-table">
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

                                            </div>
                                        </div>

                                        <p>

                                            <input type="checkbox" id="indeterminate-checkbox" ng-model="death" ng-checked="checked == true" name="booleandeath" ng-disabled="checked == false"/>


                                            <label for="indeterminate-checkbox">Death</label>
                                        </p>


                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="fname">Died On</label>
                                                <br/>

                                                <input type="date" id="deathday" name="deathday" ng-disabled="death == false" />
                                            </div>
                                            <div class="input-field col s6">
                                                <label for="fname">Reason</label>
                                                <br/>
                                                <input type="text"  class=" validate" name="reason" ng-disabled="death == false"/>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="location">Location</label>
                                                <br/>
                                                <input type="text"  class=" validate" name="location" ng-disabled="death == false" />
                                            </div>
                                            <div class="input-field col s6">
                                                <label for="comment">Comment</label>
                                                <br/>
                                                <input type="text"  class=" validate" name="comment" ng-disabled="death == false"/>
                                            </div>

                                        </div>


                                        <input type="submit" value="Save Changes" class="waves-effect waves-light btn" />
                                    </form>
                                </div>
                                <div id="test2">

                                    <s:url var="addcontactURL" value="updateneedycontact.htm"></s:url>
                                    <form id="contact" action="${addcontactURL}" method="POST">

                                        <input type="hidden" value="${needyperson.code}" name="ncode"/>
                                        <h5>Contact Details</h5>


                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Address Line1</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="text"  class=" validate" name="address1" value="${needyperson.addressLine1}"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Address Line2</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="text"  class=" validate" name="address2" value="${needyperson.addressLine2}"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">City</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="text"  class=" validate" name="city" value="${needyperson.city}"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Postal Code</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="text"  class=" validate" name="postal" value="${needyperson.postalCode}"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Email</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="email"  class=" validate" name="email" value="${needyperson.email}"/>
                                            </div>

                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s3">
                                                <label for="fname">Mobile</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="text"  class=" validate" name="mobile" value="${needyperson.mobile}"/>
                                            </div>

                                        </div>
                                        <div class="row">

                                        </div>
                                        <input type="submit" value="Save Changes" class="waves-effect waves-light btn" />
                                    </form>
                                </div>
                                <div id="test3">
                                    <form id="guardian" method="POST" action="updateguardian.htm">
                                        <input type="hidden" value="${needyperson.code}" name="gncode"/>
                                        <h5>Guardians Details</h5>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>NIC</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Relationship</th>
                                                        <th>From</th>
                                                        <th>To</th>
                                                        <th>View Profile</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="gurd" items="${needyperson.needyPersonHasGuardians}">
                                                        <tr class="odd gradeX">
                                                            <td>${gurd.guardian.id}</td>
                                                            <td>${gurd.guardian.nic}</td>
                                                            <td>${gurd.guardian.firstName}</td>
                                                            <td>${gurd.guardian.lastName}</td>
                                                            <td>${gurd.guardian.relationship}</td>
                                                            <td>${gurd.startingYear}</td>
                                                            <td>${gurd.endingYear}</td>
                                                            <td><a href="guardianprofile.htm?code=${needyperson.code}&gid=${gurd.guardian.id}&gval=${gurd.id}">View Profile</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>



                                        <div class="row">
                                            <h5>Add New Guardian</h5>
                                        </div>
                                        <div class="row">


                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6" ng-controller="addrel">
                                                <label>Guardian's Type</label>
                                                <br/>
                                                <br/>
                                                <select class="form-control validate" name="gtype">
                                                    <option ng-repeat="x in rel">{{x}}</option>
                                                </select>
                                            </div>
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
                                                </select>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="firstName">First Name</label>
                                                <input type="text"  class=" validate" name="firstname"/>
                                            </div>
                                            <div class="input-field col s6">
                                                <label for="lastName">Last Name</label>
                                                <input type="text"  class=" validate" name="lastname"/>
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="row">

                                            <div class="input-field col s6">
                                                <label for="gender">Gender</label>
                                                <br/>
                                                <p>
                                                    <input name="ggender" type="radio" value="M" id="gtest1"/>
                                                    <label for="gtest1">Male</label>
                                                </p>
                                                <div class="clearfix"></div>
                                                <p>
                                                    <input name="ggender" type="radio" value="F" id="gtest2"/>
                                                    <label for="gtest2">Female</label>
                                                </p>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="nic">NIC</label>
                                                <input type="text"  class=" validate" name="gnic"/>
                                            </div>

                                        </div>
                                        <br/>

                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="addressLine1">Address Line 1</label>
                                                <input type="text"  class=" validate" name="gaddr1"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="addressLine2">Address Line 2</label>
                                                <input type="text" class=" validate" name="gaddr2"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="city">City</label>
                                                <input type="text" class=" validate" name="gcity"/>
                                            </div>
                                            <div class="input-field col s6">
                                                <label for="city">Postal Code</label>
                                                <input type="text" class=" validate" name="gpostalcode"/>
                                            </div>
                                        </div>
                                        <br/>

                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="mobile">Mobile Number</label>
                                                <input type="text" class=" validate" name="gmobile"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="email">Email</label>
                                                <input type="email" class=" validate" name="gemail"/>
                                            </div>
                                        </div>







                                        <div class="row">
                                            <div class="input-field col s6">



                                                <input type="submit" value="Save Changes" class="waves-effect waves-light btn"/>
                                            </div>
                                        </div>


                                    </form>
                                </div>
                                <div id="test4">

                                    <h5>Skills</h5>
                                    <form method="POST" action="updateskills.htm">
                                        <div class="row">
                                            <input type="hidden" value="${needyperson.code}" name="skcode"/>
                                            <div class="input-field col s6">
                                                <table id="displayTableSkill" class="table table-striped table-bordered table-hover responsive-table">
                                                    <tr>
                                                        <th>Category</th>
                                                        <th>Sub Category</th>
                                                        <th>From Year</th>
                                                        <th>To Year</th>
                                                    </tr>
                                                    <tbody>

                                                        <c:forEach var="ndisability" items="${needyperson.privateRecordHasNeedyPersons}">
                                                            <c:if test="${ndisability.privateRecord.type=='SKILL'}">
                                                                <tr>
                                                                    <td>${ndisability.privateRecord.name}</td>
                                                                    <td>${ndisability.privateRecord.subName}</td>
                                                                    <td>${ndisability.startingYear}</td>
                                                                    <td>${ndisability.endingYear}</td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <h5>Add New Skills</h5>
                                        <s:url var="addskill" value="updateskills.htm"></s:url>

                                            <div class="row">
                                                <div class="input-field col s2" ng-controller="skillCtrl">
                                                    <label>Category</label>
                                                    <br/>
                                                    <br/>

                                                    <select  class="form-control validate" ng-change="getSkillValue()" ng-model="result" name="skillcategory" id="skillcat"> 

                                                        <option ng-repeat="x in skilldata|unique : 'name'" >{{x.name}}</option>
                                                    </select>
                                                </div>
                                                <div class="input-field col s2">
                                                    <label>Sub Category</label>
                                                    <br/>
                                                    <br/>
                                                    <select  class="form-control validate" id="skillsubcat" > 

                                                    </select>
                                                </div>


                                                <div class="input-field col s2" ng-controller="addyear">
                                                    <label>From</label>
                                                    <br/>
                                                    <br/>
                                                    <select  class="form-control validate" id="skillfrom">
                                                        <option ng-repeat="year in years">{{year}}</option>
                                                    </select>

                                                </div>
                                                <div class="input-field col s2" ng-controller="addyear">
                                                    <label>To</label>
                                                    <br/>
                                                    <br/>
                                                    <select  class="form-control validate" id="skillto">
                                                        <option ng-repeat="year in years">{{year}}</option>
                                                    </select>
                                                </div>

                                            </div>



                                            <div class="row">

                                                <div class="input-field col s3" ng-controller="skilldisplayCtrl">
                                                    <button type="button"class="waves-effect waves-light btn" ng-click="addSkillData()">Add</button>
                                                    <br/>
                                                    <br/>
                                                    <table id="displayTable" class="table table-striped table-bordered table-hover responsive-table">
                                                        <tr>
                                                            <th>Category</th>
                                                            <th>Sub Category</th>
                                                            <th>From Year</th>
                                                            <th>To Year</th>
                                                        </tr>
                                                        <tbody ng-repeat="x in skillList">
                                                            <tr>
                                                                <td>{{x.Category}}<input type="hidden" name="skcat" value="{{x.Category}}"/></td>
                                                                <td>{{x.SubCategory}}<input type="hidden" name="sksubcat" value="{{x.SubCategory}}"/></td>
                                                                <td>{{x.from}}<input type="hidden" name="skfrom"value="{{x.from}}"></td>
                                                                <td>{{x.to}}<input type="hidden" name="skto" value="{{x.to}}"/></td>
                                                                <td><input type="button" ng-click="removeList($index)" value="Remove" /></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="input-field col s3">
                                                    <input type="submit" value="Save Changes" class="waves-effect waves-light btn" />
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div id="test5">
                                        <form id="allowance" method="POST" action="saveallowance.htm">

                                            <h5>Allowance Details</h5>
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>Donor</th>
                                                            <th>Category</th>
                                                            <th>Date</th>
                                                            <th>Unit</th>
                                                            <th>Amount</th>
                                                            <th>Comment</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="gurd" items="${needyperson.allowances}">
                                                        <tr class="odd gradeX">
                                                            <td>${gurd.allowanceDonator.name}</td>
                                                            <td>${gurd.allowanceDonator.privateRecord.name}  ${gurd.allowanceDonator.privateRecord.subName}</td>
                                                            <td>${gurd.date}</td>
                                                            <td>${gurd.unit}</td>
                                                            <td>${gurd.amount}</td>
                                                            <td>${gurd.comment}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>



                                        <div class="row">
                                            <h5>Add New Allowance</h5>
                                        </div>
                                        <div class="row" >

                                            <div class="input-field col s3" ng-controller="allowanceCtrl">
                                                <label>Category</label>
                                                <br/>
                                                <br/>

                                                <select  class="form-control validate" ng-change="getValue()" ng-model="result" name="al1" id="allowcat"> 

                                                    <option ng-repeat="x in disabilitydata|unique : 'name'" >{{x.name}}</option>
                                                </select>
                                            </div>
                                            <div class="input-field col s3">
                                                <label>Sub Category</label>
                                                <br/>
                                                <br/>
                                                <select  class="form-control validate" id="allowsubcat" name="al2"> 

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
                                                <input type="text"  class=" validate" name="alcomment"/>
                                            </div>


                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label for="did">Donor Email</label>
                                                <input type="email"  class=" validate" name="alemail"/>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="hidden" name="alcode" value="${needyperson.code}"/>

                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="input-field col s6">
                                                <input type="submit" value="Save Allowance" class="waves-effect waves-light btn"/>

                                            </div>
                                        </div>










                                    </form>
                                </div>
                                <div id="test6">
                                    <form id="event" method="POST" action="saveneedyevent.htm">
                                        <input type="hidden" value="${needyperson.code}" name="gncode"/>
                                        <h5>Events Details</h5>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Event</th>
                                                        <th>Acheivement</th>
                                                        <th>Comment</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="gurd" items="${needyperson.needyPersonHasEvents}">
                                                        <tr class="odd gradeX">
                                                            <td>${gurd.id}</td>
                                                            <td>${gurd.event.description}</td>
                                                            <td>${gurd.achievment}</td>
                                                            <td>${gurd.comment}</td>


                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>



                                        <div class="row">
                                            <h5>Add New Events</h5>
                                        </div>
                                        <div class="row" >
                                            <div class="input-field col s6" ng-controller="eventCtrl">
                                                <label>Event</label>
                                                <br/>
                                                <br/>

                                                <select  class="form-control validate"  ng-model="result" name="eevent" id="cat"> 

                                                    <option ng-repeat="x in disabilitydata" >{{x.description}}</option>
                                                </select>
                                            </div>


                                            <div class="input-field col s6">
                                                <label for="unit">Achivement</label>
                                                <br/>
                                                <br/>

                                                <select class="form-control validate" name="each"> 

                                                    <option>Win</option>
                                                    <option>Participation</option>
                                                </select>
                                            </div>
                                        </div>




                                        <div class="row">



                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <label for="comment">Comment</label>
                                                <input type="text"  class=" validate" name="ecomment"/>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="hidden" name="ecode" value="${needyperson.code}"/>

                                            </div>


                                        </div>



                                        <div class="row">
                                            <div class="input-field col s6">
                                                <input type="submit" value="Save Cahnges" class="waves-effect waves-light btn"/>

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


