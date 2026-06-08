<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f5f7fa;
}

.login-card{
    max-width:450px;
    margin:auto;
    margin-top:100px;
    padding:40px;
    background:white;
    border-radius:15px;
    box-shadow:0 0 25px rgba(0,0,0,.1);
}

</style>

</head>

<body>

<div class="login-card">

    <h2 class="text-center mb-4">
        Entrar
    </h2>

    <form action="LoginServlet" method="POST">

        <div class="mb-3">

            <label>E-mail</label>

            <input
                type="email"
                name="email"
                class="form-control"
                required
            >

        </div>

        <div class="mb-3">

            <label>Senha</label>

            <input
                type="password"
                name="senha"
                class="form-control"
                required
            >

        </div>

        <button class="btn btn-success w-100">
            Entrar
        </button>

    </form>

</div>

</body>
</html>