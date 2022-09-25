<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</head>

<body style="background-color: #91b1ec;">
<nav class="navbar navbar-expand-lg navbar-dark ">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-Asset</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link "  href="http://localhost:8080/EAssetManagement/">Home</a>
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
    <section class="h-100 h-custom" >
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
              <div class="card rounded-3">
                <img src="asset1.jpg"
                  class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                  alt="Sample photo">
                <div class="card-body p-4 p-md-5">
                  <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Registration Info</h3>      
                  <form action="register" method="post"  class="px-md-2" oninput='cnfpassword.setCustomValidity(password.value != cnfpassword.value ? "Passwords do not match." : "")'>      
                    <div class="form-outline mb-4">
                        <label class="form-label" for="form3Example1q">Name</label>
                      <input required id="uname" name="uname" type="text" id="form3Example1q" class="form-control" />                      
                    </div>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="form3Example1q">Telephone</label>
                      <input required type="text" id="telephone" name="telephone" class="form-control" />                      
                    </div>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="form3Example1q">Email</label>
                      <input required type="email" id="email" name="email" class="form-control" />                      
                    </div>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="form3Example1q">Username</label>
                      <input required type="text" id="username" name="username" class="form-control" />                      
                    </div>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="form3Example1q">Password</label>
                      <input required type="password" id="password" name="password" class="form-control" />                      
                    </div>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="form3Example1q">Confirm Password</label>
                      <input required type="password" id="cnfpassword" name="cnfpassword" class="form-control" />                      
                    </div>            
                    <button type="submit" class="btn btn-success btn-lg mb-1">Submit</button>
      
                  </form>
      
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
</body>
</html>