<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
  </head>
  <body style="background-color: #91b1ec;">
  <nav class="navbar navbar-expand-lg navbar-dark">
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
    <form action="login" method="post" >

        <section class="vh-100" >
            <div class="container py-5 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                  <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">          
                      <h3 class="mb-5">Sign in</h3>          
                      <div class="form-outline mb-4">
                        <input required type="text" id="uname" name="uname" class="form-control form-control-lg" />
                        <label class="form-label" for="typeEmailX-2">Username</label>
                      </div>          
                      <div class="form-outline mb-4">
                        <input required type="password" id="password" name="password" class="form-control form-control-lg" />
                        <label class="form-label" for="typePasswordX-2">Password</label>
                      </div>
                      <div class="form-check d-flex justify-content-start mb-4">
                        <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
                        <label class="form-check-label" for="form1Example3"> Remember password </label>
                      </div>          
                      <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>                                                
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
    </form>
  </body>
</html>
