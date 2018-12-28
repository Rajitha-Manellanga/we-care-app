<%-- 
    Document   : guardian_profile
    Created on : Dec 10, 2018, 1:19:21 PM
    Author     : Rajitha
--%>


<%@page import="com.daoimp.RoleName"%>
<%-- 
    Document   : needy_profile
    Created on : Oct 26, 2018, 10:50:11 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<%@include file="resourcefile.jsp" %>
<%
   User u;
   u=(User)request.getSession().getAttribute("LOGGEDIN_USER");
   
   if(u.getRole().getName().equals(RoleName.ADMIN.toString())){%>
      <%@include  file="menu_admin.jsp" %>
    <%}%>
    <%
    if(u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_PRO.toString())||
        u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DIS.toString())||
            u.getRole().getName().equals(RoleName.DATA_ENTRY_OPERATOR_DS.toString())
        ){%>
     <%@include  file="menu_user.jsp" %>
    <%}
    %>
%>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <script src="${angularJS}" type="text/javascript"></script>
    <script type="text/javascript">
        var app = angular.module('diffabapp', []);
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
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <head>
        <title>Guardian Profile</title>
    </head>
    <body>
        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Profile Of the Guardian
                </h4>
                <ol class="breadcrumb">
                     <li><a href="checkauth.htm">Home</a></li>
                       <li><a href="viewneedy.htm">Search Persons</a></li>
                    <li><a href="needyprofile.htm?code=${code}">Person Profile</a></li>
                    
                </ol> 
                <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui/0.4.0/angular-ui.js"></script>
                <script src="${angularJS}" type="text/javascript"></script>

            </div>

            <div id="page-inner"> 
                <div class="row">
                    <div class="col-lg-12">
                        <s:url var="addURL" value="searchNeedy.htm"></s:url>
                        <s:url var="needyURL" value="n.htm"></s:url>

                            <div class="card">
                                <div class="card-action">
                                    Profile of Guardian
                                </div>

                                <div class="card-content">
                                    <div class="row">
                                        <h5>Basic Profile</h5>
                                    </div>
                                <s:url var="addURL" value="updateguardianprofile.htm"></s:url>
                                <form id="basicprofile" action="${addURL}" method="POST">
                                    <input type="hidden" value="${gur.id}" name="gid"/>
                                  
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">NIC</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${gur.nic}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">First Name</label>
                                        </div>
                                        <input type="hidden" value="${code}" name="needycode"/>
                                        <div class="input-field col s6">
                                            <input type="text"  class=" validate" name="firstname" value="${gur.firstName}"/>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Last Name</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input type="text"  class=" validate" name="lastname" value="${gur.lastName}"/>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Relationship</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${gur.relationship}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Gender</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <c:if test="${gur.gender=='M'}">
                                                <h5>Male</h5>
                                            </c:if>
                                            <c:if test="${gur.gender=='F'}">
                                                <h5>Female</h5>
                                            </c:if>
                                        </div>

                                    </div>
                                        <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Period</label>
                                        </div>
                                        <div class="input-field col s2">
                                            <h5>From : ${needygur.startingYear}</h5>
                                        </div>
                                         <div class="input-field col s2">
                                            <h5>To : ${needygur.endingYear}</h5>
                                        </div>
                                         <div class="input-field col s2">
                                                <input type="checkbox"  id="indeterminate-checkbox2" class="filled-in" name="tolevel"/>
                                                <label for="indeterminate-checkbox2">Update Year</label>
                                            </div>
                                            <div class="input-field col s2">
                                                <select class="form-control validate" name="toyear" ng-controller="addyear">
                                                    <option ng-repeat="x in years">{{x}}</option>
                                                </select>
                                            </div>

                                    </div>

                                    <div class="row">
                                        <h5>Contact Details</h5>
                                    </div>


                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Address Line1</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input type="text"  class=" validate" name="address1" value="${gur.addressLine1}"/>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Address Line2</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input type="text"  class=" validate" name="address2" value="${gur.addressLine2}"/>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">City</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input type="text"  class=" validate" name="city" value="${gur.city}"/>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Postal Code</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input type="text"  class=" validate" name="postalcode" value="${gur.postalCode}"/>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Email</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <h5>${gur.email}</h5>
                                        </div>

                                    </div>
                                    <div class="row" >
                                        <div class="input-field col s3">
                                            <label for="fname">Mobile</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input type="text"  class=" validate" name="mobile" value="${gur.mobile}"/>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <input type="submit" value="Save Changes" class="waves-effect waves-light btn" />
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
        <%@include file="resourcefilejs.jsp" %>
    </body>
</html>

