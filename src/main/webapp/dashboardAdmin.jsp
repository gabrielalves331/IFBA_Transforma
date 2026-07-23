<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifba.model.Usuario" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Administrativo - IFBA Transforma</title>
    <!-- Bootstrap para componentes, tabelas e utilitários de espaçamento -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f6f8;
        }

        /* SIDEBAR ATUALIZADA - FIGMA */
        .sidebar {
            width: 260px;
            height: 100vh;
            position: fixed;
            background-color: #1a5c38; /* Verde escuro institucional */
            color: white;
            padding: 30px 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            z-index: 1000;
        }

        .sidebar-top .logo-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar-top .logo-img {
            max-width: 100px;
            height: auto;
            mix-blend-mode: screen;
        }

        .sidebar h2 {
            font-size: 1.4rem;
            font-weight: bold;
            margin-top: 0;
            margin-bottom: 40px;
            text-align: center;
            letter-spacing: 0.5px;
        }

        .sidebar-menu a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 12px 5px;
            font-size: 0.95rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            transition: opacity 0.2s;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            opacity: 0.8;
            font-weight: bold;
        }

        /* BOTÃO SAIR ESTILO PÍLULA MINT */
        .btn-sair-container {
            margin-bottom: 10px;
        }

        .btn-sair {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #cce5d8;
            color: #1a5c38;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 0.95rem;
            transition: background-color 0.2s;
        }

        .btn-sair:hover {
            background-color: #b3d7c3;
        }

        /* CONTEÚDO */
        .content {
            margin-left: 260px;
            padding: 35px;
        }

        .content h1 {
            font-size: 2.2rem;
            color: #222222;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            margin-top: 30px;
        }

        .card-painel {
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            border: none;
        }

        .card-painel h2 {
            font-size: 1.15rem;
            color: #444444;
            margin-top: 0;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .chart-container {
            height: 260px;
        }

        .usuarios {
            margin-top: 35px;
        }

        /* customizações sobre a tabela do bootstrap */
        .table th {
            background-color: #1a5c38 !important;
            color: white !important;
            font-weight: bold;
            border: none;
        }

        .table td {
            font-size: 0.95rem;
        }

        /* Inputs inline sutilmente arredondados e responsivos */
        .input-inline {
            width: 100%;
            padding: 7px 10px;
            border: 2px solid #e5e5e5;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 0.9rem;
            transition: border-color 0.2s;
        }

        .input-inline:focus {
            border-color: #1a5c38;
            outline: none;
        }

        /* Sobrescrita leve para botões pequenos de ação */
        .btn-sm-custom {
            padding: 6px 12px;
            font-size: 0.85rem;
            font-weight: bold;
            border-radius: 6px;
        }
    </style>
</head>
<body>

    <jsp:include page="sidebar.jsp" />
        <div class="btn-sair-container">
            <a href="index.jsp" class="btn-sair">
                <span>Sair</span>
            </a>
        </div>
    </div>

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        <h1>Painel Administrativo</h1>
        <p class="text-muted">Visão geral e gerência da plataforma IFBA Transforma</p>

        <div class="dashboard-grid">
            <!-- GRÁFICOS -->
            <div class="card-painel">
                <h2>Usuários por tipo</h2>
                <div class="chart-container">
                    <canvas id="graficoUsuarios"></canvas>
                </div>
            </div>

            <div class="card-painel">
                <h2>Demandas por status</h2>
                <div class="chart-container">
                    <canvas id="graficoDemandas"></canvas>
                </div>
            </div>

            <div class="card-painel">
                <h2>Projetos concluídos por ano</h2>
                <div class="chart-container">
                    <canvas id="graficoProjetos"></canvas>
                </div>
            </div>
        </div>

        <!-- TABELA DE USUÁRIOS COM CADASTRO INLINE -->
        <div class="card-painel usuarios">
            <h2 class="mb-3">Usuários cadastrados</h2>
            
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th style="width: 15%; border-top-left-radius: 8px;">ID / Matrícula</th>
                            <th style="width: 23%;">Nome</th>
                            <th style="width: 23%;">E-mail</th>
                            <th style="width: 17%;">Tipo de Usuário</th>
                            <th style="width: 10%;">Senha</th>
                            <th style="width: 12%; border-top-right-radius: 8px;">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- LINHA FORMULÁRIO DE INSERÇÃO RÁPIDA -->
                        <tr class="table-light" style="border-bottom: 2px solid #eef0f3;">
                            <form action="CadastrarUsuarioAdminServlet" method="POST">
                                <td>
                                    <input type="text" name="id" class="input-inline" placeholder="Ex: 20261" required>
                                </td>
                                <td>
                                    <input type="text" name="nome" class="input-inline" placeholder="Nome do usuário" required>
                                </td>
                                <td>
                                    <input type="email" name="email" class="input-inline" placeholder="nome@ifba.edu.br" required>
                                </td>
                                <td>
                                    <select name="tipo" class="input-inline" style="padding: 7px 5px;" required>
                                        <option value="Estudante">Aluno</option>
                                        <option value="Professor Orientador">Professor</option>
                                        <option value="Comunidade Interna">Comunidade Int.</option>
                                        <option value="Comunidade Externa">Comunidade Ext.</option>
                                        <option value="Administrador">Admin</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="password" name="senha" class="input-inline" placeholder="Senha" required>
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-success w-100 btn-sm-custom shadow-sm">+ Criar</button>
                                </td>
                            </form>
                        </tr>

                        <%
                        List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                        if (usuarios != null && !usuarios.isEmpty()) {
                            for (Usuario u : usuarios) {
                        %>
                        <tr>
                            <td class="fw-bold text-secondary"><%= u.getId() %></td>
                            <td class="fw-semibold text-dark"><%= u.getNome() %></td>
                            <td class="text-muted"><%= u.getEmail() %></td>
                            <td>
                                <span class="badge bg-light text-dark border px-2 py-1.5"><%= u.getTipo() %></span>
                            </td>
                            <td class="text-black-50">••••••••</td>
                            <td>
                                <!-- Container flexbox com gap-2 impede que os botões fiquem colados -->
                                <div class="d-flex gap-2">
                                    <button class="btn btn-warning text-dark btn-sm-custom flex-grow-1 shadow-sm"
        data-bs-toggle="modal" 
        data-bs-target="#modalEditarUsuario"
        data-id="<%= u.getId() %>"
        data-nome="<%= u.getNome() %>"
        data-email="<%= u.getEmail() %>"
        data-tipo="<%= u.getTipo() %>">
    Editar
</button>
                                    <button class="btn btn-danger btn-sm-custom flex-grow-1 shadow-sm">Excluir</button>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="6" class="text-center text-muted py-4">Nenhum usuário listado no momento.</td>
                        </tr>
                        <%
                        }
                        %>
                        
                        <!-- MODAL DE EDIÇÃO DE USUÁRIO -->
    <div class="modal fade" id="modalEditarUsuario" tabindex="-1" aria-labelledby="modalEditarUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 12px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.1);">
                <div class="modal-header" style="background-color: #1a5c38; color: white; border-top-left-radius: 12px; border-top-right-radius: 12px;">
                    <h5 class="modal-title fw-bold" id="modalEditarUsuarioLabel">Editar Perfil do Usuário</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <!-- Form envia para a Servlet encarregada da atualização -->
                    <form action="EditarUsuarioAdminServlet" method="POST">
                        
                        <!-- ID/Matrícula fica readonly para o admin saber quem está editando e a Servlet usar no WHERE -->
                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary">ID / Matrícula</label>
                            <input type="text" id="editId" name="id" class="form-control" readonly style="background-color: #f8f9fa; border: 2px solid #e5e5e5; border-radius: 8px; font-weight: bold;">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary">Nome Completo</label>
                            <input type="text" id="editNome" name="nome" class="form-control" required style="border: 2px solid #e5e5e5; border-radius: 8px;">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary">E-mail Institucional</label>
                            <input type="email" id="editEmail" name="email" class="form-control" required style="border: 2px solid #e5e5e5; border-radius: 8px;">
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold text-secondary">Tipo de Usuário</label>
                            <select id="editTipo" name="tipo" class="form-select" required style="border: 2px solid #e5e5e5; border-radius: 8px;">
                                <option value="Estudante">Aluno</option>
                                <option value="Professor Orientador">Professor</option>
                                <option value="Comunidade Interna">Comunidade Int.</option>
                                <option value="Comunidade Externa">Comunidade Ext.</option>
                                <option value="Administrador">Admin</option>
                            </select>
                        </div>

                        <div class="d-flex justify-content-end gap-2 pt-3 border-top">
                            <button type="button" class="btn btn-secondary fw-bold px-3" style="border-radius: 8px;" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn text-white fw-bold px-4" style="background-color: #1a5c38; border-radius: 8px;">Salvar Alterações</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- SCRIPT PARA POPULAR O MODAL DINAMICAMENTE -->
    <script>
        const modalEditar = document.getElementById('modalEditarUsuario');
        if (modalEditar) {
            modalEditar.addEventListener('show.bs.modal', event => {
                // Botão que disparou o modal
                const button = event.relatedTarget;
                
                // Extrai as informações dos atributos data-bs-*
                const id = button.getAttribute('data-id');
                const nome = button.getAttribute('data-nome');
                const email = button.getAttribute('data-email');
                const tipo = button.getAttribute('data-tipo');
                
                // Alimenta os inputs correspondentes dentro do modal
                document.getElementById('editId').value = id;
                document.getElementById('editNome').value = nome;
                document.getElementById('editEmail').value = email;
                document.getElementById('editTipo').value = tipo;
            });
        }
    </script>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

<%
Map<String, Integer> usuariosPorTipo = (Map<String, Integer>) request.getAttribute("usuariosPorTipo");
Map<String, Integer> demandasPorStatus = (Map<String, Integer>) request.getAttribute("demandasPorStatus");
Map<Integer, Integer> projetosPorAno = (Map<Integer, Integer>) request.getAttribute("projetosPorAno");

String[] ordemTipos = {"Estudante", "Professor Orientador", "Comunidade Interna", "Comunidade Externa", "Administrador"};
String[] nomesExibicao = {"Aluno", "Professor Orientador", "Comunidade Interna", "Comunidade Externa", "Administrador"};
%>

<script>
    /* Scripts do Chart.js intocados para manter a integridade dos dados */
    const usuariosLabels = [ <% for (String nome : nomesExibicao) { %> "<%= nome %>", <% } %> ];
    const usuariosValores = [ <% for (String tipo : ordemTipos) { %> <%= usuariosPorTipo != null ? usuariosPorTipo.getOrDefault(tipo, 0) : 0 %>, <% } %> ];

    const demandasLabels = [ <% if(demandasPorStatus != null) { for (String status : demandasPorStatus.keySet()) { %> "<%= status %>", <% } } %> ];
    const demandasValores = [ <% if(demandasPorStatus != null) { for (Integer quantidade : demandasPorStatus.values()) { %> <%= quantidade %>, <% } } %> ];

    const projetosLabels = [ <% if(projetosPorAno != null) { for (Integer ano : projetosPorAno.keySet()) { %> "<%= ano %>", <% } } %> ];
    const projetosValores = [ <% if(projetosPorAno != null) { for (Integer quantidade : projetosPorAno.values()) { %> <%= quantidade %>, <% } } %> ];

    new Chart(document.getElementById("graficoUsuarios"), {
        type: "doughnut",
        data: { labels: usuariosLabels, datasets: [{ data: usuariosValores }] },
        options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { position: "bottom", labels: { boxWidth: 12, padding: 12 } } } }
    });

    new Chart(document.getElementById("graficoDemandas"), {
        type: "bar",
        data: { labels: demandasLabels, datasets: [{ label: "Demandas", data: demandasValores, backgroundColor: "#1a5c38" }] },
        options: { responsive: true, maintainAspectRatio: false }
    });

    new Chart(document.getElementById("graficoProjetos"), {
        type: "line",
        data: { labels: projetosLabels, datasets: [{ label: "Projetos", data: projetosValores, borderColor: "#1a5c38", tension: 0.3 }] },
        options: { responsive: true, maintainAspectRatio: false }
    });
</script>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>