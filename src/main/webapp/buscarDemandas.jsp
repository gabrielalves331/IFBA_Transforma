<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Buscar Demandas</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<h2 class="mb-4 text-success">
Buscar Demandas
</h2>

<div class="card p-4 mb-4">

<div class="row">

<div class="col-md-4">

<label>Área</label>

<select class="form-select">
<option>Todas</option>
<option>Tecnologia</option>
<option>Educação</option>
<option>Turismo</option>
<option>Gestão</option>
</select>

</div>

<div class="col-md-4">

<label>Status</label>

<select class="form-select">
<option>Todos</option>
<option>Submetida</option>
<option>Em análise</option>
<option>Assumida</option>
<option>Concluída</option>
</select>

</div>

<div class="col-md-4">

<label>Localidade</label>

<input type="text"
       class="form-control">

</div>

</div>

<button class="btn btn-success mt-3">
Pesquisar
</button>

</div>

<div class="card mb-3">

<div class="card-body">

<h5>Sistema para Gestão de Eventos</h5>

<p>
Área: Tecnologia
</p>

<p>
Status: Em análise
</p>

<a href="detalheDemanda.jsp"
   class="btn btn-outline-success">

Ver detalhes

</a>

</div>

</div>

</div>

</body>
</html>