package br.edu.ifba.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifba.dao.PerfilDAO;
import br.edu.ifba.model.Perfil;
import br.edu.ifba.model.Usuario;

@WebServlet(name = "PerfilServlet", urlPatterns = {"/PerfilServlet"} )
public class PerfilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Usuario usuarioLogado = (session != null) ? (Usuario) session.getAttribute("usuario") : null;
        if (usuarioLogado == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        try {
            PerfilDAO perfilDAO = new PerfilDAO();
            List<Perfil> perfis = perfilDAO.listarTodos();
            request.setAttribute("perfis", perfis);
            request.getRequestDispatcher("meu_perfil.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao carregar perfis.");
            request.getRequestDispatcher("dashboardAdmin.jsp").forward(request, response);
        }
    }
}