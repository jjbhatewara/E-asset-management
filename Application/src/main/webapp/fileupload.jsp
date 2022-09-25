<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Import Users</title>
</head>
<body style="background-color: #91b1ec;">
	<nav class="navbar navbar-expand-lg navbar-dark ">
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
					<li class="nav-item"><a class="nav-link "
						href="http://localhost:8080/EAssetManagement/">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="register">Registration</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="fileupload">Import
							Users</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="card mx-auto" style="width: 50rem; margin-top: 2%">
		<div class="card-body row g-2">
			<h5 class="card-title">Please Upload a XML/JSON file to add
				users !!BETA FEATURE!! </h5>
			<h6 class="card-subtitle mb-4 text-muted">Maintain the json
				structure according to database</h6>
		</div>
		<form action="fileupload" method="post" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="formFile" class=" card-text form-label">Upload File:</label> 
				<input class="form-control" type="file" id="file"  name="file">
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

</body>
</html>