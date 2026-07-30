<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifba.model.Usuario" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Administrativo - IFBA Transforma</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Chart.js para renderização dos gráficos -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

    <!-- SIDEBAR IMPORTADA -->
    <jsp:include page="sidebar.jsp" />

    <!-- CONTEÚDO PRINCIPAL -->
    <main class="content">
        <h1 class="page-title">Painel Administrativo</h1>
        <p class="subtitulo mb-4">Visão geral e gerência da plataforma IFBA Transforma</p>

        <!-- GRID DE GRÁFICOS -->
        <div class="dashboard-grid mb-4">
            <div class="card-painel">
                <h2 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-text-primary);" class="mb-3">Usuários por tipo</h2>
                <div class="chart-container">
                    <canvas id="graficoUsuarios"></canvas>
                </div>
            </div>

            <div class="card-painel">
                <h2 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-text-primary);" class="mb-3">Demandas por status</h2>
                <div class="chart-container">
                    <canvas id="graficoDemandas"></canvas>
                </div>
            </div>

            <div class="card-painel">
                <h2 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-text-primary);" class="mb-3">Projetos concluídos por ano</h2>
                <div class="chart-container">
                    <canvas id="graficoProjetos"></canvas>
                </div>
            </div>
        </div>

        <!-- TABELA DE USUÁRIOS COM CADASTRO INLINE -->
        <div class="card-painel usuarios">
            <h2 style="font-size: var(--fs-lg); font-weight: var(--fw-bold);" class="mb-3">Usuários cadastrados</h2>
            
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
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
                        <tr class="table-light" style="border-bottom: 2px solid var(--color-border);">
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
                                    <button type="submit" class="btn btn-primary w-100 btn-sm-custom shadow-sm">+ Criar</button>
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
                    </tbody>
                </table>
            </div>
        </div>

        <!-- MODAL DE EDIÇÃO DE USUÁRIO (POSICIONADO CORRETAMENTE FORA DA TABELA) -->
        <div class="modal fade" id="modalEditarUsuario" tabindex="-1" aria-labelledby="modalEditarUsuarioLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="border-radius: var(--radius-lg); border: none; box-shadow: var(--shadow-lg);">
                    <div class="modal-header" style="background-color: var(--color-primary); color: white; border-top-left-radius: var(--radius-lg); border-top-right-radius: var(--radius-lg);">
                        <h5 class="modal-title fw-bold" id="modalEditarUsuarioLabel">Editar Perfil do Usuário</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4">
                        <form action="EditarUsuarioAdminServlet" method="POST">
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">ID / Matrícula</label>
                                <input type="text" id="editId" name="id" class="form-control" readonly style="background-color: #f8f9fa; border: 1px solid var(--color-border); border-radius: var(--radius-md); font-weight: bold;">
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">Nome Completo</label>
                                <input type="text" id="editNome" name="nome" class="form-control" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">E-mail Institucional</label>
                                <input type="email" id="editEmail" name="email" class="form-control" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-bold text-secondary">Tipo de Usuário</label>
                                <select id="editTipo" name="tipo" class="form-select" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                                    <option value="Estudante">Aluno</option>
                                    <option value="Professor Orientador">Professor</option>
                                    <option value="Comunidade Interna">Comunidade Int.</option>
                                    <option value="Comunidade Externa">Comunidade Ext.</option>
                                    <option value="Administrador">Admin</option>
                                </select>
                            </div>

                            <div class="d-flex justify-content-end gap-2 pt-3 border-top">
                                <button type="button" class="btn btn-secondary fw-bold px-3" style="border-radius: var(--radius-md);" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary fw-bold px-4" style="border-radius: var(--radius-md);">Salvar Alterações</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- PROCESSAMENTO DOS DADOS PARA OS GRÁFICOS -->
    <%
    Map<String, Integer> usuariosPorTipo = (Map<String, Integer>) request.getAttribute("usuariosPorTipo");
    Map<String, Integer> demandasPorStatus = (Map<String, Integer>) request.getAttribute("demandasPorStatus");
    Map<Integer, Integer> projetosPorAno = (Map<Integer, Integer>) request.getAttribute("projetosPorAno");

    String[] ordemTipos = {"Estudante", "Professor Orientador", "Comunidade Interna", "Comunidade Externa", "Administrador"};
    String[] nomesExibicao = {"Aluno", "Professor Orientador", "Comunidade Interna", "Comunidade Externa", "Administrador"};
    %>

    <!-- SCRIPT CHART.JS & MODAL DINÂMICO -->
    <script>
        // Preenchimento Dinâmico do Modal
        const modalEditar = document.getElementById('modalEditarUsuario');
        if (modalEditar) {
            modalEditar.addEventListener('show.bs.modal', event => {
                const button = event.relatedTarget;
                
                const id = button.getAttribute('data-id');
                const nome = button.getAttribute('data-nome');
                const email = button.getAttribute('data-email');
                const tipo = button.getAttribute('data-tipo');
                
                document.getElementById('editId').value = id;
                document.getElementById('editNome').value = nome;
                document.getElementById('editEmail').value = email;
                document.getElementById('editTipo').value = tipo;
            });
        }

        // Gráficos Chart.js
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
            data: { labels: demandasLabels, datasets: [{ label: "Demandas", data: demandasValores, backgroundColor: "#195e3d" }] },
            options: { responsive: true, maintainAspectRatio: false }
        });

        new Chart(document.getElementById("graficoProjetos"), {
            type: "line",
            data: { labels: projetosLabels, datasets: [{ label: "Projetos", data: projetosValores, borderColor: "#195e3d", tension: 0.3 }] },
            options: { responsive: true, maintainAspectRatio: false }
        });
    </script>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>