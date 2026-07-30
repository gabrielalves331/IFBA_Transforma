<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Estudante - IFBA Transforma</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Seu CSS Customizado -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- CONTAINER DE TELA CHEIA (Usa .recovery-container do seu CSS) -->
    <div class="recovery-container">

        <!-- LADO ESQUERDO: FORMULÁRIO DE CADASTRO -->
        <main class="left-side">
            <div class="form-container w-100" style="max-width: 600px;">
                <h1>Cadastro de Estudante</h1>
                <p class="instruction-text mb-4">Preencha os campos abaixo para criar sua conta institucional.</p>
                
                <form action="CadastroEstudanteServlet" method="POST">
                    
                    <!-- SEÇÃO 1: DADOS PESSOAIS -->
                    <div class="row g-3 mb-3">
                        <div class="col-md-12">
                            <label for="nome" class="form-label">Nome Completo</label>
                            <input type="text" id="nome" name="nome" class="form-control" placeholder="Digite seu nome completo" required>
                        </div>
                        
                        <div class="col-md-6">
                            <label for="id" class="form-label">CPF ou Matrícula</label>
                            <input type="text" id="id" name="id" class="form-control" placeholder="000.000.000-00" required>
                        </div>

                        <div class="col-md-6">
                            <label for="email" class="form-label">E-mail Institucional</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="seu.nome@ifba.edu.br" required>
                        </div>
                    </div>

                    <!-- SEÇÃO 2: DADOS ACADÊMICOS -->
                    <div class="row g-3 mb-3">
                        <div class="col-md-8">
                            <label for="curso" class="form-label">Curso</label>
                            <select id="curso" name="curso" class="form-select" required>
                                <option value="Ciência da Computação" selected>Ciência da Computação</option>
                                <option value="Engenharia Elétrica">Engenharia Elétrica</option>
                                <option value="Administração">Administração</option>
                                <option value="Outro">Outro Curso / Técnico</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="semestre" class="form-label">Semestre Atual</label>
                            <input type="number" id="semestre" name="semestre" class="form-control" value="4" min="1" max="12" required>
                        </div>
                    </div>

                    <!-- SEÇÃO 3: SEGURANÇA -->
                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <label for="senha" class="form-label">Senha de Acesso</label>
                            <input type="password" id="senha" name="senha" class="form-control" placeholder="Crie uma senha forte" required>
                        </div>
                        <div class="col-md-6">
                            <label for="confirmarSenha" class="form-label">Confirmar Senha</label>
                            <input type="password" id="confirmarSenha" class="form-control" placeholder="Repita a senha" required>
                        </div>
                    </div>

                    <!-- AÇÕES (Usando .btn-primary e .btn-voltar padronizados) -->
                    <div class="d-flex flex-column align-items-center gap-2 mt-4">
                        <button type="submit" class="btn btn-primary w-100">Finalizar Meu Cadastro</button>
                        <a href="escolha_perfil.jsp" class="btn-voltar w-100 mt-2">&larr; Alterar Tipo de Perfil</a>
                    </div>

                </form>
            </div>
        </main>

        <!-- LADO DIREITO: LOGOTIPO -->
        <div class="auth-brand-side">
            <div class="logo-container">
                <img src="logo_semlegenda.png" alt="Logo IFBA Transforma" class="logo-img">
            </div>
        </div>
    </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmxc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>