<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Escolha seu Perfil - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { background-color: #f8f9fa; height: 100vh; display: flex; align-items: center; }
        .card-perfil { transition: transform 0.3s, box-shadow 0.3s; cursor: pointer; border: none; }
        .card-perfil:hover { transform: translateY(-10px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .icon-perfil { font-size: 3rem; color: #2c3e50; }
    </style>
</head>
<body>

    <div class="container">
        <div class="text-center mb-5">
            <h1 class="fw-bold text-dark">Bem-vindo ao IFBA Transforma</h1>
            <p class="text-muted">Para começar, selecione o perfil que melhor descreve você:</p>
        </div>

        <div class="row g-4 justify-content-center">
            <!-- ESTUDANTE -->
            <div class="col-md-4">
                <div class="card card-perfil h-100 p-4 text-center" onclick="location.href='cadastroEstudante.jsp'">
                    <div class="icon-perfil mb-3">
                        <i class="bi bi-mortarboard-fill"></i>
                    </div>
                    <h3 class="h5 fw-bold">Estudante</h3>
                    <p class="small text-muted">Quero participar de projetos e aplicar meus conhecimentos técnicos.</p>
                    <button class="btn btn-outline-primary btn-sm mt-auto">Selecionar</button>
                </div>
            </div>

            <!-- COMUNIDADE -->
            <div class="col-md-4">
                <div class="card card-perfil h-100 p-4 text-center" onclick="location.href='cadastroComunidade.jsp'">
                    <div class="icon-perfil mb-3">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <h3 class="h5 fw-bold">Comunidade / ONG</h3>
                    <p class="small text-muted">Tenho uma demanda social e preciso de apoio técnico do IFBA.</p>
                    <button class="btn btn-outline-success btn-sm mt-auto">Selecionar</button>
                </div>
            </div>

            <!-- PROFESSOR (Opcional, geralmente cadastro é interno, mas aqui está a opção) -->
            <div class="col-md-4">
                <div class="card card-perfil h-100 p-4 text-center" onclick="location.href='login.jsp'">
                    <div class="icon-perfil mb-3">
                        <i class="bi bi-person-badge-fill"></i>
                    </div>
                    <h3 class="h5 fw-bold">Professor / Servidor</h3>
                    <p class="small text-muted">Quero orientar projetos e gerenciar demandas da minha área.</p>
                    <button class="btn btn-outline-dark btn-sm mt-auto">Acessar Painel</button>
                </div>
            </div>
        </div>

        <div class="text-center mt-5">
            <p class="text-muted small">Já possui uma conta? <a href="login.jsp" class="fw-bold text-decoration-none">Faça login aqui</a></p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
