<%-- 
    Document   : sidemenu
    Created on : Aug 25, 2018, 6:13:02 PM
    Author     : Rajitha
--%>

<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>


<%

    User user = (User) request.getSession().getAttribute("LOGGEDIN_USER");

%>

<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand waves-effect waves-dark" href="index.html"><i class="large material-icons">insert_chart</i> <strong>WE-CARE</strong></a>

        <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
    </div>

    <ul class="nav navbar-top-links navbar-right"> 


        <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b><%=user.getFirstName() + " " + user.getLastName()%></b> <i class="material-icons right">arrow_drop_down</i></a></li>
    </ul>
</nav>
<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
    
    <li><a href="logout.htm"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
    </li>
</ul>



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


                                <a href="viewneedy.htm">Search Profile<span class="fa arrow"></span></a>


                            </li>


                        </ul>

                    </li>
                </ul>
            </li>

        </ul>

    </div>

</nav>

