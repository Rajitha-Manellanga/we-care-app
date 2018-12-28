<%-- 
    Document   : home
    Created on : Aug 17, 2018, 7:45:15 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url value="https://fonts.googleapis.com/icon?family=Material+Icons" var="googleapis"/>
        <s:url value="/assets/theme1/css/bootstrap.css" var="bootstrapCSS"/>
        <s:url value="/assets/theme1/materialize/css/materialize.css" var="materializeCSS"/>
        <s:url value="/assets/theme1/css/font-awesome.css" var="fontawesomeCSS"/>
        <s:url value="/assets/theme1/js/morris/morris-0.4.3.min.css" var="morisCSS"/>
        <s:url value="/assets/theme1/js/morris/raphael-2.1.0.min.js" var="raphaelCSS"/>
        <s:url value="/assets/theme1/css/custom-styles.css" var="customestyleCSS"/>
        <s:url value="http://fonts.googleapis.com/css?family=Open+Sans" var="googleFonts"/>
        <s:url value="/assets/theme1/js/Lightweight-Chart/cssCharts.css" var="chartsCSS"/>
        <s:url value="/assets/theme1/js/jquery-1.10.2.js" var="jqueryJS"/>
        <s:url value="/assets/theme1/js/bootstrap.min.js" var="bootstrapminJS"/>
        <s:url value="/assets/theme1/materialize/js/materialize.min.js" var="materializeminJS"/>
        <s:url value="/assets/theme1/js/jquery.metisMenu.js" var="metismenuJS"/>
        <s:url value="/assets/theme1/js/morris/raphael-2.1.0.min.js" var="raphaelminJS"/>
        <s:url value="/assets/theme1/js/morris/morris.js" var="morrisJS"/>
        <s:url value="/assets/theme1/js/easypiechart.js" var="easypiechartJS"/>
        <s:url value="/assets/theme1/js/easypiechart-data.js" var="easypiechartdataJS"/>
        <s:url value="/assets/theme1/js/Lightweight-Chart/jquery.chart.js" var="jquerychartJS"/>
        <s:url value="/assets/theme1/js/custom-scripts.js" var="customJS"/>
        <title>Home</title>

        <link href="${googleapis}" rel="stylesheet">
        <link rel="stylesheet" href="${materializeCSS}" media="screen,projection" />
        <!-- Bootstrap Styles-->
        <link href="${bootstrapCSS}" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="${fontawesomeCSS}" rel="stylesheet" />
        <!-- Morris Chart Styles-->
        <link href="${morisCSS}" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="${customestyleCSS}" rel="stylesheet" />
        <!-- Google Fonts-->
        <link href="${googleFonts}" rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="${chartsCSS}"/> 
    </head>
    <body>
        <div id="wrapper">
            
            <%@include file="menu_needy.jsp" %>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                <div class="header"> 
                    <h4 class="page-header">
                        Profile Of <small>Create new page.</small>
                    </h4>
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Empty</a></li>
                        <li class="active">Data</li>
                    </ol> 

                </div>
                <div id="page-inner"> 

                    <div class="row">

                        <div class="col-md-4 col-sm-4">
                            <div class="card">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="http://materializecss.com/images/office.jpg">
                                </div>
                                <div class="card-content">
                                    
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
                                    <p>Here is some more information about this product that is only revealed once clicked on.</p>
                                </div>
                            </div>
                        </div>


                    </div>
                    

                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-3"> 
                            <div class="card-panel text-center">
                                <h4>Profile Completeness</h4>
                                <div class="easypiechart" id="easypiechart-blue" data-percent="82" ><span class="percent">82%</span>
                                </div> 
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12">
                            <div class="card">
                                <div class="card-action">
                                    <b>Recent Updates</b>
                                </div>
                                <div class="card-image">
                                    <ul class="collection">
                                        <li class="collection-item avatar">
                                            <i class="material-icons circle green">insert_chart</i>
                                            <span class="title">Title</span>
                                            <p>First Line <br>
                                                Second Line
                                            </p>
                                            <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
                                        </li>
                                        <li class="collection-item avatar">
                                            <i class="material-icons circle">folder</i>
                                            <span class="title">Title</span>
                                            <p>First Line <br>
                                                Second Line
                                            </p>
                                            <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
                                        </li>
                                        <li class="collection-item avatar">
                                            <i class="material-icons circle green">insert_chart</i>
                                            <span class="title">Title</span>
                                            <p>First Line <br>
                                                Second Line
                                            </p>
                                            <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
                                        </li>
                                        <li class="collection-item avatar">
                                            <i class="material-icons circle red">play_arrow</i>
                                            <span class="title">Title</span>
                                            <p>First Line <br>
                                                Second Line
                                            </p>
                                            <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
                                        </li>
                                    </ul>
                                </div>  
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
        <script src="${raphaelCSS}" type="text/javascript"></script>
        <script src="${jquerychartJS}"></script>

        <!-- Custom Js -->
        <script src="${customJS}" type="text/javascript"></script> 

    </body>
</html>
