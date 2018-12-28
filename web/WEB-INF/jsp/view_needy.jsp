<%-- 
    Document   : view_needy
    Created on : Oct 20, 2018, 10:29:25 PM
    Author     : Rajitha
--%>


<%@page import="com.daoimp.RoleName"%>
<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<s:url value="/assets/theme1/js/dataTables/jquery.dataTables.js" var="dtableJS"/>
<s:url value="/assets/theme1/js/dataTables/dataTables.bootstrap.js" var="dtabletwoJS"/>


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

<script src="${angularJS}" type="text/javascript"></script>




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
        <title>Home</title>
    </head>
    <body onload="pagination()">
        <div id="wrapper">

            <div id="page-wrapper" >
                <div class="header"> 
                    <h4 class="page-header">
                        Search Differently Abled Person
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
                                    <div class="card-action" id="demo">
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
                                            <div class="input-field col s4">
                                                <br/>
                                                <br/>
                                                <a href="advancedsearch.htm">Advanced Search</a>
                                            </div>


                                        </div>
                                        <div class="row">
                                            <div class="input-field col s3">
                                                <input type="submit" value="Search" class="waves-effect waves-light btn" />
                                            </div>
                                        </div>
                                        <br/>
                                        <c:if test="${pages}!=null">
                                            <%
                                                int pageid = Integer.parseInt("${page}");
                                                int total = 5;
                                                if (pageid == 1) {
                                                } else {
                                                    pageid = pageid - 1;
                                                    pageid = pageid * total + 1;
                                                }
                                            %>
                                        </c:if>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <c:if test="${needyList!=null}">
                                                    <thead>
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Code</th>
                                                            <th>NIC</th>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Age(years)</th>
                                                            <th>Profile</th>
                                                        </tr>
                                                    </thead>
                                                </c:if>
                                                <tbody>
                                                    <% int x=0;%>
                                                    <c:forEach var="nlist" items="${needyList}">
                                                        <tr class="odd gradeX">
                                                            <td>
                                                                <%=++x%>
                                                            </td>
                                                            <td>
                                                                ${nlist.code}
                                                            </td>
                                                            <td>
                                                                ${nlist.nic}
                                                            </td>
                                                            <td>
                                                                ${nlist.firstName}
                                                            </td>
                                                            <td>
                                                                ${nlist.lastName}
                                                            </td>
                                                            <td>
                                                                ${nlist.getAge()}
                                                            </td>


                                                            <td>
                                                                <a href="needyprofile.htm?code=${nlist.code}" class="btn-sm btn-primary">View</a>
                                                                &nbsp;&nbsp;
                                                                <a href="needyprofile.htm?code=${nlist.code}" class="btn-sm btn-danger">Delete</a>
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
            <script src="${dtableJS}" type="text/javascript"></script>
            <script src="${dtabletwoJS}" type="text/javascript"></script>
            <script type="text/javascript">
                                                        function pagination() {
                                                            $('#dataTables-example').dataTable();
                                                        }
            </script>



            <!-- Custom Js -->

    </body>
</html>

