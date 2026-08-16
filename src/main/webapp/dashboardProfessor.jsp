<%@page import="br.edu.ifba.model.Usuario"%>
<%@page import="br.edu.ifba.model.Projeto"%>
<%@page import="br.edu.ifba.dao.ProjetoDAO"%>
<%@page import="br.edu.ifba.model.Demanda"%>
<%@page import="br.edu.ifba.dao.DemandaDAO"%>
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

    // 2. Inicialização de variáveis
    List<Projeto> projetosOrientados = new ArrayList<>();
    List<Demanda> demandasCadastradas = new ArrayList<>();
    int totalProjetos = 0;
    int totalDemandas = 0;

    // 3. Busca de dados reais com tratamento de erro
    try {
        ProjetoDAO projetoDAO = new ProjetoDAO();
        DemandaDAO demandaDAO = new DemandaDAO();
        
        // O método listarPorResponsavel deve estar no seu ProjetoDAO.java
        // O usuario.getId() retorna String, compatível com a assinatura do DAO.
        projetosOrientados = projetoDAO.listarPorResponsavel(usuario.getId());
        
        // Busca demandas do usuário
        demandasCadastradas = demandaDAO.listarPorUsuario(usuario.getId());

        totalProjetos = (projetosOrientados != null) ? projetosOrientados.size() : 0;
        totalDemandas = (demandasCadastradas != null) ? demandasCadastradas.size() : 0;
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("mensagemErro", "Erro ao carregar dados do banco: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Professor - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <jsp:include page="sidebar.jsp" />

    <main class="content">

        <!-- MENSAGEM DE ERRO -->
        <% if (request.getAttribute("mensagemErro") != null) { %>
            <div class="alert alert-danger shadow-sm border-0 mb-4" role="alert">
                <strong>Atenção:</strong> <%= request.getAttribute("mensagemErro") %>
            </div>
        <% } %>

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
                <div class="text-end font-monospace text-muted" style="font-size: 0.8rem;">
                    SAPE/ID: <strong><%= usuario.getId() %></strong>
                </div>
            </div>
        </div>

        <!-- CARDS DE MÉTRICAS -->
        <div class="dashboard-grid mb-4">
            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: 1rem;">Projetos sob Orientação</h3>
                <h2 style="font-size: 2rem; color: var(--color-primary);"><%= totalProjetos %></h2>
                <span class="badge-status andamento mt-2">Em acompanhamento</span>
            </div>

            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: 1rem;">Demandas Cadastradas</h3>
                <h2 style="font-size: 2rem; color: var(--color-info);"><%= totalDemandas %></h2>
                <span class="badge-status pendente mt-2">Gestão de solicitações</span>
            </div>
        </div>

        <!-- LISTA DE PROJETOS -->
        <div class="card-painel">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                <h2 style="font-size: 1.2rem; font-weight: bold;" class="m-0">Projetos em Orientação</h2>
                <a href="buscarDemandas.jsp" class="btn btn-primary btn-sm">+ Assumir Nova Demanda</a>
            </div>

            <div class="row g-4">
                <% if (projetosOrientados == null || projetosOrientados.isEmpty()) { %>
                    <div class="col-12 text-center py-4 text-muted">
                        Você não está orientando nenhum projeto no momento.
                    </div>
                <% } else { 
                    for (Projeto p : projetosOrientados) { 
                        String corStatus = (p.getStatus() != null && p.getStatus().equalsIgnoreCase("Concluído")) ? "var(--color-primary)" : "var(--color-warning)";
                %>
                <div class="col-md-6">
                    <div class="card p-4 h-100 border-start border-4" style="border-left-color: <%= corStatus %> !important; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); border-top: none; border-right: none; border-bottom: none;">
                        <div class="d-flex justify-content-between align-items-start mb-2 gap-2">
                            <div>
                                <h3 class="mb-1 text-dark fw-bold" style="font-size: 1rem;"><%= p.getTitulo() %></h3>
                                <p class="text-muted small mb-0">Status: <strong><%= p.getStatus() %></strong></p>
                            </div>
                            <a href="gerenciar_equipe.jsp?demandaId=<%= p.getDemandaId() %>" class="btn btn-sm btn-outline-primary">Equipe</a>
                        </div>
                        <div class="mt-4">
                            <div class="d-flex gap-2">
                                <a href="detalhes_projeto.jsp?id=<%= p.getId() %>" class="btn btn-sm btn-light border">Ver Projeto</a>
                                <a href="etapas_projeto.jsp?projetoId=<%= p.getId() %>" class="btn btn-sm btn-light border">Etapas</a>
                            </div>
                        </div>
                    </div>
                </div>
                <% } 
                } %>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
