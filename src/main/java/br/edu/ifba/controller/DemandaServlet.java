package br.edu.ifba.controller;

import br.edu.ifba.dao.DemandaDAO;
import br.edu.ifba.model.Demanda;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DemandaServlet")
public class DemandaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            DemandaDAO demandaDAO = new DemandaDAO();
            // Busca TODAS as demandas cadastradas
            List<Demanda> demandas = demandaDAO.listarTodas();
            
            request.setAttribute("demandas", demandas);
            request.getRequestDispatcher("buscarDemandas.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }
}