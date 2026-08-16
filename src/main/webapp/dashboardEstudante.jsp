<%@page import="br.edu.ifba.model.Usuario"%>
<%@page import="br.edu.ifba.model.Projeto"%>
<%@page import="br.edu.ifba.dao.ProjetoDAO"%>
<%@page import="br.edu.ifba.model.Demanda"%>
<%@page import="br.edu.ifba.dao.DemandaDAO"%>
<%@page import="br.edu.ifba.model.ProjetoParticipante"%>
<%@page import="br.edu.ifba.dao.ProjetoParticipanteDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // 1. Validação de Sessão
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) { 
        response.sendRedirect("login.jsp"); 
        return; 
    }

    // 2. Busca de vínculos reais do Estudante
    ProjetoParticipanteDAO ppDAO = new ProjetoParticipanteDAO();
    ProjetoDAO projetoDAO = new ProjetoDAO();
    DemandaDAO demandaDAO = new DemandaDAO();
    
    // Lista os vínculos do aluno com projetos
    List<ProjetoParticipante> vinculos = ppDAO.listarPorUsuario(usuario.getId());
    
    // Para cada vínculo, vamos carregar os detalhes do projeto e da demanda para exibir no card
    List<Projeto> meusProjetos = new ArrayList<>();
    for (ProjetoParticipante pp : vinculos) {
        Projeto p = projetoDAO.buscarPorId(pp.getProjeto().getId());
        if (p != null) {
            // Tenta buscar a demanda associada para pegar o título original
            try {
                Demanda d = demandaDAO.buscarPorId(Integer.parseInt(p.getDemandaId()));
                if (d != null) {
                    p.setDescricao(d.getTitulo()); // Usando o campo descrição temporariamente para guardar o título da demanda no card
                }
            } catch (Exception e) {}
            meusProjetos.add(p);
        }
    }

    int totalProjetosAtivos = meusProjetos.size();
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Estudante - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <jsp:include page="sidebar.jsp" />

    <main class="content">

        <!-- CABEÇALHO DO DASHBOARD -->
        <div class="card-painel mb-4">
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                <div>
                    <h1 class="page-title mb-1">Bem-vindo, <%= usuario.getNome() %></h1>
                    <div class="subtitulo m-0 d-flex align-items-center gap-2 flex-wrap">
                        <span class="badge-status concluido"><%= usuario.getTipo() %></span>
                        <span class="text-muted">|</span>
                        <span>Matrícula/ID: <strong><%= usuario.getId() %></strong></span>
                    </div>
                </div>
            </div>
        </div>

        <!-- CARDS DE MÉTRICAS DINÂMICOS -->
        <div class="dashboard-grid mb-4">
            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Projetos Ativos</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-primary);"><%= totalProjetosAtivos %></h2>
                <span class="badge-status andamento mt-2">Participando</span>
            </div>

            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Oportunidades</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-info);">Novo</h2>
                <a href="buscarDemandas.jsp" class="badge-status pendente mt-2 text-decoration-none">Buscar Projetos</a>
            </div>
        </div>

        <!-- SEÇÃO DE PROJETOS REAIS -->
        <div class="card-painel">
            <h2 style="font-size: var(--fs-lg); font-weight: var(--fw-bold);" class="mb-4">Meus Projetos em Andamento</h2>

            <div class="row g-4">
                <% if (meusProjetos.isEmpty()) { %>
                    <div class="col-12 text-center py-5">
                        <p class="text-muted">Você ainda não faz parte de nenhum projeto.</p>
                        <a href="buscarDemandas.jsp" class="btn btn-primary">Explorar Demandas Disponíveis</a>
                    </div>
                <% } else { 
                    for (Projeto p : meusProjetos) { 
                        String statusClass = p.getStatus().equalsIgnoreCase("Concluído") ? "concluido" : "andamento";
                %>
                <div class="col-md-6">
                    <a href="detalhes_projeto.jsp?id=<%= p.getId() %>" class="text-decoration-none text-reset d-block h-100">
                        <div class="project-grid-card p-4 border rounded shadow-sm bg-white">
                            <div class="d-flex justify-content-between align-items-start mb-2 gap-2">
                                <div>
                                    <h3 class="mb-1 text-dark fw-bold" style="font-size: var(--fs-md);"><%= p.getTitulo() %></h3>
                                    <p class="text-muted small mb-0">Demanda Original: <%= p.getDescricao() %></p>
                                </div>
                                <span class="badge-status <%= statusClass %>"><%= p.getStatus() %></span>
                            </div>

                            <div class="mt-4">
                                <label class="form-label small text-muted mb-1">Status do Projeto:</label>
                                <div class="progress my-2" style="height: 8px;">
                                    <div class="progress-bar" role="progressbar" style="width: 100%; background-color: var(--color-primary);" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="d-flex justify-content-between mt-2 small text-muted">
                                    <span>Ver detalhes da equipe e prazos</span>
                                    <i class="bi bi-arrow-right"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <% } 
                } %>
            </div>
        </div>

    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
