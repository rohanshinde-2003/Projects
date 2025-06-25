<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>

<!-- Bootstrap 5 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(to right, #00c6ff, #0072ff);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .card {
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    }

    .card-body {
        padding: 2rem;
    }

    h2 {
        font-weight: 600;
        margin-bottom: 1.5rem;
    }

    .btn-primary {
        width: 100%;
    }

    .form-label {
        font-weight: 500;
    }

    .text-danger {
        margin-bottom: 1rem;
    }
</style>

</head>
<body>


    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card bg-light">
                    <div class="card-body">
                        <h2 class="text-center text-primary">Admin Login</h2>

                        <c:if test="${not empty error}">
                            <p class="text-center text-danger">${error}</p>
                            <c:remove var="error"/>
                        </c:if>

                        <form action="login" method="post">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email</label>
                                <input type="email" class="form-control" name="email"
                                       id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            </div>

                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password"
                                       id="exampleInputPassword1" required>
                            </div>

                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
