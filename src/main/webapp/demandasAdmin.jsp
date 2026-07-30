<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Gerenciar Demandas - IFBA Transforma</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        :root {
            --color-primary: #1a5c38;
            --color-primary-dark: #13472a;
            --color-primary-light: #cce5d8;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f6f8;
            min-height: 100vh;
        }

        /* FIX DA SIDEBAR */
        .sidebar {
            width: 260px;
            min-width: 260px;
            min-height: 100vh;
            background-color: var(--color-primary-light) !important;
            border-right: 1px solid #dee2e6;
        }

        /* Estilização dos Links da Sidebar */
        .sidebar .nav-link {
            color: var(--color-primary) !important;
            border-radius: 8px;
            transition: all 0.2s ease-in-out;
        }

        .sidebar .nav-link:hover {
            background-color: var(--color-primary) !important;
            color: #ffffff !important;
        }

        /* CONTEÚDO PRINCIPAL (Flexbox ajustado) */
        .content {
            flex-grow: 1; /* Ocupa todo o resto da tela */
            padding: 35px;
            /* REMOVIDO: margin-left: 260px que quebrava o layout */
        }

        .content h1 {
            font-size: 2.2rem;
            color: #222222;
            font-weight: bold;
            margin-bottom: 5px;
        }

        /* GRID DOS CARDS DE ÁREAS */
        .areas-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 30px;
            align-items: start;
        }

        .area-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            padding: 25px;
            border: 2px solid transparent;
            transition: border-color 0.2s, transform 0.2s;
            position: relative;
        }

        .area-card:hover {
            border-color: var(--color-primary);
        }

        .area-card h3 {
            font-size: 1.2rem;
            color: #222222;
            font-weight: bold;
            margin-bottom: 10px;
            padding-right: 45px;
        }

        .demandas-count {
            font-size: 0.9rem;
            color: #666666;
            background-color: #f0f2f5;
            padding: 4px 10px;
            border-radius: 20px;
            display: inline-block;
        }

        /* BOTÃO EXPANDIR (+) */
        .btn-expandir {
            position: absolute;
            top: 25px;
            right: 25px;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: var(--color-primary);
            color: white;
            border: none;
            font-size: 1.4rem;
            line-height: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.2s, transform 0.3s ease;
            z-index: 5;
            padding-bottom: 4px;
        }

        .btn-expandir:hover {
            background-color: var(--color-primary-dark);
        }

        .btn-expandir:not(.collapsed) {
            transform: rotate(45deg);
            background-color: #dc3545;
        }

        /* LISTA EXPANSÍVEL */
        .demandas-lista {
            margin-top: 20px;
            border-top: 1px solid #eeeeee;
            padding-top: 15px;
        }

        .demanda-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-radius: 8px;
            background-color: #f8f9fa;
            margin-bottom: 8px;
            transition: background-color 0.2s;
        }

        .demanda-item:hover {
            background-color: #f1f3f5;
        }

        .demanda-titulo {
            font-size: 0.95rem;
            font-weight: 600;
            color: #333333;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 180px;
        }

        .btn-acao-sm {
            padding: 4px 10px;
            font-size: 0.8rem;
            font-weight: bold;
            border-radius: 6px;
            border: none;
            cursor: pointer;
        }

        .btn-detalhes {
            background-color: var(--color-primary-light);
            color: var(--color-primary);
        }

        .btn-detalhes:hover {
            background-color: #b3d7c3;
        }
    </style>
