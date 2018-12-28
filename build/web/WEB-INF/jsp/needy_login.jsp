<%-- 
    Document   : login
    Created on : Jul 18, 2018, 5:31:55 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <s:url value="https://fonts.googleapis.com/icon?family=Material+Icons" var="googleapis"/>
        <s:url value="/assets/theme1/css/bootstrap.css" var="bootstrapCSS"/>
        <s:url value="/assets/theme1/materialize/css/materialize.css" var="materializeCSS"/>
        <s:url value="/assets/theme1/css/font-awesome.css" var="fontawesomeCSS"/>
        <s:url value="/assets/theme1/js/morris/morris-0.4.3.min.css" var="morisCSS"/>
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

            <title>Sign In</title>
    </head>
    <body style="background-color: #cccccc">
        <div id="wrapper" style="background-color: #cccccc">
            <div id="page-wrapper" style="background-color: #cccccc">
                <div id="page-inner">
                    <div class="row"> 


                        <div class="col-md-6 col-sm-6 col-xs-12">                     
                            <div class="card">
                                <div class="card-action">
                                    <h3>Sign In</h3>
                                </div>
                                <div class="card-content">
                                    <form method="POST" action="/DifferentlyAbledTracker/addnewneedy1.htm">

                                        <div class="row">
                                            <div class="input-field col s12">
                                                <label for="code">Registration Code</label>
                                                <input type="text" class=" validate" name="username"/>
                                            </div>
                                         
                                            <div class="input-field col s12">
                                                <label>Password</label>
                                                <input type="password"class="validate" name="password"/>
                                               
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input type="submit" value="Login" class="waves-effect waves-light btn" style="margin-left: 40%;margin-right: 40%"/>
                                                <br/>
                                                <br/>
                                                <a>Forget Password?</a>
                                                <br/>
                                                <a  href="registration.htm">Create a new account</a>

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
        <script src="${jqueryJS}" type="text/javascript"></script>

        <!-- Bootstrap Js -->
        <script src="${bootstrapminJS}" type="text/javascript"></script>

        <script src="${materializeminJS}" type="text/javascript"></script>
        <!-- Custom Js -->
        <script src="${customJS}" type="text/javascript"></script> 


    </body>
</html>
