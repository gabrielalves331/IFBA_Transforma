<%@page import="br.edu.ifba.model.Usuario"%>
<%@page import="br.edu.ifba.model.Demanda"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<%
    // Recebe a lista do Servlet (atributo "minhasDemandas")
    List<Demanda> minhasDemandas = (List<Demanda>) request.getAttribute("minhasDemandas");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Demandas - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- SIDEBAR IMPORTADA -->
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">

        <!-- CABEÇALHO DA PÁGINA -->
        <div class="card-painel mb-4 d-flex justify-content-between align-items-center flex-wrap gap-3">
            <div>
                <h1 class="page-title mb-1">Minhas Demandas Cadastradas</h1>
                <p class="subtitulo m-0">Acompanhe as demandas criadas por você e gerencie a equipe de alunos e colaboradores.</p>
            </div>
            <div>
                <a href="novaDemanda.jsp" class="btn btn-primary fw-bold">
                    + Cadastrar Nova Demanda
                </a>
            </div>
        </div>

        <!-- MENSAGEM DE ERRO (se houver) -->
        <% if (request.getAttribute("mensagemErro") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= request.getAttribute("mensagemErro") %>
            </div>
        <% } %>

        <!-- LISTAGEM DE MINHAS DEMANDAS -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="fs-5 m-0">Suas Demandas (<%= (minhasDemandas != null) ? minhasDemandas.size() : 0 %>)</h3>
        </div>

        <% if (minhasDemandas == null || minhasDemandas.isEmpty()) { %>
            <div class="card-painel text-center py-5">
                <p class="text-muted mb-3 fs-5">Você ainda não cadastrou nenhuma demanda social.</p>
                <a href="novaDemanda.jsp" class="btn btn-outline-primary fw-bold">Cadastrar Primeira Demanda</a>
            </div>
        <% } else { 
            for (Demanda d : minhasDemandas) { 
                String st = d.getStatus() != null ? d.getStatus() : "Submetida";
                String classeBadge = "pendente";
                
                if (st.equalsIgnoreCase("Concluída")) {
                    classeBadge = "concluido";
                } else if (st.equalsIgnoreCase("Assumida") || st.equalsIgnoreCase("Em Desenvolvimento")) {
                    classeBadge = "andamento";
                }
        %>

            <!-- CARD DA DEMANDA -->
            <div class="card-demanda mb-3">
                <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                    <div>
                        <div class="d-flex align-items-center gap-2 mb-2">
                            <span class="badge-status <%= classeBadge %>"><%= st %></span>
                            <% if (d.getPrazo() != null) { %>
                                <span class="badge bg-light text-dark border">
                                    Prazo: <%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(d.getPrazo()) %>
                                </span>
                            <% } %>
                        </div>
                        <h4 class="fw-bold text-dark mb-1"><%= d.getTitulo() %></h4>
                        <p class="text-muted small mb-0">
                            Contexto / Impacto: <strong><%= (d.getContexto() != null && !d.getContexto().isEmpty()) ? d.getContexto() : "Sem detalhes do contexto" %></strong>
                        </p>
                    </div>
                    
                    <!-- BOTÕES DE AÇÃO -->
                    <div class="d-flex gap-2 flex-wrap">
                        <!-- Botão de Ver Detalhes sempre visível -->
                        <a href="detalheDemanda.jsp?id=<%= d.getId() %>" class="btn btn-outline-primary fw-bold">
                            Ver Detalhes
                        </a>

                        <!-- Botão de Gerenciar Equipe (Redireciona para o gerenciamento de equipe com a demanda em questão) -->
                        <a href="gerenciar_equipe.jsp?demandaId=<%= d.getId() %>" class="btn btn-success fw-bold">
                            👥 Gerenciar Equipe
                        </a>
                    </div>
                </div>
            </div>

        <%  } 
        } %>

    </main>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>