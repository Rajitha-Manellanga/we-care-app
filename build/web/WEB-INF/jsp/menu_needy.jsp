<%-- 
    Document   : sidemenu
    Created on : Aug 25, 2018, 6:13:02 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@include file="resourcefile.jsp" %>
    <body>
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
                                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                <span class="pull-right text-muted small">12 min</span>
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
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> Server Rebooted
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
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 2</strong>
                                    <span class="pull-right text-muted">28% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" style="width: 28%">
                                        <span class="sr-only">28% Complete</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>

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
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href="needyhome.htm" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i> Home</a>
                    </li>



                    <li>
                        <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i>My Profile<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            
                            <li>


                                <a href="">Profile<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="">Basic Profile</a>
                                    </li>
                                    <li>
                                        <a href="#">Contact Details</a>
                                    </li>
                                    <li>
                                        <a href="#">Guardians</a>
                                    </li>
                                    <li>
                                        <a href="#">Skills and Abilities</a>
                                    </li>
                                    <li>
                                        <a href="#">Participated Events</a>
                                    </li>
                                    <li>
                                        <a href="#">Allowances</a>
                                    </li>

                                </ul>

                            </li>
                            <li>
                                <a href="#">Need Help <span class="fa arrow"></span></a>
                            </li>
                        </ul>
                    </li>

                </ul>

            </div>

        </nav>
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
