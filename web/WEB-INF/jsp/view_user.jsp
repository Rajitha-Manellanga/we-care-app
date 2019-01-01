<%-- 
    Document   : view_user
    Created on : Oct 28, 2018, 9:47:14 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.pojos.User"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<%@include file="resourcefile.jsp" %>
<%@include  file="menu_admin.jsp" %>
<script src="${angularJS}" type="text/javascript"></script>
<script type="text/javascript">
    var app = angular.module('diffabapp', []);

    app.controller('addcategory', function ($scope) {
        $scope.category = ["All", "NIC", "Name", "Email"];
    });


</script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />



    <head>
        <title>Search Users</title>
    </head>
    <body>
        <div id="wrapper">

            <div id="page-wrapper" >
                <div class="header"> 
                    <h4 class="page-header">
                        Search Data Entry Operators
                    </h4>
                    <ol class="breadcrumb">
                        <li><a href="adminhome.htm">Home</a></li>
                    </ol> 

                </div>

                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <s:url var="addURL" value="searchuser.htm"></s:url>
                            <s:url var="needyURL" value="n.htm"></s:url>

                                <div class="card">
                                    <div class="card-action">
                                        Search Profile
                                    </div>

                                    <div class="card-content">
                                        <form action="${addURL}" method="GET">
                                        <div class="row">
                                            <div class="input-field col s5">
                                                <label>Key Word</label>
                                                <br/>
                                                <br/>
                                                <input type="search" class=" validate" name="keyword"/>
                                            </div>
                                            <div class="input-field col s3" ng-controller="addcategory">
                                                <label>Category</label>
                                                <br/>
                                                <br/>
                                                <select class="form-control validate" name="category">
                                                    <option ng-repeat="x in category">{{x}}</option>
                                                </select>

                                            </div>
                                        


                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <input type="submit" value="Search" class="waves-effect waves-light btn" />
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>No.</th>                                                   
                                                        <th>NIC</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Email</th>
                                                        <th>View Profile</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="ulist" items="${userList}">
                                                        <tr class="odd gradeX">
                                                            <td>
                                                                ${ulist.id}
                                                            </td>
                                                            <td>
                                                                ${ulist.nic}
                                                            </td>
                                                           
                                                            <td>
                                                                ${nlist.firstName}
                                                            </td>
                                                            <td>
                                                                ${nlist.lastName}
                                                            </td>
                                                            <td>
                                                                ${nlist.email}
                                                            </td>
                                                            <td>
                                                                <a href="">View</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
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
