package br.edu.ifba.controller;

import br.edu.ifba.dao.ProjetoDAO;
import br.edu.ifba.model.Projeto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProjetoServlet", urlPatterns = {"/ProjetoServlet"})
public class ProjetoServlet extends HttpServlet {

    private ProjetoDAO dao = new ProjetoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String acao = request.getParameter("acao");

        // Se não tiver ação, por padrão ele lista os projetos
        if (acao == null || acao.equals("listar")) {
            try {
                List<Projeto> listaProjetos = dao.listarTodos();
                request.setAttribute("projetos", listaProjetos);
                request.getRequestDispatcher("projetosAdmin.jsp").forward(request, response);
            } catch (Exception e) {
                throw new ServletException("Erro ao listar projetos", e);
            }
        } 
        // Ação de excluir
        else if (acao.equals("excluir")) {
            String id = request.getParameter("id");
            try {
                dao.excluir(Integer.parseInt(id)); // Ajuste conforme o tipo do seu ID (int/String)
                response.sendRedirect("ProjetoServlet?acao=listar");
            } catch (Exception e) {
                throw new ServletException("Erro ao excluir projeto", e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Se precisar de POST para cadastrar/editar depois, a estrutura será aqui
    }
}