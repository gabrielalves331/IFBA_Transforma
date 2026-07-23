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
    <title>Meu Perfil - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
</head>
<body>
<jsp:include page="sidebar.jsp" />


<div class="content">
    <div class="d-flex align-items-center mb-4">
        <h2 class="mb-0">Gerenciar Dados Pessoais</h2>
    </div>

    <div class="card card-profile p-4">
        <form action="AtualizarPerfilServlet" method="POST">
            <h5 class="text-success mb-3 border-bottom pb-2">Informações Gerais (Conta)</h5>
            <div class="row mb-4">
                <div class="col-md-4 mb-3">
                    <label class="form-label text-muted small fw-bold">CPF / ID (Não alterável)</label>
                    <input type="text" class="form-control bg-light" value="<%= usuario.getId() %>" readonly>
                </div>
                <div class="col-md-8 mb-3">
                    <label for="nome" class="form-label text-muted small fw-bold">Nome Completo</label>
                    <input type="text" id="nome" name="nome" class="form-control" value="<%= usuario.getNome() %>" required>
                </div>
                <div class="col-md-12 mb-3">
                    <label for="email" class="form-label text-muted small fw-bold">E-mail de Login</label>
                    <input type="email" id="email" name="email" class="form-control" value="<%= usuario.getEmail() %>" required>
                </div>
            </div>

            <h5 class="text-success mb-3 border-bottom pb-2">Especificação Acadêmica</h5>
            <div class="row mb-4">
                <div class="col-md-8 mb-3">
                    <label for="curso" class="form-label text-muted small fw-bold">Curso Atual</label>
                    <input type="text" id="curso" name="curso" class="form-control" value="Ciência da Computação" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="semestre" class="form-label text-muted small fw-bold">Semestre</label>
                    <input type="number" id="semestre" name="semestre" class="form-control" value="4" min="1" max="12" required>
                </div>
            </div>

            <h5 class="text-success mb-3 border-bottom pb-2">Segurança</h5>
            <div class="row mb-4">
                <div class="col-md-6 mb-3">
                    <label for="novaSenha" class="form-label text-muted small fw-bold">Nova Senha (Deixe em branco para manter a atual)</label>
                    <input type="password" id="novaSenha" name="novaSenha" class="form-control" placeholder="********">
                </div>
            </div>

            <div class="text-end border-top pt-3">
                <button type="submit" class="btn btn-salvar px-5 fw-bold">Salvar Alterações</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>