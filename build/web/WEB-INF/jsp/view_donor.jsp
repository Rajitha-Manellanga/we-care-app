<%-- 
    Document   : view_needy
    Created on : Oct 20, 2018, 10:29:25 PM
    Author     : Rajitha
--%>


<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<s:url value="/assets/theme1/js/html2csv.js" var="csvJS"/>
<s:url value="/assets/theme1/js/dataTables/jquery.dataTables.js" var="dtableJS"/>
<s:url value="/assets/theme1/js/dataTables/dataTables.bootstrap.js" var="dtabletwoJS"/>
<%@include file="resourcefile.jsp" %>
<%@include  file="menu_admin.jsp" %>
<script src="${dtableJS}" type="text/javascript"></script>
<script src="${dtabletwoJS}" type="text/javascript"></script>
<script src="${angularJS}" type="text/javascript"></script>
<script src="${csvJS}" type="text/javascript"></script>
<script type="text/javascript">
    var app = angular.module('diffabapp', []);

    app.controller('addcategory', function ($scope) {
        $scope.category = ["All", "Code", "NIC", "Name", "Email", "Disability"];
    });


</script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />



    <head>
        <title>View Donor</title>
    </head>
    <body>
        <div id="wrapper">

            <div id="page-wrapper" >
                <div class="header"> 
                    <h4 class="page-header">
                        Search Donors
                    </h4>
                    <ol class="breadcrumb">
                        <li><a href="checkauth.htm">Home</a></li>
                    </ol> 

                </div>

                <div id="page-inner"> 
                    <div class="row">
                        <div class="col-lg-12">
                            <s:url var="addURL" value="searchNeedy.htm"></s:url>
                            <s:url var="needyURL" value="n.htm"></s:url>

                                <div class="card">
                                    <div class="card-action">
                                        Search Profile
                                    </div>

                                    <div class="card-content">
                                        <form action="donorprofile.htm" method="GET">
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <label>Name</label>
                                                <br/>
                                                <br/>
                                                <input type="search" class=" validate" name="keyword"/>
                                            </div>
                                            <div class="input-field col s3">
                                                <input type="submit" value="Search" class="waves-effect waves-light btn" />
                                            </div>


                                        </div>

                                        <br/>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <c:if test="${donlist!=null}">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                        
                                                            <th>Address</th>
                                                            <th>Country</th>
                                                            <th>Email</th>
                                                            <th>Mobile</th>
                                                            <th>Fax</th>
                                                        </tr>
                                                    </thead>
                                                </c:if>
                                                <tbody>

                                                    <c:forEach var="dlist" items="${donlist}">
                                                        <tr class="odd gradeX">
                                                            <td>
                                                                ${dlist.name}
                                                            </td>
                                                            <td>
                                                             ${dlist.addressLine1} ${dlist.addressLine2} ${dlist.city}
                                                            </td>
                                                            <td>
                                                               ${dlist.country}
                                                            </td>
                                                            <td>
                                                                ${dlist.email}
                                                            </td>
                                                            <td>
                                                                ${dlist.email}
                                                            </td>
                                                            <td>
                                                                ${dlist.mobile}
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

                <!-- /.col-lg-12 --> 
                <footer><p>All right reserved. Template by: <a href="https://webthemez.com/admin-template/">WebThemez.com</a></p></footer>
            </div>
            <!-- /. PAGE INNER  -->


            <!-- /. WRAPPER  -->
            <!-- JS Scripts-->
            <!-- jQuery Js -->
            <%@include file="resourcefilejs.jsp" %>




            <!-- Custom Js -->

    </body>
</html>

