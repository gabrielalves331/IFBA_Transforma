<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>IFBA Transforma</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body{
            background:#f5f7fa;
        }

        .hero{
            min-height:90vh;
            display:flex;
            align-items:center;
        }

        .titulo{
            color:#006633;
            font-weight:700;
            font-size:3rem;
        }

        .subtitulo{
            font-size:1.2rem;
            color:#555;
        }

        .btn-ifba{
            background:#006633;
            color:white;
        }

        .btn-ifba:hover{
            background:#004d26;
            color:white;
        }

        .card-info{
            border:none;
            border-radius:15px;
            box-shadow:0 0 20px rgba(0,0,0,0.08);
        }

        footer{
            background:#006633;
            color:white;
            padding:20px;
            text-align:center;
        }

    </style>

</head>
<body>

<nav class="navbar navbar-expand-lg bg-white shadow-sm">
    <div class="container">

        <a class="navbar-brand fw-bold text-success" href="#">
            IFBA Transforma
        </a>

        <div class="ms-auto">

            <a href="login.jsp" class="btn btn-outline-success me-2">
                Entrar
            </a>

            <a href="cadastro.jsp" class="btn btn-success">
                Cadastre-se
            </a>

        </div>

    </div>
</nav>

<section class="hero">

    <div class="container">

        <div class="row align-items-center">

            <div class="col-md-6">

                <h1 class="titulo">
                    Conectando a comunidade ao IFBA
                </h1>

                <p class="subtitulo mt-4">
                    Transforme problemas reais em projetos acadêmicos.
                    Cadastre demandas, acompanhe projetos e gere impacto social.
                </p>

                <div class="mt-4">

                    <a href="cadastro.jsp" class="btn btn-ifba btn-lg me-2">
                        Começar Agora
                    </a>

                    <a href="login.jsp" class="btn btn-outline-success btn-lg">
                        Entrar
                    </a>

                </div>

            </div>

            <div class="col-md-6 text-center">

                <img
                    src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                    width="350"
                    class="img-fluid"
                >

            </div>

        </div>

    </div>

</section>

<section class="container mb-5">

    <div class="row">

        <div class="col-md-4">

            <div class="card card-info p-4">

                <h4>Comunidade</h4>

                <p>
                    Cadastre desafios e necessidades reais.
                </p>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card card-info p-4">

                <h4>Professores</h4>

                <p>
                    Transforme demandas em projetos ACEX.
                </p>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card card-info p-4">

                <h4>Estudantes</h4>

                <p>
                    Participe de projetos que impactam a sociedade.
                </p>

            </div>

        </div>

    </div>

</section>

<footer>
    IFBA Transforma © 2026
</footer>

</body>
</html>