<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0
/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.j
s"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/pop
per.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.mi
n.js"></script>
<script src="jquery-3.2.1.min.js"></script>
<script src="bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/j
query.dataTables/1.9.4/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://ajax.aspnetcdn.c
<!-- om/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

<link rel="stylesheet" type="text/css" href="bootstrap.css" />
</head>
<body style="background-color: #91b1ec;">
	<%@page import="java.util.*, com.easset.model.*"%>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">E-Asset</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link " href="adminhome">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link justify-content-end"
						href="logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="card mx-auto" style="width: 10rem; margin-top: 2%">
		<div class="card-body row g-2">
			<p class="card-text mx-auto">Add a New Asset</p>
			<button type="button" class="btn btn-primary btn-sm mx-auto"
				data-toggle="modal" data-target="#form_modal">
				<span class="glyphicon glyphiconplus"></span> Add Asset
			</button>
		</div>
	</div>

	<div class="card mx-auto" style="width: 70rem; margin-top: 2%">
		<div class="card-body row g-2">
			<h4 class="mx-auto">All Assets :</h4>
			<br><br><br>
			<table id="tabledata"
				class="border table table-striped table-hover tablebordered">
				<tr class="bg-dark text-white text-center">
					<th>Id</th>
					<th>Name</th>
					<th>Type</th>
					<th>Description</th>
					<th>Status</th>
<!-- 					<th>Delete</th> -->
				</tr>
				<% 
				try{ 
				ArrayList<Asset> s = (ArrayList<Asset>)request.getAttribute("assets");
				if(s.size()>0){ for(Asset a : s){%>
				<tr class="text-center">
					<td><%=a.getId()%></td>
					<td><%=a.getName()%></td>
					<td><%=a.getType().getType() %></td>
					<td><%=a.getDescription() %></td>
					<td><%=a.isAvailable()%></td>
					
				</tr>
				<%
				}}}catch(

					Exception E){
					
				}finally{
					
				}
				%> 
				<%-- <c:forEach items="${assets}" var="asset">
					<c:set var="cid" value="${asset.id}" />
					<tr>
						<td>${asset.id}</td>
						<td>${asset.name}</td>
					</tr>
				</c:forEach> --%>
			</table>
		</div>
	</div>




	<div class="modal fade" id="form_modal" aria-hidden="true">
		<div class="modal-dialog">
			<form action="addasset" method="POST" enctype="multipart/form
-data">
				<div class="modal-content">
					<div class="modal-body">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Asset name</label> <input type="Text" name="assetname"
									class="form-control" required />
							</div>
							<div class="form-group">
								<label>Asset Category</label> <select name="cat" id="cat"
									class="form-control">
									<% 
									ArrayList<AssetType> assettype = (ArrayList<AssetType>)request.getAttribute("assettype");
									for(AssetType a : assettype){%>
									<option value="<%=a.getId() %>"><%=a.getType()%></option>
									<%}%>
									<!-- <option value="other">Other</option> -->
								</select>
							</div>
							<div class="form-group">
								<label>Asset Description</label> <input type="text" name="desp"
									class="form
-control" required />
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<span class="glyphicon glyphiconremove"></span> Close
						</button>
						<button name="add" class="btn btnprimary">
							<span class="glyphicon glyphicon-save"></span> Add
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>