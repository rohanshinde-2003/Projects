<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Pump</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(to right, #00c6ff, #0072ff);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding: 2rem;
    }

    .card {
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    }

    .card-body {
        padding: 2rem;
        background-color: #fffbe6;
    }

    h2 {
        font-weight: 600;
        margin-bottom: 1.5rem;
        color: #333;
    }

    .btn-primary {
        width: 100%;
    }

    .form-label {
        font-weight: 500;
    }

    .text-danger, .text-success {
        margin-bottom: 1rem;
        font-weight: bold;
    }
</style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card bg-warning">
                <div class="card-body">
                    <h2 class="text-center">Register Pump</h2>

                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg"/>
                    </c:if>

                    <c:if test="${not empty errorMsg}">
                        <p class="text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg"/>
                    </c:if>

                    <form action="registerPump" method="post">
                        <div class="mb-3">
                            <label class="form-label">Enter Pump Name</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label> 
                            <input type="email" class="form-control" name="email" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mobile Number</label>
                            <input type="text" class="form-control" name="mobile_number" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Enter City</label>
                            <input type="text" class="form-control" name="City" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Enter Taluka</label>
                            <input type="text" class="form-control" name="Taluka" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Enter District</label>
                            <input type="text" class="form-control" name="District" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Opening Time</label>
                            <input type="time" class="form-control" name="OTime" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Closing Time</label>
                            <input type="time" class="form-control" name="CTime" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Daily Gas Limit (Kgs)</label>
                            <input type="number" class="form-control" name="CNG" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Register Pump</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
