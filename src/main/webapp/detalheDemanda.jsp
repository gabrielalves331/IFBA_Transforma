<%@page import="br.edu.ifba.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // SIMULAÇÃO: Mude para 'true' para testar como a tela fica após o aluno assumir a demanda
    boolean demandaAssumida = false; 
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Demanda - IFBA Transforma</title>

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
        
        <!-- BOTÃO VOLTAR E CABEÇALHO DA PÁGINA -->
        <div class="d-flex align-items-center mb-4 gap-3">
            <a href="buscarDemandas.jsp" class="btn btn-outline-secondary btn-sm px-3">&larr; Voltar para Busca</a>
            <h1 class="page-title m-0" style="font-size: var(--fs-xl);">Especificação da Demanda</h1>
        </div>

        <!-- CONTAINER DO CARD DA DEMANDA -->
        <div class="card-painel">
            
            <!-- CABEÇALHO DO CARD -->
            <div class="border-bottom pb-3 mb-4">
                <h2 style="font-size: var(--fs-lg); font-weight: var(--fw-bold); color: var(--color-primary);" class="m-0">
                    Sistema para Gestão de Eventos
                </h2>
            </div>

            <!-- METADADOS RÁPIDOS -->
            <div class="row mb-4 border-bottom pb-3 g-3">
                <div class="col-md-4">
                    <span class="text-muted small d-block mb-1">ÁREA DE ATUAÇÃO</span>
                    <strong class="text-dark">Tecnologia da Informação</strong>
                </div>
                <div class="col-md-4">
                    <span class="text-muted small d-block mb-1">STATUS DA SOLICITAÇÃO</span>
                    <% if (demandaAssumida) { %>
                        <span class="badge-status concluido">Assumida</span>
                    <% } else { %>
                        <span class="badge-status pendente">Em Análise</span>
                    <% } %>
                </div>
                <div class="col-md-4">
                    <span class="text-muted small d-block mb-1">PRAZO ESTIMADO</span>
                    <strong class="text-dark">30/12/2026</strong>
                </div>
            </div>

            <!-- DETALHAMENTO DA DEMANDA -->
            <div class="mb-4">
                <h3 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-primary);" class="mb-2">
                    Descrição da Necessidade
                </h3>
                <p class="text-secondary mb-0">
                    Necessidade de um sistema para gerenciamento de eventos comunitários.
                </p>
            </div>

            <div class="mb-4">
                <h3 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-primary);" class="mb-2">
                    Contexto Social / Justificativa
                </h3>
                <p class="text-secondary mb-0">
                    A organização realiza eventos mensais e não possui ferramenta de controle, dependendo de planilhas manuais propensas a erros.
                </p>
            </div>

            <div class="mb-4">
                <h3 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-primary);" class="mb-2">
                    Impacto Comunitário Esperado
                </h3>
                <p class="text-secondary mb-0">
                    Maior organização, transparência e alcance das ações comunitárias na região de Camaçari - BA.
                </p>
            </div>

            <div class="mb-4">
                <span class="text-muted small d-block mb-1">LOCALIDADE DA EXECUÇÃO</span>
                <span class="fw-semibold text-dark">Camaçari - BA</span>
            </div>

            <hr class="my-4" style="border-color: var(--color-border);">

            <!-- INTERAÇÃO DINÂMICA DE BOTÕES -->
            <div class="d-flex gap-2 flex-wrap">
                <% if (!demandaAssumida) { %>
                    <!-- Se NÃO assumiu, exibe o botão padrão -->
                    <a href="AssumirDemandaServlet?id=1" class="btn btn-primary px-4 py-2 fw-bold">
                        Assumir Demanda Social
                    </a>
                <% } else { %>
                    <!-- Se ASSUMIU, exibe opções de ação -->
                    <a href="analisarDemanda.jsp?id=1" class="btn btn-primary px-4 py-2 fw-bold">
                        Analisar Demanda
                    </a>
                    <a href="DesistirDemandaServlet?id=1" class="btn btn-outline-danger px-4 py-2 fw-bold">
                        Desistir da Demanda
                    </a>
                <% } %>
            </div>

        </div>
    </main>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>