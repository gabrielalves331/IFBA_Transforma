<%@page import="br.edu.ifba.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Estudante - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
</head>
<body class="d-flex">
    <jsp:include page="sidebar.jsp" />

    


<div class="content">
    <!-- Cabeçalho idêntico -->
    <div class="card card-dashboard p-4 mb-4">
        <h2>Bem-vindo, Prof. <%= usuario.getNome() %></h2>
        <p class="text-muted mb-0 mt-2">
            <span class="profile-badge me-2"><%= usuario.getTipo() %></span>
        </p>
    </div>

    <!-- MÉTRICAS (Adaptadas para Professor) -->
    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="card card-dashboard p-4 text-center text-md-start">
                <h5 class="text-muted" style="font-size: 0.95rem;">Projetos sob Orientação</h5>
                <h1 class="display-5 fw-bold text-success">4</h1>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="card card-dashboard p-4 text-center text-md-start">
                <h5 class="text-muted" style="font-size: 0.95rem;">Demandas Solicitadas</h5>
                <h1 class="display-5 fw-bold text-primary">1</h1>
            </div>
        </div>
    </div>

    <!-- SEÇÃO DE PROJETOS (A mesma lógica de cards) -->
    <div class="card card-dashboard p-4">
        <h4 class="mb-4" style="font-size: 1.2rem;">Projetos em Orientação</h4>
        <div class="row g-4">
            <!-- Aqui você repete a estrutura dos project-grid-card -->
            <!-- O professor verá os projetos dos estudantes que ele orienta -->
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>