<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifba.model.Usuario" %>
<%@ page import="br.edu.ifba.model.Demanda" %>
<%@ page import="br.edu.ifba.dao.DemandaDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) { 
        response.sendRedirect("login.jsp"); 
        return; 
    }

    // Busca as demandas reais do usuário logado
    DemandaDAO demandaDAO = new DemandaDAO();
    List<Demanda> minhasDemandas = demandaDAO.listarPorUsuario(usuario.getId());

    // Calcula métricas dinamicamente
    int emAnalise = 0;
    int emDesenvolvimento = 0;
    int concluidos = 0;

    for (Demanda d : minhasDemandas) {
        String st = d.getStatus() != null ? d.getStatus() : "";
        if (st.equalsIgnoreCase("Submetida") || st.equalsIgnoreCase("Em Análise")) emAnalise++;
        else if (st.equalsIgnoreCase("Assumida") || st.equalsIgnoreCase("Em Desenvolvimento")) emDesenvolvimento++;
        else if (st.equalsIgnoreCase("Concluída")) concluidos++;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Comunidade | IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <jsp:include page="sidebar.jsp" />

    <main class="content">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">
            <div>
                <h1 class="page-title">Painel da Comunidade</h1>
                <p class="subtitulo">Olá, <strong><%= usuario.getNome() %></strong>. Acompanhe suas solicitações ao IFBA.</p>
            </div>
            <a href="novaDemanda.jsp" class="btn btn-primary">+ Nova Demanda</a>
        </div>

        <!-- CARDS DE MÉTRICAS DINÂMICOS -->
        <div class="dashboard-grid mb-4">
            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Demandas em Análise</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-warning);"><%= emAnalise %></h2>
                <span class="badge-status pendente mt-2">Aguardando Orientador</span>
            </div>

            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Em Desenvolvimento</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-info);"><%= emDesenvolvimento %></h2>
                <span class="badge-status andamento mt-2">Projeto em execução</span>
            </div>

            <div class="card-dashboard card-body-custom">
                <h3 class="mb-2" style="color: var(--color-text-secondary); font-size: var(--fs-md);">Projetos Concluídos</h3>
                <h2 style="font-size: var(--fs-2xl); color: var(--color-primary);"><%= concluidos %></h2>
                <span class="badge-status concluido mt-2">Finalizados com sucesso</span>
            </div>
        </div>

        <!-- TABELA DE SOLICITAÇÕES REAIS -->
        <div class="card-painel">
            <h2 style="font-size: var(--fs-lg); font-weight: var(--fw-bold);" class="mb-3">Suas Solicitações Recentes</h2>
            
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th style="border-top-left-radius: 8px;">Título da Demanda</th>
                            <th>Data de Envio</th>
                            <th style="border-top-right-radius: 8px;">Status</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (minhasDemandas.isEmpty()) { %>
                            <tr><td colspan="4" class="text-center text-muted py-4">Você ainda não enviou nenhuma demanda.</td></tr>
                        <% } else { 
                            for (Demanda d : minhasDemandas) { 
                                String badgeClass = "pendente";
                                if (d.getStatus().equalsIgnoreCase("Concluída")) badgeClass = "concluido";
                                else if (d.getStatus().contains("Desenvolvimento") || d.getStatus().equalsIgnoreCase("Assumida")) badgeClass = "andamento";
                        %>
                            <tr>
                                <td class="fw-bold text-dark"><%= d.getTitulo() %></td>
                                <td class="text-muted"><%= d.getPrazo() != null ? new java.text.SimpleDateFormat("dd/MM/yyyy").format(d.getPrazo()) : "--" %></td>
                                <td><span class="badge-status <%= badgeClass %>"><%= d.getStatus() %></span></td>
                                <td><a href="detalheDemanda.jsp?id=<%= d.getId() %>" class="btn btn-sm btn-outline-primary">Ver</a></td>
                            </tr>
                        <% } 
                        } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
