<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Cadastro de Estudante</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f5f7fa;
}

.card-cadastro{

    max-width:900px;
    margin:auto;
    margin-top:50px;

    background:white;

    padding:40px;

    border-radius:20px;

    box-shadow:0 0 25px rgba(0,0,0,.08);
}

.titulo{
    color:#006633;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

    <div class="card-cadastro">

        <h2 class="titulo mb-4">
            Cadastro de Estudante
        </h2>

        <form action="UsuarioServlet" method="POST">

            <input type="hidden"
                   name="tipo"
                   value="Estudante">

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label>CPF</label>

                    <input type="text"
                           name="id"
                           class="form-control"
                           required>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Nome Completo</label>

                    <input type="text"
                           name="nome"
                           class="form-control"
                           required>

                </div>

            </div>

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label>E-mail</label>

                    <input type="email"
                           name="email"
                           class="form-control"
                           required>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Senha</label>

                    <input type="password"
                           name="senha"
                           class="form-control"
                           required>

                </div>

            </div>

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label>Curso</label>

                    <input type="text"
                           name="curso"
                           class="form-control"
                           placeholder="Ex: Ciência da Computação">

                </div>

                <div class="col-md-6 mb-3">

                    <label>Semestre</label>

                    <input type="number"
                           name="semestre"
                           class="form-control"
                           min="1">

                </div>

            </div>

            <div class="mb-3">

                <label>Currículo (Link Lattes)</label>

                <input type="text"
                       name="curriculo"
                       class="form-control">

            </div>

            <div class="d-flex justify-content-between">

                <a href="escolherPerfil.jsp"
                   class="btn btn-secondary">

                    Voltar

                </a>

                <button type="submit"
                        class="btn btn-success">

                    Cadastrar Estudante

                </button>

            </div>

        </form>

    </div>

</div>

</body>
</html>