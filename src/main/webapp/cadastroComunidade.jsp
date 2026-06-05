<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Cadastro Comunidade</title>

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

<h2 class="text-success mb-4">
Cadastro Comunidade Externa
</h2>

<form action="UsuarioServlet" method="POST">

<input type="hidden"
       name="tipo"
       value="Comunidade Externa">

<div class="row">

<div class="col-md-6 mb-3">
<label>CPF/CNPJ</label>
<input type="text" name="id" class="form-control">
</div>

<div class="col-md-6 mb-3">
<label>Nome</label>
<input type="text" name="nome" class="form-control">
</div>

<div class="col-md-6 mb-3">
<label>Organização</label>
<input type="text" name="organizacao" class="form-control">
</div>

<div class="col-md-6 mb-3">
<label>Contato</label>
<input type="text" name="contato" class="form-control">
</div>

<div class="col-md-6 mb-3">
<label>Localidade</label>
<input type="text" name="localidade" class="form-control">
</div>

<div class="col-md-6 mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control">
</div>

<div class="col-md-12 mb-3">
<label>Senha</label>
<input type="password" name="senha" class="form-control">
</div>

</div>

<button class="btn btn-success">
Cadastrar Organização
</button>

</form>

</div>

</body>
</html>