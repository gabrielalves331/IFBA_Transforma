<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Cadastro Professor</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f5f7fa;
}

.card-cadastro{
    max-width:900px;
    margin:50px auto;
    background:white;
    padding:40px;
    border-radius:20px;
    box-shadow:0 0 20px rgba(0,0,0,.08);
}
</style>

</head>

<body>

<div class="card-cadastro">

<h2 class="text-success mb-4">Cadastro de Professor</h2>

<form action="UsuarioServlet" method="POST">

<input type="hidden" name="tipo" value="Professor Orientador">

<div class="row">

<div class="col-md-6 mb-3">
<label>CPF</label>
<input type="text" name="id" class="form-control" required>
</div>

<div class="col-md-6 mb-3">
<label>Nome Completo</label>
<input type="text" name="nome" class="form-control" required>
</div>

<div class="col-md-6 mb-3">
<label>E-mail</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="col-md-6 mb-3">
<label>Senha</label>
<input type="password" name="senha" class="form-control" required>
</div>

<div class="col-md-6 mb-3">
<label>Área de Atuação</label>
<input type="text" name="area_atuacao" class="form-control">
</div>

<div class="col-md-6 mb-3">
<label>Disciplinas</label>
<input type="text" name="disciplinas" class="form-control">
</div>

</div>

<button class="btn btn-success">
Cadastrar Professor
</button>

</form>

</div>

</body>
</html>