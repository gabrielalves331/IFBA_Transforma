<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, br.edu.ifba.model.Projeto" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projetos - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- CSS Customizado -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <!-- SIDEBAR IMPORTADA -->
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        
        <!-- CABEÇALHO DA PÁGINA -->
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
            <div>
                <h1 class="page-title m-0">Projetos</h1>
                <p class="subtitulo mb-0">Gerenciamento e acompanhamento de projetos acadêmicos.</p>
            </div>
            <div>
                <a href="cadastrarProjeto.jsp" class="btn btn-primary shadow-sm fw-bold px-4">
                    + Novo Projeto
                </a>
            </div>
        </div>

        <!-- CONTAINER DA TABELA -->
        <div class="card-painel p-0 overflow-hidden shadow-sm">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light text-secondary small text-uppercase" style="border-bottom: 2px solid var(--color-border);">
                        <tr>
                            <th class="py-3 px-4" style="width: 10%;">ID</th>
                            <th class="py-3" style="width: 35%;">Título</th>
                            <th class="py-3" style="width: 25%;">Orientador</th>
                            <th class="py-3" style="width: 15%;">Status</th>
                            <th class="py-3 px-4 text-end" style="width: 15%;">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<Projeto> projetos = (List<Projeto>) request.getAttribute("projetos");
                            if (projetos != null && !projetos.isEmpty()) {
                                for (Projeto p : projetos) {
                                    String status = p.getStatus() != null ? p.getStatus() : "Sem Status";
                                    
                                    // Classe de estilo baseada no status
                                    String statusClass = "badge-status";
                                    if ("Concluído".equalsIgnoreCase(status)) {
                                        statusClass += " status-concluido";
                                    } else if ("Em Andamento".equalsIgnoreCase(status)) {
                                        statusClass += " status-andamento";
                                    } else if ("Pendente".equalsIgnoreCase(status)) {
                                        statusClass += " status-pendente";
                                    } else {
                                        statusClass += " bg-secondary text-white";
                                    }
                        %>
                        <tr>
                            <td class="fw-bold text-secondary px-4">#<%= p.getId() %></td>
                            <td class="fw-semibold text-dark"><%= p.getTitulo() %></td>
                            <td class="text-secondary"><%= p.getOrientador() %></td>
                            <td>
                                <span class="<%= statusClass %>">
                                    <%= status %>
                                </span>
                            </td>
                            <td class="px-4 text-end">
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="ProjetoServlet?acao=detalhes&id=<%= p.getId() %>" 
                                       class="btn btn-sm btn-outline-primary fw-bold px-3">
                                        Ver
                                    </a>
                                    <a href="ProjetoServlet?acao=excluir&id=<%= p.getId() %>" 
                                       onclick="return confirm('Tem certeza que deseja excluir o projeto &quot;<%= p.getTitulo() %>&quot;?');"
                                       class="btn btn-sm btn-outline-danger fw-bold px-3" style="border-radius: var(--radius-md);">
                                        Excluir
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% 
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center text-muted py-5">
                                <p class="fs-6 mb-1 text-secondary fw-semibold">Nenhum projeto encontrado.</p>
                                <small>Cadastre um novo projeto para começar a acompanhá-lo por aqui.</small>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>