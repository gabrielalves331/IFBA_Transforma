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
    <title>Buscar Demandas - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
</head>
<body>
<jsp:include page="sidebar.jsp" />

<!-- CONTEÚDO PRINCIPAL -->
<div class="content">

    <h2 class="mb-4 text-dark fw-bold">Buscar Demandas Sociais</h2>

    <!-- PAINEL DE FILTROS -->
    <div class="card card-custom p-4 mb-4">
        <h5 class="text-muted mb-3" style="font-size: 1rem;">Filtros de Pesquisa</h5>
        <form action="BuscarDemandasServlet" method="GET">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <label class="form-label text-secondary small fw-bold">Área de Atuação</label>
                    <select class="form-select">
                        <option>Todas</option>
                        <option>Tecnologia</option>
                        <option>Educação</option>
                        <option>Turismo</option>
                        <option>Gestão</option>
                    </select>
                </div>

                <div class="col-md-4 mb-3">
                    <label class="form-label text-secondary small fw-bold">Status da Demanda</label>
                    <select class="form-select">
                        <option>Todos</option>
                        <option>Submetida</option>
                        <option>Em análise</option>
                        <option>Assumida</option>
                        <option>Concluída</option>
                    </select>
                </div>

                <div class="col-md-4 mb-3">
                    <label class="form-label text-secondary small fw-bold">Localidade / Comunidade</label>
                    <input type="text" class="form-control" placeholder="Ex: Bairro, Ong, Associação...">
                </div>
            </div>

            <button type="submit" class="btn btn-green px-4 mt-2 fw-bold">
                Pesquisar Demandas
            </button>
        </form>
    </div>

    <!-- LISTAGEM DE DEMANDAS -->
    <h5 class="text-secondary mb-3">Resultados Encontrados</h5>

    <!-- EXEMPLO 1: DEMANDA DISPONÍVEL (Ainda não assumida) -->
    <div class="card card-custom mb-3 p-3">
        <div class="card-body p-1">
            <div class="d-flex justify-content-between align-items-start flex-wrap">
                <div>
                    <h5 class="fw-bold text-dark mb-1">Sistema para Gestão de Eventos Acadêmicos</h5>
                    <p class="mb-2 text-muted small">
                        Área: <span class="text-dark fw-semibold">Tecnologia</span> | 
                        Local: <span class="text-dark fw-semibold">Campus Central</span>
                    </p>
                    <span class="badge bg-secondary px-2 py-1">Em Análise</span>
                </div>
                
                <div class="mt-3 mt-md-0">
                    <!-- Botão Padrão para ver detalhes/assumir -->
                    <a href="detalheDemanda.jsp?id=1" class="btn btn-outline-green px-4">
                        Ver Detalhes
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- EXEMPLO 2: DEMANDA QUE JÁ FOI ASSUMIDA POR ESTE ESTUDANTE -->
    <div class="card card-custom mb-3 p-3" style="border-left: 5px solid #195e3d;">
        <div class="card-body p-1">
            <div class="d-flex justify-content-between align-items-start flex-wrap">
                <div>
                    <h5 class="fw-bold text-dark mb-1">Plataforma Web: Site para Doações</h5>
                    <p class="mb-2 text-muted small">
                        Área: <span class="text-dark fw-semibold">Tecnologia</span> | 
                        Local: <span class="text-dark fw-semibold">Associação de Moradores</span>
                    </p>
                    <span class="badge bg-success px-2 py-1">Assumida por Você</span>
                </div>
                
                <!-- REGRA SOLICITADA: Mudança de botões ao assumir a demanda -->
                <div class="mt-3 mt-md-0 d-flex gap-2">
                    <a href="analisarDemanda.jsp?id=2" class="btn btn-success px-3" style="background-color: #195e3d; border: none;">
                        Analisar Demanda
                    </a>
                    <a href="DesistirDemandaServlet?id=2" class="btn btn-outline-danger px-3">
                        Desistir da Demanda
                    </a>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>