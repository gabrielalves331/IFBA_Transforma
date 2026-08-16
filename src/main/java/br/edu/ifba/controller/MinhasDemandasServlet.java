package br.edu.ifba.controller;

import br.edu.ifba.dao.DemandaDAO;
import br.edu.ifba.model.Demanda;
import br.edu.ifba.model.Usuario;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MinhasDemandasServlet")
public class MinhasDemandasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");

        if (usuarioLogado == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            DemandaDAO demandaDAO = new DemandaDAO();
            
            // CORREÇÃO: Usa listarPorUsuario passando o ID do usuário logado (criador da demanda)
            List<Demanda> minhasDemandas = demandaDAO.listarPorUsuario(usuarioLogado.getId());
            
            request.setAttribute("minhasDemandas", minhasDemandas);
            request.getRequestDispatcher("minhasDemandas.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao carregar suas demandas.");
            request.getRequestDispatcher("minhasDemandas.jsp").forward(request, response);
        }
    }
}