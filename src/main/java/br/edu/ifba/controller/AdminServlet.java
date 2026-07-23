package br.edu.ifba.controller;

import java.io.IOException;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.edu.ifba.dao.*;

@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            DemandaDAO demandaDAO = new DemandaDAO();
            ProjetoDAO projetoDAO = new ProjetoDAO();

            request.setAttribute("usuarios", usuarioDAO.listarTodos());
            request.setAttribute("usuariosPorTipo", usuarioDAO.contarUsuariosPorTipo());
            request.setAttribute("demandasPorStatus", demandaDAO.contarDemandasPorStatus());
            request.setAttribute("projetosPorAno", projetoDAO.contarProjetosConcluidosPorAno());

            request.getRequestDispatcher("dashboardAdmin.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Erro ao carregar dashboard.", e);
        }
    }
}