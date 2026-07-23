<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifba.model.Demanda" %> <!-- Import ativado! -->

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Minhas Demandas - IFBA Transforma</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f6f8;
        }

        /* CONTEÚDO PRINCIPAL */
        .content {
            margin-left: 260px;
            padding: 35px;
            width: calc(100% - 260px);
            box-sizing: border-box;
        }

        .content h1 {
            font-size: 2.2rem;
            color: #222222;
            font-weight: bold;
            margin-bottom: 5px;
        }

        /* CARDS DE DEMANDAS */
        .card-demanda {
            background-color: white;
            border-radius: 12px;
            border: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform 0.2s, box-shadow 0.2s;
            height: 100%;
            display: flex;
            flex-direction: column;
            border-left: 5px solid #1a5c38;
        }

        .card-demanda:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .card-body-custom {
            padding: 25px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .demanda-titulo {
            font-size: 1.25rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .demanda-info {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 5px;
        }

        /* BADGES DE STATUS */
        .badge-status {
            font-size: 0.85rem;
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            align-self: flex-start;
            margin-bottom: 15px;
        }
        
        .status-andamento { background-color: #fff3cd; color: #856404; }
        .status-concluida { background-color: #d4edda; color: #155724; }
        .status-pendente { background-color: #f8d7da; color: #721c24; }

        /* BOTÕES */
        .btn-verde {
            background-color: #1a5c38;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            padding: 8px 15px;
            transition: background-color 0.2s;
        }

        .btn-verde:hover {
            background-color: #13472a;
            color: white;
        }

        /* CSS DA BARRA LATERAL */
        .sidebar {
            width: 260px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background-color: #1a5c38;
            color: white;
            padding: 30px 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            z-index: 1000;
        }

        .sidebar-top .logo-container { text-align: center; margin-bottom: 20px; }
        .sidebar-top .logo-img { max-width: 200px; height: auto; }
        .sidebar h2 { font-size: 1.4rem; font-weight: bold; margin-top: 0; margin-bottom: 40px; text-align: center; }
        .sidebar-menu a { display: block; color: white; text-decoration: none; padding: 12px 5px; font-size: 0.95rem; border-bottom: 1px solid rgba(255, 255, 255, 0.2); }
        .sidebar-menu a:hover { opacity: 0.8; font-weight: bold; }
        .btn-sair-container { margin-bottom: 10px; }
        .btn-sair { display: flex; align-items: center; justify-content: center; background-color: #cce5d8; color: #1a5c38; text-decoration: none; padding: 12px 20px; border-radius: 8px; font-weight: bold; }
    </style>
</head>
<body>

    <!-- INCLUI A SIDEBAR UNIFICADA -->
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        <h1>Minhas Demandas</h1>
        <p class="text-muted">Projetos e solicitações em que você atua como Professor Orientador.</p>
        <!-- Coloque isso logo acima dos filtros no seu minhasDemandas.jsp -->
<div class="d-flex justify-content-between align-items-center mt-3">
    <p class="text-muted m-0">Projetos e solicitações em que você atua como Professor Orientador.</p>
    <a href="novaDemanda.jsp" class="btn btn-verde">+ Nova Demanda</a>
</div>

        <!-- FILTROS -->
        <div class="d-flex justify-content-between align-items-center mt-4 mb-4">
            <input type="text" class="form-control w-25" placeholder="Pesquisar demanda..." style="border-radius: 8px;">
            <select class="form-select w-25" style="border-radius: 8px;">
                <option value="">Todos os status</option>
                <option value="Em Andamento">Em Andamento</option>
                <option value="Concluída">Concluídas</option>
            </select>
        </div>

        <!-- GRID DE DEMANDAS (Adicionado de volta para estruturar os cards) -->
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <% 
            List<Demanda> minhasDemandas = (List<Demanda>) request.getAttribute("minhasDemandas");
            if(minhasDemandas != null && !minhasDemandas.isEmpty()) {
                for(Demanda d : minhasDemandas) {
            %>
            <!-- CARD DINÂMICO -->
            <div class="col">
                <div class="card-demanda">
                    <div class="card-body-custom">
                        <span class="badge-status status-andamento"><%= d.getStatus() != null ? d.getStatus() : "Sem Status" %></span>
                        <h3 class="demanda-titulo"><%= d.getTitulo() %></h3>
                        <p class="demanda-info"><strong>Proponente:</strong> <%= d.getDescDemandante() %></p>
                        <p class="demanda-info mt-2 text-muted" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                            <%= d.getDescricao() %>
                        </p>
                        
                        <div class="mt-auto pt-3 d-flex gap-2">
                            <button class="btn btn-verde flex-grow-1" data-bs-toggle="modal" data-bs-target="#modalGerenciar">Gerenciar</button>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                } 
            } else { 
            %>
            <!-- MENSAGEM VAZIA -->
            <div class="col-12 text-center mt-5">
                <p class="text-muted fs-5">Você ainda não está orientando nenhuma demanda no momento.</p>
            </div>
            <% } %>
        </div> <!-- FECHA A GRID DE DEMANDAS -->
    </main>

    <!-- MODAL DE GERENCIAMENTO -->
    <div class="modal fade" id="modalGerenciar" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 12px; border: none;">
                <div class="modal-header" style="background-color: #1a5c38; color: white;">
                    <h5 class="modal-title fw-bold">Gerenciar Demanda</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <form action="AtualizarDemandaServlet" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Atualizar Status</label>
                            <select name="status" class="form-select">
                                <option value="Em Andamento">Em Andamento</option>
                                <option value="Aguardando Validação">Aguardando Validação</option>
                                <option value="Concluída">Concluída</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Anotações do Orientador</label>
                            <textarea class="form-control" rows="4" placeholder="Registre o progresso semanal da equipe..."></textarea>
                        </div>
                        <div class="d-flex justify-content-end gap-2">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-verde">Salvar Atualização</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>