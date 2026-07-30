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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Professor - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- SIDEBAR IMPORTADA -->
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">

        <!-- CABEÇALHO DO DASHBOARD -->
        <div class="card-painel mb-4">
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                <div>
                    <h1 class="page-title mb-1">Bem-vindo, Prof. <%= usuario.getNome() %></h1>
                    <div class="subtitulo m-0 d-flex align-items-center gap-2 flex-wrap">
                        <span class="badge-status concluido"><%= usuario.getTipo() %></span>
                        <span class="text-muted">|</span>
                        <span>Acompanhamento e Orientação de Projetos ACEX</span>
                    </div>
                </div>
                <div class="text-end font-monospace text-muted" style="font-size: var(--fs-xs);">
                    SAPE/ID: <strong><%= usuario.getId() %></strong>
                </div>
            </div>
        </div>

        <!-- CARDS DE MÉTRICAS -->
        <div class="dashboard-grid mb-4">
            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Projetos sob Orientação</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-primary);">4</h2>
                <span class="badge-status andamento mt-2">Em acompanhamento</span>
            </div>

            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Demandas Solicitadas</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-info);">1</h2>
                <span class="badge-status pendente mt-2">Aguardando validação</span>
            </div>
        </div>

        <!-- SEÇÃO DE PROJETOS EM ORIENTAÇÃO -->
        <div class="card-painel">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                <h2 style="font-size: var(--fs-lg); font-weight: var(--fw-bold);" class="m-0">Projetos em Orientação</h2>
                <a href="novaDemanda.jsp" class="btn btn-primary btn-sm">+ Novo Acompanhamento</a>
            </div>

            <div class="row g-4">
                
                <!-- PROJETO 1 -->
                <div class="col-md-6">
                    <div class="card p-4 h-100 border-start border-4" style="border-left-color: var(--color-primary) !important; border-radius: var(--radius-md); box-shadow: var(--shadow-sm); border-top: none; border-right: none; border-bottom: none; background-color: var(--color-surface);">
                        <div class="d-flex justify-content-between align-items-start mb-2 gap-2">
                            <div>
                                <h3 class="mb-1 text-dark fw-bold" style="font-size: var(--fs-md);">Plataforma Web: Site para Doações</h3>
                                <p class="text-muted small mb-0">Estudante: Gabriel Alves | Demanda: Associação de Moradores</p>
                            </div>
                            <span class="badge-status andamento">Em Desenvolvimento</span>
                        </div>

                        <div class="mt-4">
                            <label class="form-label small text-muted mb-1">Progresso do Projeto:</label>
                            <div class="progress" style="height: 8px; border-radius: var(--radius-sm);">
                                <div class="progress-bar" role="progressbar" style="width: 50%; background-color: var(--color-primary);" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="d-flex justify-content-between mt-2 small text-muted">
                                <span>Etapa: Levantamento de Requisitos</span>
                                <span class="fw-bold text-dark">50%</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PROJETO 2 -->
                <div class="col-md-6">
                    <div class="card p-4 h-100 border-start border-4" style="border-left-color: var(--color-warning) !important; border-radius: var(--radius-md); box-shadow: var(--shadow-sm); border-top: none; border-right: none; border-bottom: none; background-color: var(--color-surface);">
                        <div class="d-flex justify-content-between align-items-start mb-2 gap-2">
                            <div>
                                <h3 class="mb-1 text-dark fw-bold" style="font-size: var(--fs-md);">Oficina de Informática para Idosos</h3>
                                <p class="text-muted small mb-0">Estudante: Lucas Silva | Demanda: Centro Comunitário</p>
                            </div>
                            <span class="badge-status pendente">Em Planejamento</span>
                        </div>

                        <div class="mt-4">
                            <label class="form-label small text-muted mb-1">Progresso do Projeto:</label>
                            <div class="progress" style="height: 8px; border-radius: var(--radius-sm);">
                                <div class="progress-bar" role="progressbar" style="width: 15%; background-color: var(--color-warning);" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="d-flex justify-content-between mt-2 small text-muted">
                                <span>Etapa: Planejamento da Oficina</span>
                                <span class="fw-bold text-dark">15%</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </main>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>