<%-- 
    Document   : Administration_Access_Control
    Created on : 03-Apr-2016, 04:47:53
    Author     : Engr.Uzma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!Connection con;
java.sql.Statement statement;
ResultSet rs;String uc;%>

<%!
public Connection connection() throws Exception
{
 
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriverS");
            con=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=jspweb","sa","hidayatkhan00");
return con;
}%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Dashboard with Off-canvas Sidebar</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
                <script src="js/bootstrap.min.js"></script>
		
	</head>
	<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Metropolitan Complain Center</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">LOG-OUT</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Enter Tracking Code">
          </form>
        </div>
      </div>
</nav>

<div class="container-fluid">
      
      <div class="row row-offcanvas row-offcanvas-left">
        
         <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">
           
            <ul class="nav nav-sidebar">
             
            </ul>
            <ul class="nav nav-sidebar">
             
            </ul>
            <ul class="nav nav-sidebar">
            
            </ul>
          
        </div><!--/span-->
        
        <div class="col-sm-9 col-md-10 main">
          
          <!--toggle sidebar button-->
          <p class="visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"><i class="glyphicon glyphicon-chevron-left"></i></button>
          </p>
          <br>
		  <h1 class="page-header">
            Metropolitan Complain Center
          </h1>

          <div class="row placeholders" style="margin-left: 300px">
           
            
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\-text.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
              <div style="margin-top: -129px;">
                 <a href="Administration_Access_Control"><h4>Complain History<br />Member</h4></a>
              </div>
            
            </div>
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\green.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
             <div style="margin-top: -129px;">
                 <a href="RegisteredMember.jsp"><h4>Registered <br />Member</h4></a>
              </div>
            
            </div>
          </div>
          <br />
          <br />
          <br />
          <br />
          <hr>

          
          <div class="table-responsive" style="margin-top: 50px;">
                <center><h2 class="sub-header">Complain History</h2></center>
            <table class="table table-striped table table-hover">
              
                <tr>
			<th>
				Name
			</th>
			
			<th>
				CNIC N.O
			</th>
			
			<th>
				E-MAIL
			</th>
                        <th>
                                TrackingCode
			</th>
                        <th>
                                Status
			</th>
			
			<th>
				UC N.O
			</th>
			
			<th>
				DISTRIC
			</th>
			
			<th>
				ADDRESS
			</th>
			
			<th>
				COMPLAIN
			</th>
			
		</tr>
             
               <% try {  %>
                        
                        <% con=connection();
            statement=con.createStatement();
            String insert="SELECT administrator.nic,"
                    + " administrator.complain, "
                    + "administrator.TrackingCode, "
                    + "administrator.Status,"
                    + " registratin.name,"
                    + " registratin.address,"
                    + " registratin.email, "
                    + "distric.distrcName,"
                    + " uc.ucNumber from administrator "
                    + "INNER JOIN registratin ON administrator.nic = registratin.nic "
                    + "RIGHT JOIN distric ON registratin.nic = distric.nic "
                    + "RIGHT JOIN uc ON distric.UC = uc.ucNum";

            rs=statement.executeQuery(insert);%>
             
             <%while(rs.next()){%>
                     <%
                            if(rs.getString("name")==null)
                            {
                                continue;
                            };
                            %>
              
                      <tr> 
			<td>
                           
                            <%out.print(rs.getString("name"));%>
			</td>
			
			<td>
                             <%out.print(rs.getString("nic"));%>
			</td>
			
			<td>
                             <%out.print(rs.getString("email"));%>
			</td>
                        <td>
                             <%out.print(rs.getString("TrackingCode"));%>
			</td>
                         <td>
                             <%out.print(rs.getString("Status"));%>
			</td>
			
			<td>
                            <a href="Union_Council.jsp?uc=<%out.print(rs.getString("ucNumber"));%>" class="btn btn-success">
                                <%uc=rs.getString("ucNumber");
                                session.setAttribute("Ucnumber", uc);out.print(uc.substring(0, 4));%><a/>
			</td>
			
			<td>
                             <%out.print(rs.getString("distrcName"));%>
			</td>
			
			<td>
                             <%out.print(rs.getString("address"));%>
			</td>
			
			<td>
                            <a  href="view_Complain_And_images.jsp?complain=<%out.print(rs.getString("complain"));%> &code=<%out.print(rs.getString("TrackingCode"));%>" class="btn btn-warning">Click To View<a/>
			</td>
                       
                        </tr>
                       
                        <%}%>
                         <%  } catch(Exception e){
                             out.print(e);
                         }  %>
                 
                
             
            </table>
          </div>

          
      </div><!--/row-->
	</div>
</div><!--/.container-->

<footer>
  <p class="pull-right">©2016 Metropolitan Complain Center</p>
</footer>
        
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
	</body>
</html>

