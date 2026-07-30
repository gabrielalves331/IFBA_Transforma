<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifba.model.Demanda" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Demandas - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- INCLUI A SIDEBAR UNIFICADA -->
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        
        <!-- CABEÇALHO DA PÁGINA COM BOTÃO DE AÇÃO -->
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
            <div>
                <h1 class="page-title m-0">Minhas Demandas</h1>
                <p class="subtitulo mb-0">Projetos e solicitações em que você atua como Professor Orientador.</p>
            </div>
            <div>
                <a href="novaDemanda.jsp" class="btn btn-primary fw-bold px-4" style="border-radius: var(--radius-md);">
                    + Nova Demanda
                </a>
            </div>
        </div>

        <!-- FILTROS DE PESQUISA -->
        <div class="d-flex flex-column flex-sm-row justify-content-between align-items-stretch align-items-sm-center gap-3 mb-4">
            <input type="text" class="form-control w-100 w-sm-50" placeholder="Pesquisar demanda..." style="border-radius: var(--radius-md); border-color: var(--color-border);">
            <select class="form-select w-100 w-sm-25" style="border-radius: var(--radius-md); border-color: var(--color-border);">
                <option value="">Todos os status</option>
                <option value="Em Andamento">Em Andamento</option>
                <option value="Concluída">Concluídas</option>
            </select>
        </div>

        <!-- GRID DE DEMANDAS -->
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <% 
            List<Demanda> minhasDemandas = (List<Demanda>) request.getAttribute("minhasDemandas");
            if(minhasDemandas != null && !minhasDemandas.isEmpty()) {
                for(Demanda d : minhasDemandas) {
            %>
            <!-- CARD DINÂMICO -->
            <div class="col">
                <div class="card-painel h-100 d-flex flex-column p-4" style="border-radius: var(--radius-md);">
                    <div class="mb-2">
                        <span class="badge bg-success bg-opacity-10 text-success px-2 py-1 fw-bold" style="font-size: 0.75rem; border-radius: 4px;">
                            <%= d.getStatus() != null ? d.getStatus() : "Sem Status" %>
                        </span>
                    </div>
                    
                    <h3 class="fw-bold text-dark mb-2" style="font-size: var(--fs-md);"><%= d.getTitulo() %></h3>
                    
                    <p class="text-secondary small mb-2"><strong>Proponente:</strong> <%= d.getDescDemandante() %></p>
                    
                    <p class="text-muted small mb-4" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                        <%= d.getDescricao() %>
                    </p>
                    
                    <div class="mt-auto pt-2">
                        <button class="btn btn-primary w-100 fw-bold" data-bs-toggle="modal" data-bs-target="#modalGerenciar" style="border-radius: var(--radius-md);">
                            Gerenciar
                        </button>
                    </div>
                </div>
            </div>
            <% 
                } 
            } else { 
            %>
            <!-- MENSAGEM VAZIA -->
            <div class="col-12 text-center mt-5 py-5">
                <div class="card-painel p-5">
                    <p class="text-muted fs-5 mb-0">Você ainda não está orientando nenhuma demanda no momento.</p>
                </div>
            </div>
            <% } %>
        </div> 
    </main>

    <!-- MODAL DE GERENCIAMENTO -->
    <div class="modal fade" id="modalGerenciar" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: var(--radius-md); border: none; overflow: hidden;">
                <div class="modal-header text-white" style="background-color: var(--color-primary);">
                    <h5 class="modal-title fw-bold">Gerenciar Demanda</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <form action="AtualizarDemandaServlet" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-secondary">Atualizar Status</label>
                            <select name="status" class="form-select" style="border-radius: var(--radius-md); border-color: var(--color-border);">
                                <option value="Em Andamento">Em Andamento</option>
                                <option value="Aguardando Validação">Aguardando Validação</option>
                                <option value="Concluída">Concluída</option>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold small text-secondary">Anotações do Orientador</label>
                            <textarea class="form-control" rows="4" placeholder="Registre o progresso semanal da equipe..." style="border-radius: var(--radius-md); border-color: var(--color-border);"></textarea>
                        </div>
                        <div class="d-flex justify-content-end gap-2">
                            <button type="button" class="btn btn-outline-secondary fw-bold px-3" data-bs-dismiss="modal" style="border-radius: var(--radius-md);">Cancelar</button>
                            <button type="submit" class="btn btn-primary fw-bold px-4" style="border-radius: var(--radius-md);">Salvar Atualização</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>