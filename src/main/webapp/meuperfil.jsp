<%@page import="br.edu.ifba.model.Usuario"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Meu Perfil - IFBA Transforma</title>
    
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
        
        <!-- CABEÇALHO DA PÁGINA -->
        <div class="mb-4">
            <h1 class="page-title m-0">Gerenciar Dados Pessoais</h1>
            <p class="subtitulo mb-0">Atualize suas informações de conta, dados acadêmicos e preferências de segurança.</p>
        </div>

        <!-- CONTAINER DO FORMULÁRIO -->
        <div class="card-painel">
            <form action="AtualizarPerfilServlet" method="POST">
                
                <!-- SEÇÃO 1: INFORMAÇÕES GERAIS -->
                <h2 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-primary);" class="mb-3 border-bottom pb-2">
                    Informações Gerais (Conta)
                </h2>
                <div class="row mb-4 g-3">
                    <div class="col-md-4">
                        <label class="form-label text-muted small fw-bold">CPF / ID (Não alterável)</label>
                        <input type="text" class="form-control bg-light" value="<%= usuario.getId() %>" readonly style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                    </div>
                    <div class="col-md-8">
                        <label for="nome" class="form-label text-muted small fw-bold">Nome Completo</label>
                        <input type="text" id="nome" name="nome" class="form-control" value="<%= usuario.getNome() %>" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                    </div>
                    <div class="col-md-12">
                        <label for="email" class="form-label text-muted small fw-bold">E-mail de Login</label>
                        <input type="email" id="email" name="email" class="form-control" value="<%= usuario.getEmail() %>" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                    </div>
                </div>

                <!-- SEÇÃO 2: ESPECIFICAÇÃO ACADÊMICA -->
                <h2 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-primary);" class="mb-3 border-bottom pb-2">
                    Especificação Acadêmica
                </h2>
                <div class="row mb-4 g-3">
                    <div class="col-md-8">
                        <label for="curso" class="form-label text-muted small fw-bold">Curso Atual</label>
                        <input type="text" id="curso" name="curso" class="form-control" value="Ciência da Computação" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                    </div>
                    <div class="col-md-4">
                        <label for="semestre" class="form-label text-muted small fw-bold">Semestre</label>
                        <input type="number" id="semestre" name="semestre" class="form-control" value="4" min="1" max="12" required style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                    </div>
                </div>

                <!-- SEÇÃO 3: SEGURANÇA -->
                <h2 style="font-size: var(--fs-md); font-weight: var(--fw-bold); color: var(--color-primary);" class="mb-3 border-bottom pb-2">
                    Segurança
                </h2>
                <div class="row mb-4 g-3">
                    <div class="col-md-6">
                        <label for="novaSenha" class="form-label text-muted small fw-bold">Nova Senha (Deixe em branco para manter a atual)</label>
                        <input type="password" id="novaSenha" name="novaSenha" class="form-control" placeholder="********" style="border: 1px solid var(--color-border); border-radius: var(--radius-md);">
                    </div>
                </div>

                <!-- BOTÃO DE AÇÃO -->
                <div class="text-end border-top pt-3">
                    <button type="submit" class="btn btn-primary px-5 fw-bold" style="border-radius: var(--radius-md);">
                        Salvar Alterações
                    </button>
                </div>
            </form>
        </div>
    </main>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>