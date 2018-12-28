<%-- 
    Document   : new_donor
    Created on : Aug 18, 2018, 12:43:12 PM
    Author     : Rajitha
--%>


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
         var app=angular.module('diffabapp',[]);
               app.controller('addtype',function ($scope){
                 $scope.type=["Sports","Talent Show"];
             });
    </script>



  

        <title>Events</title>
        </head>
        <body>
            <div id="wrapper">
              
                
                <div id="page-wrapper" >
                    <div class="header"> 
                        <h4 class="page-header">
                            Add New Event
                        </h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Forms</a></li>
                            <li class="active">Data</li>
                        </ol> 

                    </div>

                    <div id="page-inner"> 
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-action">
                                        Event Details
                                    </div>

                                    <div class="card-content">

                                        <form  method="POST" action="/DifferentlyAbledTracker/addnewneedy1.htm">                                      
                                            <s:bind path="event">
                                            <div class="row">
                                                <div class="input-field col s12" ng-controller="addtype">
                                                    <label>Type</label>
                                                    <br/>
                                                    <br/>
                                                    <select  class="form-control validate">
                                                        <option ng-repeat="x in type">{{x}}</option>

                                                    </select>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <label for="name">Name</label>
                                                    <input type="text"  class=" validate"/>
                                                </div>

                                            </div>


                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <label for="venue">Venue</label>
                                                    <input type="text"  class=" validate"/>
                                                </div>

                                            </div>


                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <label for="beginDate">Begin Date</label>
                                                    <input type="date"  class=" validate"/>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <label for="endDate">End Date</label>
                                                    <input type="date"  class=" validate"/>
                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <input type="submit" value="Add Event" class="waves-effect waves-light btn"/>

                                                </div>
                                            </div>
                                            </s:bind>
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


