<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*, com.easset.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0
/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.j
s"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/pop
per.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.mi
n.js"></script>
 <script src="jquery-3.2.1.min.js"></script>
 <script src="bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/j
query.dataTables/1.9.4/css/jquery.dataTables.css">
 <script type="text/javascript" charset="utf8" src="https://ajax.aspnetcdn.c
om/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
 <link rel="stylesheet" type="text/css" href="bootstrap.css"/>
 </head>
<body style="background-color: #91b1ec">
 <nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-Asset</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link "  href="userhome">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link justify-content-end" href="logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>


<div class="card mx-auto" style="width: 70rem;  margin-top: 2	%">
      <div class="card-body row g-2">
      </div>
       <div class="container">
<div class="col-lg-12">
<br><br>
<h1 class="text-warning text-center" > Your Borrowed Asset </h1>
<br>
<table id="tabledata" class=" table table-striped table-hover tablebordered">
<tr class="bg-dark text-white text-center">
<th> Id </th>
<th> Name </th>
<th> Category</th>
<th> Description </th>
<th> Borrow </th>
</tr >

<% 

try{
	ArrayList<Asset> s = (ArrayList<Asset>)request.getAttribute("assets");
	if(s.size()>0){
	for(Asset a : s){%>
	<tr class="text-center">
            <td><%=a.getId()%></td>
            <td><%=a.getName()%></td>
            <td><%=a.getType().getType() %></td>
            <td><%=a.getDescription() %></td>
            <td> <button class="btndanger btn"> <a href="userborroweedasset?id=<%=a.getId()%>" class="textwhite"> Return Asset </a> </button> </td>
        </tr>
        <%}}
}catch(Exception E){
	
}%>
    
        

</table> 
</div>
</div>
      </div>


 

</body></html>

