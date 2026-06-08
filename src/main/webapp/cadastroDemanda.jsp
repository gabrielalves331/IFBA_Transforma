<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Nova Demanda</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card shadow">

<div class="card-header bg-success text-white">

<h3>Cadastro de Demanda</h3>

</div>

<div class="card-body">

<form>

<div class="mb-3">
<label>Título</label>
<input type="text" class="form-control">
</div>

<div class="mb-3">
<label>Área</label>
<select class="form-select">
<option>Tecnologia</option>
<option>Turismo</option>
<option>Educação</option>
<option>Gestão</option>
<option>Sustentabilidade</option>
</select>
</div>

<div class="mb-3">
<label>Descrição</label>
<textarea class="form-control" rows="4"></textarea>
</div>

<div class="mb-3">
<label>Contexto</label>
<textarea class="form-control" rows="3"></textarea>
</div>

<div class="mb-3">
<label>Impacto Esperado</label>
<textarea class="form-control" rows="3"></textarea>
</div>

<div class="mb-3">
<label>Prazo</label>
<input type="date" class="form-control">
</div>

<div class="mb-3">
<label>Localidade</label>
<input type="text" class="form-control">
</div>

<button class="btn btn-success">
Enviar Demanda
</button>

</form>

</div>

</div>

</div>

</body>
</html>