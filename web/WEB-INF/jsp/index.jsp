<%-- 
    Document   : index
    Created on : Aug 24, 2018, 9:00:14 PM
    Author     : Rajitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html>
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
        <s:url value="/assets/theme1/js/angular.min.js" var="angularJS"/>
        <s:url value="/assets/theme1/css/datepicker.css" var="dateCtrlCSS"/>
        <s:url value="/assets/theme1/js/angular.min.js.map" var="angularminJS"/>


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
        <link rel="stylesheet" href="${dateCtrlCSS}"/>
        <script src="${angularJS}" type="text/javascript"></script> 
        <script src="${angularminJS}" type="text/javascript"></script> 

        <style>
            .custom{
                width: 300px;
                height: 260px;
            }
        </style>
        <title>Welcome</title>
    </head>
    <body style="background-color: #ffffff">




        <div class="row">

            <div class="col-md-6"></div>
            <div class="col-md-2"></div>
            <div class="col-md-4">
                <a href="signup.htm" class="btn btn-primary" style="margin-top: 20px;margin-left: 55%">Signup</a>
                <a href="login.htm" class="btn btn-primary" style="margin-top: 20px;">Login</a>
            </div>
        </div>




        <div class="row">
            <div class="col-md-3"><img class="img-responsive" src="assets/theme1/homeimg/bck.png" /></div>

            <div class="col-md-4">
                <img class="img-responsive" src="assets/theme1/homeimg/abc.jpg" style="margin-top: 10%"/>
            </div>
             <div class="col-md-4">
                <img class="img-responsive" src="assets/theme1/homeimg/home_img2.jpg" style="margin-top: 10%;margin-right: 40px;"/>
            </div>
            

        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-8">
                <br/>
                <br/>
                <p style="text-align: center;size: 20pt;font-weight: bold;font-size: 4em;color: #00796b;margin-top: 15px;font-family: monospace">WELCOME TO V-CARE</p>
            </div>
             <div class="col-md-1"></div>
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
