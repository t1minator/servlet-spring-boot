<%@ page import="java.util.Calendar" %>
<%@ page import="com.hellokoding.springboot.User" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("ProductName") %>
    </title>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="static/metro-bootstrap/css/metro-bootstrap.min.css" rel="stylesheet" type="text/css"/>    
</head>
<body>
<%@include file="_header.jsp" %>
<section class="main container-fluid">
    <%
        Calendar calendar = Calendar.getInstance();
    %>
    <div class="container">
        <h1>Home</h1>
        <div class="row-fluid">
            <div class="col-md-3">
                <%= calendar.getTime().toString() %>
            </div>
            <div class="col-md-9">
                <% User user = (User)request.getAttribute("user");
                    if(user == null){
                        user = new User();
                    }
                %>
                <tabset>
                    <tab heading="Search">
                        <div>
                            <h2>Welcome <%= user.getName() %></h2>
                            <form action="home" method="post">
                                <p>
                                    Name: <input type="text" name="name"/>
                                </p>

                                <p>
                                    <input type="submit" value="Enter name">
                                </p>
                            </form>
                        </div>
                    </tab>
                    <tab heading="Next">
                        Yet More Static content
                    </tab>
                </tabset>
            </div>
        </div>
    </div>
</section>
<script src="static/jquery/jquery-3.1.0.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>