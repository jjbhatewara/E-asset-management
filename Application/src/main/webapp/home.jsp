<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</head>
<body  style="background-color: #91b1ec;" >
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-Asset</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link "  href="">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="register">Registration</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="fileupload">Import Users</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="card" style="width: 50rem; margin-left: 23%; margin-top: 2	%">
      <div class="card-body row g-2">
        <h5 class="card-title">Welcome to E asset Management </h5>
        <h6 class="card-subtitle mb-4 text-muted"> Developed by CodePredators to manage the lifecycle of different types of assets </h6>
        <div class="card center mx-auto" style="width: 18rem;">
        <h6 class="subHeader"> Popular Assets:</h6>
  		<ul class="list-group list-group-flush">
  		
  		<c:forEach items="${popAssets}" var="item">
  		<li class="list-group-item">${item}</li>
		</c:forEach>    
			
  		</ul>
		</div>
        
      </div>
    </div>
            
</body>
</html>