<%-- 
    Document   : new_needy2
    Created on : Jul 22, 2018, 7:29:01 PM
    Author     : Rajitha
--%>


<%@page import="com.daoimp.RoleName"%>
<%@page import="com.pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
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
<script src="${angularJS}" type="text/javascript"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script type="text/javascript">
        function goBack() {
           window.history.back();
        }
    </script>


    <title>Home</title>
</head>
<body>
    <div id="wrapper">

        <div id="page-wrapper" >
            <div class="header"> 
                <h4 class="page-header">
                    Add New Differently Abled Person
                </h4>
                <ol class="breadcrumb">
                    <li><a onclick="goBack()">Basic Profile</a></li>

                </ol> 

            </div>

            <div id="page-inner"> 
                <div class="row">
                    <div class="col-lg-12">
                        <s:url var="addURL" value="registerneedy2.htm"></s:url>
                        <form  method="POST" action="${addURL}">
                            <div class="card">
                                <div class="card-action">
                                    Contact Details
                                </div>
                                <p>${errormsg}</p>
                                <div class="card-content">  
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="addressLine1">Line 1</label>
                                            <input type="text"  class=" validate" name="ad1"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="addressLine2">Line 2</label>
                                            <input type="text"  class=" validate" name="ad2"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="city">City</label>
                                            <input type="text"  class=" validate" name="city"/>
                                        </div>
                                        <div class="input-field col s6">
                                            <label for="city">Postal Code</label>
                                            <input type="text"  class=" validate" name="postal"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="mobile">Mobile Number</label>
                                            <input type="text"  class=" validate" name="mobile"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <label for="Date Of Birth">Email</label>
                                            <input type="email" class=" validate" name="email"/>
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="input-field col s4">
                                            <input type="button" value="Back" class="waves-effect waves-light btn" onclick="goBack()"/>
                                            <a href="newneedy3.htm"> <input type="button" value="Next" class="waves-effect waves-light btn" /></a>

                                            <input type="submit" value="Finish" class="waves-effect waves-light btn"/>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>

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