</head>
<body class="d-flex">

    <!-- IMPORTAÇÃO DA SIDEBAR -->
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        <h1>Gerenciar Demandas</h1>
        <p class="text-muted">Explore as demandas submetidas pela sociedade separadas por área de atuação.</p>

        <!-- CONTAINER DO ACCORDION -->
        <div class="areas-grid" id="accordionDemandas">
            
            <!-- CARD: TECNOLOGIA DA INFORMAÇÃO -->
            <div class="area-card">
                <h3>Tecnologia da Informação</h3>
                <span class="demandas-count">2 Demandas ativas</span>
                
                <button class="btn-expandir collapsed" type="button" 
                        data-bs-toggle="collapse" 
                        data-bs-target="#listaTI" 
                        aria-expanded="false" 
                        aria-controls="listaTI">+</button>
                
                <div class="collapse demandas-lista" id="listaTI" data-bs-parent="#accordionDemandas">
                    <div class="demanda-item">
                        <span class="demanda-titulo">Site para ONG local</span>
                        <button class="btn-acao-sm btn-detalhes" data-bs-toggle="modal" data-bs-target="#modalDetalhesDemanda">Ver Detalhes</button>
                    </div>
                    <div class="demanda-item">
                        <span class="demanda-titulo">App de Coleta Seletiva</span>
                        <button class="btn-acao-sm btn-detalhes" data-bs-toggle="modal" data-bs-target="#modalDetalhesDemanda">Ver Detalhes</button>
                    </div>
                </div>
            </div>

            <!-- CARD: INFRAESTRUTURA / EDIFICAÇÕES -->
            <div class="area-card">
                <h3>Infraestrutura e Edificações</h3>
                <span class="demandas-count">1 Demanda ativa</span>
                
                <button class="btn-expandir collapsed" type="button" 
                        data-bs-toggle="collapse" 
                        data-bs-target="#listaInfra" 
                        aria-expanded="false" 
                        aria-controls="listaInfra">+</button>
                
                <div class="collapse demandas-lista" id="listaInfra" data-bs-parent="#accordionDemandas">
                    <div class="demanda-item">
                        <span class="demanda-titulo">Reforma de Praça Comunitária</span>
                        <button class="btn-acao-sm btn-detalhes" data-bs-toggle="modal" data-bs-target="#modalDetalhesDemanda">Ver Detalhes</button>
                    </div>
                </div>
            </div>

            <!-- CARD: AUTOMAÇÃO / ENERGIA -->
            <div class="area-card">
                <h3>Automação e Energia</h3>
                <span class="demandas-count">0 Demandas</span>
                
                <button class="btn-expandir collapsed" type="button" 
                        data-bs-toggle="collapse" 
                        data-bs-target="#listaEletrica" 
                        aria-expanded="false" 
                        aria-controls="listaEletrica">+</button>
                
                <div class="collapse demandas-lista" id="listaEletrica" data-bs-parent="#accordionDemandas">
                    <p class="text-muted mt-2 text-center" style="font-size: 0.85rem;">Nenhuma demanda cadastrada para esta área.</p>
                </div>
            </div>

        </div>
    </main>

    <!-- MODAL DE DETALHES -->
    <div class="modal fade" id="modalDetalhesDemanda" tabindex="-1" aria-labelledby="modalDetalhesLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content" style="border-radius: 12px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.1);">
                <div class="modal-header" style="background-color: #1a5c38; color: white; border-top-left-radius: 12px; border-top-right-radius: 12px;">
                    <h5 class="modal-title fw-bold" id="modalDetalhesLabel">Detalhes da Demanda</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <form action="EditarDemandaServlet" method="POST">
                        <input type="hidden" name="demandaId" value="1">

                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary">Título da Demanda</label>
                            <input type="text" name="titulo" class="form-control" value="Site Institucional para ONG local" style="border: 2px solid #e5e5e5; border-radius: 8px;">
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold text-secondary">Proponente / Organização</label>
                                <input type="text" name="proponente" class="form-control" value="Associação de Moradores" style="border: 2px solid #e5e5e5; border-radius: 8px;">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold text-secondary">Status</label>
                                <select name="status" class="form-select" style="border: 2px solid #e5e5e5; border-radius: 8px;">
                                    <option value="Aberta" selected>Aberta (Aguardando Orientador)</option>
                                    <option value="Em Andamento">Em Andamento</option>
                                    <option value="Concluída">Concluída</option>
                                    <option value="Recusada">Recusada</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold text-secondary">Descrição Completa da Necessidade</label>
                            <textarea name="descricao" class="form-control" rows="4" style="border: 2px solid #e5e5e5; border-radius: 8px;">A instituição precisa de um portal web simples para divulgar suas ações sociais, publicar notícias e receber cadastros de voluntários da comunidade de forma automatizada.</textarea>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mt-4 pt-3 border-top">
                            <button type="button" class="btn btn-danger fw-bold px-4" style="border-radius: 8px;">Excluir Demanda</button>
                            <div>
                                <button type="button" class="btn btn-secondary fw-bold me-2 px-3" style="border-radius: 8px;" data-bs-dismiss="modal">Fechar</button>
                                <button type="submit" class="btn text-white fw-bold px-4" style="background-color: #1a5c38; border-radius: 8px;">Salvar Alterações</button>
                            </div>
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