<%-- 
    Document   : new_donor
    Created on : Aug 18, 2018, 12:43:12 PM
    Author     : Rajitha
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include file="menu_admin.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="diffabapp">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <script type="text/javascript">
         var app=angular.module('diffabapp',[]);
             
               app.controller('addtitle',function ($scope){
                 $scope.title=["Mr.","Mrs.","Miss","Ven.","Dr.","Organization"];
             });
               app.controller('addtype',function ($scope){
                 $scope.type=["Person","Institute"];
             });
    </script>




    

        <title>Home</title>
        </head>
        <body>
            <div id="wrapper">
                
                <div id="page-wrapper" >
                    <div class="header"> 
                        <h4 class="page-header">
                            Add New Allowance Donor
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
                                        Profile of Allowance Donor
                                    </div>

                                    <div class="card-content">

                                        <form  method="POST" action="/DifferentlyAbledTracker/addnewneedy1.htm">                                      
                                            <s:bind path="donor">
                                            <div class="row">
                                                <div class="input-field col s6" n>
                                                    <label>Type</label>
                                                    <br/>
                                                    <br/>
                                                    <select  class="form-control validate" ng-controller="addtype">
                                                       
                                                        <option ng-repeat="x in type">{{x}}</option>
                                                    </select>
                                                </div>

                                                <div class="input-field col s6" ng-controller="addtitle">
                                                    <label>Title</label>
                                                    <br/>
                                                    <br/>
                                                    <select  class="form-control validate">
                                                        <option ng-repeat="x in title">{{x}}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <label for="name">Name</label>
                                                    <input type="text"  class=" validate"/>
                                                </div>

                                            </div>
                                            <br/>


                                            <br/>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <label for="address">Address Line 1</label>
                                                    <input type="text"  class=" validate"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <label for="address">Address Line 2</label>
                                                    <input type="text"  class=" validate" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <label for="address">City</label>
                                                    <input type="text" path="city" class=" validate"/>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <label>Country</label>
                                                    <br/>
                                                    <br/>
                                                    <select path="country" class="form-control validate">
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            <br/>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <label for="mobile">Mobile Number</label>
                                                    <input type="text" path="mobile" class=" validate"/>
                                                </div>

                                                <div class="input-field col s6">
                                                    <label for="fax">Fax</label>
                                                    <input type="text" path="fax" class=" validate"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <label for="email">Email</label>
                                                    <input type="text" path="email" class=" validate"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <input type="submit" value="Register Donor" class="waves-effect waves-light btn"/>

                                                </div>
                                            </div>
                                            </s:bind>
                                        </form>
                                    </div>
                                </div>


                                <br/>
                                <br/>









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
            <script src="${jqueryJS}" type="text/javascript"></script>

            <!-- Bootstrap Js -->
            <script src="${bootstrapminJS}" type="text/javascript"></script>

            <script src="${materializeminJS}" type="text/javascript"></script>

            <!-- Metis Menu Js -->
            <script src="${metismenuJS}" type="text/javascript"></script>
            <!-- Morris Chart Js -->
            <script src="${raphaelminJS}" type="text/javascript"></script>
            <script src="${morrisJS}" type="text/javascript"></script>


            <script src="${easypiechartJS}" type="text/javascript"></script>
            <script src="${easypiechartdataJS}" type="text/javascript"></script>

            <script src="${jquerychartJS}"></script>

            <!-- Custom Js -->
            <script src="${customJS}" type="text/javascript"></script> 

        </body>
</html>


