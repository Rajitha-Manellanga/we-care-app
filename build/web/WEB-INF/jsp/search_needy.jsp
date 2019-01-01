<%-- 
    Document   : home
    Created on : Aug 17, 2018, 7:45:15 PM
    Author     : Rajitha
--%>

<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%
     User user=(User)request.getSession().getAttribute("LOGGEDIN_USER");
     if(user.getRole().getName().equals("ADMIN")){%>
     <jsp:include page="menu_admin.jsp"></jsp:include>
     <%}else{%>
     <jsp:include page="menu_user.jsp"></jsp:include>
    <%}
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Search</title>

        
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default top-navbar" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand waves-effect waves-dark" href="index.html"><i class="large material-icons">insert_chart</i> <strong>TRACK</strong></a>

                    <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
                </div>

                <ul class="nav navbar-top-links navbar-right"> 
                    <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>				
                    <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
                    <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
                    <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>John Doe</b> <i class="material-icons right">arrow_drop_down</i></a></li>
                </ul>
            </nav>
            <!-- Dropdown Structure -->
            <ul id="dropdown1" class="dropdown-content">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li> 
                <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <ul id="dropdown2" class="dropdown-content w250">
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-comment fa-fw"></i> New Comment
                            <span class="pull-right text-muted small">4 min</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>

                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-envelope fa-fw"></i> Message Sent
                            <span class="pull-right text-muted small">4 min</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-tasks fa-fw"></i> New Task
                            <span class="pull-right text-muted small">4 min</span>
                        </div>
                    </a>
                </li>

                <li class="divider"></li>
                <li>
                    <a class="text-center" href="#">
                        <strong>See All Alerts</strong>
                        <i class="fa fa-angle-right"></i>
                    </a>
                </li>
            </ul>
            <ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
                <li>
                    <a href="#">
                        <div>
                            <p>
                                <strong>Task 1</strong>
                                <span class="pull-right text-muted">60% Complete</span>
                            </p>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                    <span class="sr-only">60% Complete (success)</span>
                                </div>
                            </div>
                        </div>
                    </a>




                <li>
            </ul>   
            <ul id="dropdown4" class="dropdown-content dropdown-tasks w250">
                <li>
                    <a href="#">
                        <div>
                            <strong>John Doe</strong>
                            <span class="pull-right text-muted">
                                <em>Today</em>
                            </span>
                        </div>
                        <div>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">
                        <div>
                            <strong>John Smith</strong>
                            <span class="pull-right text-muted">
                                <em>Yesterday</em>
                            </span>
                        </div>
                        <div>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">
                        <div>
                            <strong>John Smith</strong>
                            <span class="pull-right text-muted">
                                <em>Yesterday</em>
                            </span>
                        </div>
                        <div>Lorem Ipsum has been the industry's standard dummy text ever since the...</div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a class="text-center" href="#">
                        <strong>Read All Messages</strong>
                        <i class="fa fa-angle-right"></i>
                    </a>
                </li>
            </ul>  
            <!--/. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">

                        <li>
                            <a href="home.htm" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i> Home</a>
                        </li>



                        <li>
                            <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i>Differently Abled Person<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="newneedy1.htm">Add New <span class="fa arrow"></span></a>
                                </li>
                                <li>


                                    <a href="">Search<span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="searchneedy.htm">View Profile</a>
                                        </li>
                                        <li>
                                            <a href="#">View List</a>
                                        </li>


                                    </ul>

                                </li>
                            </ul>
                        </li>

                    </ul>

                </div>

            </nav>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                <div class="header"> 
                    <h4 class="page-header">
                        Search Differently Abled Persons
                    </h4>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Empty</a></li>
                        <li class="active">Data</li>
                    </ol> 

                </div>
                <div id="page-inner"> 

                    <div class="row">

                        <div class="col-md-12">
                            <div class="card">
                                      
                                <div class="card-content"> 
                                    <h5><b>Find the persons you want</b></h5>

                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="keyword">Search Keyword</label>
                                            <br/>
                                            <br/>
                                            <input type="search" id="srchneddy" name="serchbox"/>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="cat">Using Fields</label>
                                            <br/>
                                            <br/>
                                            <select class="form-control validate">
                                                <option>A</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <button class="btn">Search</button>
                                        </div>
                                    </div>
                                    <h5><b>Your search results will appear here</b></h5>

                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Code</th>
                                                        <th>Full Name</th>
                                                        <th>NIC</th>
                                                        <th>Gender</th>
                                                        <th>Age</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>   

                                    </div>
                                </div>




                                
                            </div>
                            <!-- /. PAGE INNER  -->
                        </div>
                        <!-- /. PAGE WRAPPER  -->
                    </div>
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
