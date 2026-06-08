<%@page import="br.edu.ifba.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Usuario usuario =
        (Usuario) session.getAttribute("usuario");

if(usuario == null){

    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Dashboard Estudante</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    background:#f5f7fa;
}

.sidebar{

    position:fixed;

    left:0;
    top:0;

    width:250px;
    height:100%;

    background:#006633;

    padding-top:30px;
}

.sidebar a{

    display:block;

    color:white;

    text-decoration:none;

    padding:15px 25px;
}

.sidebar a:hover{

    background:#004d26;
}

.content{

    margin-left:250px;

    padding:30px;
}

.card-dashboard{

    border:none;

    border-radius:15px;

    box-shadow:0 0 15px rgba(0,0,0,.08);
}

</style>

</head>

<body>

<div class="sidebar">

    <h3 class="text-white text-center mb-4">
        IFBA Transforma
    </h3>

    <a href="dashboardEstudante.jsp">
        Dashboard
    </a>

    <a href="buscarDemandas.jsp">
        Buscar Demandas
    </a>

    <a href="#">
        Meus Projetos
    </a>

    <a href="#">
        Meu Perfil
    </a>

    <a href="index.jsp">
        Sair
    </a>

</div>

<div class="content">

    <h2>
        Bem-vindo,
        <%= usuario.getNome() %>
    </h2>

    <p>
        Perfil:
        <strong>
            <%= usuario.getTipo() %>
        </strong>
    </p>

    <div class="row mt-4">

        <div class="col-md-4">

            <div class="card card-dashboard p-4">

                <h5>
                    Projetos Participando
                </h5>

                <h1>
                    0
                </h1>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card card-dashboard p-4">

                <h5>
                    Entregas Pendentes
                </h5>

                <h1>
                    0
                </h1>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card card-dashboard p-4">

                <h5>
                    Projetos Concluídos
                </h5>

                <h1>
                    0
                </h1>

            </div>

        </div>

    </div>

    <div class="mt-5">

        <h4>
            Ações Rápidas
        </h4>

        <a href="buscarDemandas.jsp"
           class="btn btn-success me-2">

            Buscar Demandas

        </a>

        <a href="#"
           class="btn btn-outline-success">

            Meus Projetos

        </a>

    </div>

</div>

</body>
</html>