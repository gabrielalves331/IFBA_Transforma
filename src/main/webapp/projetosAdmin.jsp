<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, br.edu.ifba.model.Projeto" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Projetos - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
</head>
<body>
<jsp:include page="sidebar.jsp" />


    <main class="content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h1 class="h3 fw-bold">Projetos</h1>
                <p class="text-muted">Gerenciamento de projetos acadêmicos</p>
            </div>
            <button class="btn btn-success shadow-sm">+ Novo Projeto</button>
        </div>

        <div class="card-painel">
            <table class="table table-hover align-middle">
                <thead>
                    <tr>
                        <th>ID</th><th>Título</th><th>Orientador</th><th>Status</th><th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Projeto> projetos = (List<Projeto>) request.getAttribute("projetos");
                        if (projetos != null && !projetos.isEmpty()) {
                            for (Projeto p : projetos) {
                                String status = p.getStatus();
                                String cor = "bg-secondary";
                                if("Concluído".equalsIgnoreCase(status)) cor = "bg-success";
                                else if("Em Andamento".equalsIgnoreCase(status)) cor = "bg-warning text-dark";
                    %>
                    <tr>
                        <td class="fw-bold text-secondary"><%= p.getId() %></td>
                        <td><%= p.getTitulo() %></td>
                        <td><%= p.getOrientador() %></td>
                        <td><span class="badge <%= cor %> px-2 py-1"><%= status %></span></td>
                        <td>
                            <div class="d-flex gap-2">
                                <a href="#" class="btn btn-sm btn-outline-primary btn-acao">Ver</a>
                                <a href="ProjetoServlet?acao=excluir&id=<%= p.getId() %>" 
                                   onclick="return confirm('Excluir este projeto permanentemente?');"
                                   class="btn btn-sm btn-outline-danger btn-acao">Excluir</a>
                            </div>
                        </td>
                    </tr>
                    <%      }
                        } else {
                    %>
                    <tr><td colspan="5" class="text-center text-muted py-4">Nenhum projeto encontrado.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>