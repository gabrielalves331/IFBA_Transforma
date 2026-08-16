<%@page import="br.edu.ifba.model.Usuario"%>
<%@page import="br.edu.ifba.dao.DemandaDAO"%>
<%@page import="br.edu.ifba.model.Demanda"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Validação de Sessão
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Prioriza a lista que vem do Servlet (após filtro)
    List<Demanda> listaDemandas = (List<Demanda>) request.getAttribute("demandas");
    
    // Se for o primeiro acesso direto à JSP, busca todas as demandas
    if (listaDemandas == null) {
        DemandaDAO demandaDAO = new DemandaDAO();
        listaDemandas = demandaDAO.listarTodas();
    }

    // Recupera valores dos filtros para manter o estado no formulário
    String areaSel = (String) request.getAttribute("areaSelecionada");
    String statusSel = (String) request.getAttribute("statusSelecionado");
    String localidadeDigitada = (String) request.getAttribute("localidadeDigitada");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Demandas - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <jsp:include page="sidebar.jsp" />

    <main class="content">
        <div class="card-painel mb-4">
            <h1 class="page-title mb-1">Buscar Demandas Sociais</h1>
            <p class="subtitulo m-0">Encontre e assuma demandas submetidas pela comunidade para suas ações de extensão.</p>
        </div>

        <!-- FORMULÁRIO DE FILTROS CONECTADO AO SERVLET -->
        <div class="card-painel mb-4">
            <h3 class="fs-5 mb-3">Filtros de Pesquisa</h3>
            
            <form action="BuscarDemandasServlet" method="GET">
                <div class="row g-3">
                    <div class="col-md-4">
                        <label class="form-label">Área de Atuação</label>
                        <select name="area" class="form-select">
                            <option value="">Todas as áreas</option>
                            <option value="Tecnologia e Inovação" <%= "Tecnologia e Inovação".equals(areaSel) ? "selected" : "" %>>Tecnologia e Inovação</option>
                            <option value="Educação" <%= "Educação".equals(areaSel) ? "selected" : "" %>>Educação</option>
                            <option value="Saúde e Bem-estar" <%= "Saúde e Bem-estar".equals(areaSel) ? "selected" : "" %>>Saúde e Bem-estar</option>
                            <option value="Meio Ambiente" <%= "Meio Ambiente".equals(areaSel) ? "selected" : "" %>>Meio Ambiente</option>
                            <option value="Gestão e Negócios" <%= "Gestão e Negócios".equals(areaSel) ? "selected" : "" %>>Gestão e Negócios</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Status da Demanda</label>
                        <select name="status" class="form-select">
                            <option value="">Todos os status</option>
                            <option value="Submetida" <%= "Submetida".equals(statusSel) ? "selected" : "" %>>Submetida</option>
                            <option value="Em Análise" <%= "Em Análise".equals(statusSel) ? "selected" : "" %>>Em Análise</option>
                            <option value="Assumida" <%= "Assumida".equals(statusSel) ? "selected" : "" %>>Assumida</option>
                            <option value="Em Desenvolvimento" <%= "Em Desenvolvimento".equals(statusSel) ? "selected" : "" %>>Em Desenvolvimento</option>
                            <option value="Concluída" <%= "Concluída".equals(statusSel) ? "selected" : "" %>>Concluída</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Localidade / Comunidade</label>
                        <input type="text" name="localidade" class="form-control" 
                               placeholder="Ex: Bairro Central, ONG, Associação..." 
                               value="<%= localidadeDigitada != null ? localidadeDigitada : "" %>">
                    </div>
                </div>

                <div class="mt-3 text-end">
                    <button type="submit" class="btn btn-primary px-4">
                        🔍 Pesquisar Demandas
                    </button>
                </div>
            </form>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="fs-5 m-0">Demandas Encontradas (<%= listaDemandas.size() %>)</h3>
            <span class="text-muted small">Exibindo demandas cadastradas</span>
        </div>

        <% if (listaDemandas.isEmpty()) { %>
            <div class="alert alert-info">Nenhuma demanda encontrada com os filtros selecionados.</div>
        <% } else { 
            for (Demanda d : listaDemandas) { 
                String classeBadge = "pendente";
                String st = d.getStatus() != null ? d.getStatus() : "Submetida";
                
                if (st.equalsIgnoreCase("Concluída") || st.equalsIgnoreCase("Disponível")) {
                    classeBadge = "concluido";
                } else if (st.equalsIgnoreCase("Assumida") || st.equalsIgnoreCase("Em Desenvolvimento")) {
                    classeBadge = "andamento";
                }
        %>
            <div class="card-demanda mb-3">
                <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                    <div>
                        <div class="d-flex align-items-center gap-2 mb-2">
                            <span class="badge-status <%= classeBadge %>"><%= st %></span>
                            <% if (d.getLocalidade() != null && !d.getLocalidade().isEmpty()) { %>
                                <small class="text-muted"><i class="bi bi-geo-alt"></i> <%= d.getLocalidade() %></small>
                            <% } %>
                        </div>
                        <h4 class="fw-bold text-dark mb-1"><%= d.getTitulo() %></h4>
                        <p class="text-muted small mb-0">
                            Demandante: <strong><%= d.getDescDemandante() != null ? d.getDescDemandante() : "Não informado" %></strong>
                        </p>
                    </div>
                    
                    <div class="d-flex gap-2">
                        <a href="detalheDemanda.jsp?id=<%= d.getId() %>" class="btn btn-outline-primary fw-bold">
                            Ver Detalhes
                        </a>
                        <% if (!st.equalsIgnoreCase("Concluída") && !st.equalsIgnoreCase("Arquivada")) { %>
                            <a href="solicitar_participacao.jsp?demandaId=<%= d.getId() %>" class="btn btn-success">
                                Assumir Demanda
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        <%  } 
        } %>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
