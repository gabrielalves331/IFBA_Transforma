<%@page import="br.edu.ifba.model.Usuario"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Buscar Demandas - IFBA Transforma</title>
    
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
        <div class="card-painel mb-4">
            <h1 class="page-title mb-1">Buscar Demandas Sociais</h1>
            <p class="subtitulo m-0">Encontre e assuma demandas submetidas pela comunidade para suas ações de extensão.</p>
        </div>

        <!-- PAINEL DE FILTROS -->
        <div class="card-painel mb-4">
            <h3 class="fs-5 mb-3">Filtros de Pesquisa</h3>
            
            <form action="BuscarDemandasServlet" method="GET">
                <div class="row g-3">
                    <div class="col-md-4">
                        <label class="form-label">Área de Atuação</label>
                        <select name="area" class="form-select">
                            <option value="">Todas as áreas</option>
                            <option value="tecnologia">Tecnologia e Inovação</option>
                            <option value="educacao">Educação</option>
                            <option value="saude">Saúde e Bem-estar</option>
                            <option value="meio-ambiente">Meio Ambiente</option>
                            <option value="gestao">Gestão e Negócios</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Status da Demanda</label>
                        <select name="status" class="form-select">
                            <option value="">Todos os status</option>
                            <option value="disponivel">Disponíveis para Assumir</option>
                            <option value="em_analise">Em Análise</option>
                            <option value="assumida">Já Assumidas</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Localidade / Comunidade</label>
                        <input type="text" name="localidade" class="form-control" placeholder="Ex: Bairro Central, ONG, Associação...">
                    </div>
                </div>

                <div class="mt-3 text-end">
                    <button type="submit" class="btn btn-primary px-4">
                        🔍 Pesquisar Demandas
                    </button>
                </div>
            </form>
        </div>

        <!-- LISTAGEM DE RESULTADOS -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="fs-5 m-0">Demandas Encontradas (3)</h3>
            <span class="text-muted small">Exibindo demandas recentes</span>
        </div>

        <!-- DEMANDA 1: DISPONÍVEL -->
        <div class="card-demanda mb-3">
            <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                <div>
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <span class="badge-status concluido">Disponível</span>
                        <span class="badge bg-light text-dark border">Tecnologia</span>
                    </div>
                    <h4 class="fw-bold text-dark mb-1">Sistema para Gestão de Eventos Acadêmicos</h4>
                    <p class="text-muted small mb-0">
                        Solicitante: <strong>Campus Central IFBA</strong> • Publicado em: 10/05/2026
                    </p>
                </div>
                
                <div class="d-flex gap-2">
                    <a href="detalheDemanda.jsp?id=101" class="btn btn-outline-primary fw-bold">
                        Ver Detalhes
                    </a>
                    <a href="assumirDemanda?id=101" class="btn btn-primary fw-bold">
                        Assumir Demanda
                    </a>
                </div>
            </div>
        </div>

        <!-- DEMANDA 2: EM ANÁLISE -->
        <div class="card-demanda mb-3" style="border-left-color: var(--color-warning);">
            <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                <div>
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <span class="badge-status pendente">Em Análise pelo Orientador</span>
                        <span class="badge bg-light text-dark border">Educação</span>
                    </div>
                    <h4 class="fw-bold text-dark mb-1">Oficina de Inclusão Digital para Jovens</h4>
                    <p class="text-muted small mb-0">
                        Solicitante: <strong>Centro Comunitário Esperança</strong> • Publicado em: 08/05/2026
                    </p>
                </div>
                
                <div>
                    <a href="detalheDemanda.jsp?id=101" class="btn btn-outline-primary fw-bold">
                        Ver Detalhes
                    </a>
                    <a href="assumirDemanda?id=101" class="btn btn-primary fw-bold">
                        Assumir Demanda
                    </a>
                </div>
            </div>
        </div>

        <!-- DEMANDA 3: ASSUMIDA PELO ESTUDANTE LOGADO -->
        <div class="card-demanda mb-3">
            <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                <div>
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <span class="badge-status andamento">Assumida por Você</span>
                        <span class="badge bg-light text-dark border">Tecnologia</span>
                    </div>
                    <h4 class="fw-bold text-dark mb-1">Plataforma Web: Site para Doações</h4>
                    <p class="text-muted small mb-0">
                        Solicitante: <strong>Associação de Moradores</strong> • Em andamento desde 01/05/2026
                    </p>
                </div>
                
                <div>
                    <a href="detalhes_projeto.jsp?id=1" class="btn btn-primary fw-bold">
                        Ir para o Projeto →
                    </a>
                </div>
            </div>
        </div>

    </main>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>