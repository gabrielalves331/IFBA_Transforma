package br.edu.ifba.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processLogout(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processLogout(request, response);
    }

    private void processLogout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // 1. Resgata a sessão atual sem criar nova
        HttpSession session = request.getSession(false);

        if (session != null) {
            // 2. Invalida completamente a sessão no servidor
            session.invalidate();
        }

        // 3. Define cabeçalhos anti-cache para evitar que o navegador exiba páginas protegidas via botão "Voltar"
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.

        // 4. Redireciona para o login com mensagem de sucesso
        response.sendRedirect("login.jsp?logout=sucesso");
    }
}
