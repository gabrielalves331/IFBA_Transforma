<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Escolha seu Perfil</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f5f7fa;
}

.header{
    background:#006633;
    color:white;
    padding:30px;
    text-align:center;
}

.card-perfil{
    border:none;
    border-radius:15px;
    transition:0.3s;
    cursor:pointer;
    box-shadow:0 0 15px rgba(0,0,0,.08);
}

.card-perfil:hover{
    transform:translateY(-5px);
}

.icone{
    font-size:60px;
}

</style>

</head>

<body>

<div class="header">

    <h1>IFBA Transforma</h1>
    <p>Selecione o perfil que melhor representa você</p>

</div>

<div class="container mt-5">

    <div class="row g-4">

        <div class="col-md-4">

            <a href="cadastroEstudante.jsp" class="text-decoration-none text-dark">

                <div class="card card-perfil p-4 text-center">

                    <div class="icone">🎓</div>

                    <h3 class="mt-3">
                        Estudante
                    </h3>

                    <p>
                        Participar de projetos e ações de extensão.
                    </p>

                </div>

            </a>

        </div>

        <div class="col-md-4">

            <a href="cadastroProfessor.jsp" class="text-decoration-none text-dark">

                <div class="card card-perfil p-4 text-center">

                    <div class="icone">👨‍🏫</div>

                    <h3 class="mt-3">
                        Professor
                    </h3>

                    <p>
                        Orientar projetos e selecionar demandas.
                    </p>

                </div>

            </a>

        </div>

        <div class="col-md-4">

            <a href="cadastroComunidade.jsp" class="text-decoration-none text-dark">

                <div class="card card-perfil p-4 text-center">

                    <div class="icone">🏢</div>

                    <h3 class="mt-3">
                        Comunidade Externa
                    </h3>

                    <p>
                        Cadastrar demandas e acompanhar soluções.
                    </p>

                </div>

            </a>

        </div>

    </div>

</div>

</body>
</html>