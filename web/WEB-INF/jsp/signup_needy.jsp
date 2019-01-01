<%-- 
    Document   : login
    Created on : Jul 18, 2018, 5:31:55 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include  file="resourcefile.jsp" %>
<s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
<script src="${angularJS}" type="text/javascript"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <script type="text/javascript">
                var app = angular.module('diffabapp', []);
                app.controller('sequeCtrl', function ($scope, $http) {
                $http({
                    method: 'GET',
                    url: '/DifferentlyAbledTracker/loadseq.htm'

                }).then(function displayData(response) {
                    $scope.quedata = response.data;
                    $scope.statuscode = response.status;
                });
            });
            </script>
            <title>Login</title>
    </head>
    <body style="background-color: #cccccc">
        <div id="wrapper" style="background-color: #cccccc">
            <div id="page-wrapper" style="background-color: #cccccc">
                <div id="page-inner" style="background-color: #cccccc">
                    <div class="row"> 


                        <div class="col-md-6 col-sm-12 col-xs-12">                     
                            <div class="card">
                                <div class="card-action">
                                    <h3>Create New Account</h3>
                                </div>
                                <div class="card-content">
                                    <form method="POST" action="submitneedyaccount.htm">
                                        
                                        <div class="row">
                                            <div class="input-field col s12">
                                                
                                                <label for="nic">Registration Code</label>
                                                <input type="text" class=" validate" name="rcode"/>
                                            </div>
                                        </div>
                                       
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <label for="email">Guardian Email</label>
                                                <input type="email" class=" validate" name="email"/>
                                            </div>
                                        </div>
                                    
                                   
                                       
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <label>Password</label>
                                                <input type="password" class="validate" name="password"/>

                                            </div>
                                        </div>
                                     
                                       
                                   
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input type="submit" value="Signup" class="waves-effect waves-light btn" style="margin-left: 40%;margin-right: 40%"/>


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


        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <%@include file="resourcefilejs.jsp" %>
        <script src="${jqueryJS}" type="text/javascript"></script>

        <!-- Bootstrap Js -->
        <script src="${bootstrapminJS}" type="text/javascript"></script>

        <script src="${materializeminJS}" type="text/javascript"></script>
        <!-- Custom Js -->
        <script src="${customJS}" type="text/javascript"></script> 

        
    </body>
</html>
