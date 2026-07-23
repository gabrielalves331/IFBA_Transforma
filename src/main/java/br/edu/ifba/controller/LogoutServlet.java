package br.edu.ifba.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Pega a sessão atual (o "false" significa que não vai criar uma nova se não existir)
        HttpSession session = request.getSession(false);
        
        // 2. Se existir uma sessão aberta, destrói (invalida) ela
        if (session != null) {
            session.invalidate();
        }
        
        // 3. Redireciona o usuário limpo para a página inicial
        response.sendRedirect("index.jsp");
    }
}