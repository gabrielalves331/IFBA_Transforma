<%@page import="br.edu.ifba.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Estudante - IFBA Transforma</title>
    
    <!-- CORREÇÃO: Adicionado o CSS do Bootstrap que estava faltando -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- O seu CSS customizado continua aqui -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
</head>
<body class="d-flex"> <!-- CORREÇÃO: Adicionado d-flex para alinhar com a Sidebar -->
    
    <jsp:include page="sidebar.jsp" />

    <div class="content w-100 p-4"> <!-- Adicionado w-100 e p-4 para garantir que ocupe o espaço correto -->

        <!-- CABEÇALHO DO DASHBOARD -->
        <div class="card card-dashboard p-4 mb-4 shadow-sm border-0">
            <div class="d-flex justify-content-between align-items-center flex-wrap">
                <div>
                    <h2 class="mb-1 fw-bold">Bem-vindo, <%= usuario.getNome() %></h2>
                    <p class="text-muted mb-0 mt-2">
                        <span class="badge bg-success me-2"><%= usuario.getTipo() %></span>
                        Curso: <strong class="text-dark">Ciência da Computação</strong> | 
                        <strong class="text-dark">4º Semestre</strong>
                    </p>
                </div>
                <div class="text-end font-monospace text-muted mt-2 mt-md-0" style="font-size: 0.85rem;">
                    ID/CPF: <%= usuario.getId() %>
                </div>
            </div>
        </div>

        <!-- METRICAS -->
        <div class="row">
            <div class="col-md-6 mb-3">
                <div class="card card-dashboard p-4 text-center text-md-start shadow-sm border-0">
                    <h5 class="text-muted" style="font-size: 0.95rem;">Projetos Ativos</h5>
                    <h1 class="display-5 fw-bold text-success">2</h1>
                </div>
            </div>

            <div class="col-md-6 mb-3">
                <div class="card card-dashboard p-4 text-center text-md-start shadow-sm border-0">
                    <h5 class="text-muted" style="font-size: 0.95rem;">Entregas Pendentes</h5>
                    <h1 class="display-5 fw-bold text-warning">2</h1>
                </div>
            </div>
        </div>

        <!-- AÇÕES RÁPIDAS -->
        <div class="card card-dashboard p-4 mb-4 shadow-sm border-0">
            <h4 class="mb-3 fw-bold" style="font-size: 1.2rem;">Ações Rápidas</h4>
            <div>
                <a href="#" class="btn btn-success me-2 px-4" style="background-color: #1a5c38; border: none;">
                    Nova Entrega de Arquivo
                </a>
                <a href="meu_perfil.jsp" class="btn btn-outline-secondary px-4">
                    Atualizar Cadastro
                </a>
            </div>
        </div>

        <!-- SEÇÃO DE PROJETOS EM GRID -->
        <div class="card card-dashboard p-4 shadow-sm border-0">
            <h4 class="mb-4 fw-bold" style="font-size: 1.2rem;">Meus Projetos em Andamento</h4>
            
            <div class="row g-4">
                
                <!-- PROJETO 1 -->
                <div class="col-md-6">
                    <div class="card project-grid-card p-4 h-100 border-start border-4 border-success">
                        <div class="d-flex justify-content-between align-items-start mb-2">
                            <div>
                                <h5 class="mb-1 text-dark fw-bold" style="font-size: 1.15rem;">Plataforma Web: Site para Doações</h5>
                                <p class="text-muted small mb-0">Demanda: Associação de Moradores</p>
                            </div>
                            <span class="badge bg-primary px-2 py-1">Em Desenvolvimento</span>
                        </div>
                        
                        <div class="mt-4">
                            <label class="form-label small text-muted mb-1">Progresso do Projeto:</label>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="d-flex justify-content-between mt-2 small text-muted" style="font-size: 0.8rem;">
                                <span>Etapa: Levantamento de Requisitos</span>
                                <span class="fw-bold">50%</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PROJETO 2 -->
                <div class="col-md-6">
                    <div class="card project-grid-card p-4 h-100 border-start border-4 border-warning">
                        <div class="d-flex justify-content-between align-items-start mb-2">
                            <div>
                                <h5 class="mb-1 text-dark fw-bold" style="font-size: 1.15rem;">Oficina de Informática para Idosos</h5>
                                <p class="text-muted small mb-0">Demanda: Associação de Moradores</p>
                            </div>
                            <span class="badge bg-warning text-dark px-2 py-1">Em Planejamento</span>
                        </div>
                        
                        <div class="mt-4">
                            <label class="form-label small text-muted mb-1">Progresso do Projeto:</label>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="d-flex justify-content-between mt-2 small text-muted" style="font-size: 0.8rem;">
                                <span>Etapa: Planejamento da Oficina</span>
                                <span class="fw-bold">15%</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <!-- Script do Bootstrap que também estava faltando! -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>