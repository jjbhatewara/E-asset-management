<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <!-- JavaScript Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
      crossorigin="anonymous"
    ></script>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
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
          <a class="nav-link "  href="adminhome">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link justify-content-end" href="logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
    <div class="card" style="width: 30rem; margin-left: 32%; margin-top: 2	%">
      <div class="card-body row g-2">
        <h5 class="card-title">User Details</h5>
        <h6 class="card-subtitle mb-4 text-muted">Administrator</h6>
        <div class="col-md-2">
          <label for="inputEmail4" class="form-label">ID</label>
          <input disabled type="text" class="form-control" id="id" value="${userid}" />
        </div>
        <div class="col-md-10">
          <label for="inputPassword4" class="form-label"> Name </label>
          <input disabled type="text" class="form-control" id="name" value="${uname}" />
        </div>
        <div class="col-6">
          <label for="inputAddress" class="form-label">Telephone</label>
          <input disabled type="text" class="form-control" id="telephone" value="${telephone}"/>
        </div>
        <div class="col-6">
          <label for="inputAddress2" class="form-label">Email Id</label>
          <input disabled type="email" class="form-control" id="email" value="${email}" />
        </div>
        <div class="col-md-12">
          <label for="inputCity" class="form-label">Last Login</label>
          <input disabled type="text" class="form-control" id="lastlogin" value="${lastlogin}"/>
        </div>
        <br><br><br><br>
        <div class="col-md-6">
          <a href="addasset" class="card-link">Add Asset</a>
        </div>
        <div class="col-md-6">
          <a href="#" class="card-link">Overdue Asset Management</a>
        </div>
      </div>
    </div>

  </body>
</html>