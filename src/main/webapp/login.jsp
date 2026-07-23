<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - IFBA Transforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            height: 100vh;
            width: 100vw;
            overflow: hidden;
            background-color: #ffffff;
        }

        /* COLUNA DA ESQUERDA - FORMULÁRIO DE LOGIN */
        .left-side {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .login-box {
            width: 100%;
            max-width: 400px; /* Um pouco mais de ganho horizontal */
        }

        /* Tipografia mais aberta conforme sugestão do professor */
        .login-box h2 {
            font-size: 2.2rem;
            font-weight: bold;
            color: #000000;
            margin-bottom: 25px;
            letter-spacing: 0.5px;
        }

        .form-label {
            font-weight: 600;
            color: #444444;
            font-size: 0.95rem;
            letter-spacing: 0.3px;
        }

        .form-control {
            border: 2px solid #e5e5e5;
            border-radius: 8px;
            padding: 12px 14px;
            font-size: 1rem;
            transition: all 0.2s ease-in-out;
        }

        .form-control:focus {
            border-color: #1a5c38;
            box-shadow: 0 0 0 0.25rem rgba(26, 92, 56, 0.1);
        }

        .btn-entrar {
            background-color: #1a5c38;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 1.05rem;
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: background-color 0.2s;
        }

        .btn-entrar:hover {
            background-color: #13472a;
            color: white;
        }

        .links-auxiliares {
            font-size: 0.9rem;
        }

        .links-auxiliares a {
            color: #1a5c38;
            text-decoration: none;
            transition: color 0.2s;
        }

        .links-auxiliares a:hover {
            color: #13472a;
            text-decoration: underline;
        }

        /* COLUNA DA DIREITA - BANNER VERDE */
        .right-side {
            flex: 1;
            background-color: #1f5c43;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .logo-container {
            text-align: center;
            max-width: 450px;
            width: 100%;
        }

        .logo-img {
            width: 100%;
            height: auto;
            object-fit: contain;
        }

        .logo-img-blend {
            mix-blend-mode: screen;
        }

        @media (max-width: 768px) {
            .right-side {
                display: none;
            }
        }
    </style>
</head>
<body>

    <!-- LADO ESQUERDO: FORMULÁRIO -->
    <main class="left-side">
        <div class="login-box">
            <h2>Faça seu login</h2>
            
            <% if (request.getParameter("erro") != null) { %>
                <div class="alert alert-danger p-2 font-monospace" style="font-size: 0.85rem; border-radius: 8px;" role="alert">
                    Usuário ou senha inválidos.
                </div>
            <% } %>

            <form action="LoginServlet" method="POST">
                <div class="mb-3">
                    <label for="email" class="form-label">E-mail ou Usuário</label>
                    <input 
                        type="email" 
                        id="email"
                        name="email" 
                        class="form-control" 
                        placeholder="seu.nome@ifba.edu.br"
                        required
                    >
                </div>
                
                <div class="mb-3">
                    <label for="senha" class="form-label">Senha</label>
                    <input 
                        type="password" 
                        id="senha"
                        name="senha" 
                        class="form-control"
                        placeholder="Sua senha de acesso"
                        required
                    >
                </div>
                
                <div class="text-end mb-4 links-auxiliares">
                    <a href="redefinirSenha.jsp">Esqueceu a senha?</a>
                </div>
                
                <button type="submit" class="btn btn-entrar w-100 mb-4">Entrar no Sistema</button>
                
                <div class="text-center links-auxiliares text-muted">
                    Não tem conta ainda? <a href="escolha_perfil.jsp" class="fw-bold">Crie agora</a>
                </div>
            </form>
        </div>
    </main>

    <!-- LADO DIREITO: LOGOTIPO -->
    <aside class="right-side">
        <div class="logo-container">
            <img src="logoifbaTransforma_semlegenda.png" alt="Logo IFBA Transforma" class="logo-img logo-img-blend">
        </div>
    </aside>

</body>
</html>