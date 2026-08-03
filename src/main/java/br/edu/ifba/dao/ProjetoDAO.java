package br.edu.ifba.dao;

import br.edu.ifba.model.Projeto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class ProjetoDAO {

    // CREATE
    public void salvar(Projeto projeto) throws SQLException {

        String sql =
                "INSERT INTO projeto (id, demanda_id, titulo, descricao, status, data_inicio, data_fim_prevista, responsavel_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, projeto.getId());
            stmt.setString(2, projeto.getDemandaId());
            stmt.setString(3, projeto.getTitulo());
            stmt.setString(4, projeto.getDescricao());
            stmt.setString(5, projeto.getStatus());
            stmt.setDate(6, projeto.getDataInicio());
            stmt.setDate(7, projeto.getDataFimPrevista());
            stmt.setString(8, projeto.getResponsavelId());

            stmt.executeUpdate();
        }
    }

    // READ - todos
    public List<Projeto> listarTodos() throws SQLException {

        List<Projeto> lista = new ArrayList<>();

        String sql = "SELECT * FROM projeto";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                lista.add(mapearProjeto(rs));
            }
        }

        return lista;
    }

    // READ - por id
    public Projeto buscarPorId(String id) throws SQLException {

        String sql = "SELECT * FROM projeto WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapearProjeto(rs);
            }
        }

        return null;
    }

    // UPDATE
    public void atualizar(Projeto projeto) throws SQLException {

        String sql =
                "UPDATE projeto SET titulo = ?, descricao = ?, status = ?, " +
                "data_inicio = ?, data_fim_prevista = ?, responsavel_id = ? " +
                "WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, projeto.getTitulo());
            stmt.setString(2, projeto.getDescricao());
            stmt.setString(3, projeto.getStatus());
            stmt.setDate(4, projeto.getDataInicio());
            stmt.setDate(5, projeto.getDataFimPrevista());
            stmt.setString(6, projeto.getResponsavelId());
            stmt.setString(7, projeto.getId());

            stmt.executeUpdate();
        }
    }

    // DELETE
    public void excluir(int id) throws SQLException {
        String sql = "DELETE FROM projeto WHERE id = ?";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    // Helper para não repetir o mapeamento de ResultSet -> Projeto
    private Projeto mapearProjeto(ResultSet rs) throws SQLException {

        Projeto p = new Projeto();

        p.setId(rs.getString("id"));
        p.setDemandaId(rs.getString("demanda_id"));
        p.setTitulo(rs.getString("titulo"));
        p.setDescricao(rs.getString("descricao"));
        p.setStatus(rs.getString("status"));
        p.setDataInicio(rs.getDate("data_inicio"));
        p.setDataFimPrevista(rs.getDate("data_fim_prevista"));
        p.setResponsavelId(rs.getString("responsavel_id"));
        p.setDataCriacao(rs.getTimestamp("data_criacao"));

        return p;
    }
    
 // DASHBOARD - Contar projetos concluídos por ano
    public java.util.Map<Integer, Integer> contarProjetosConcluidosPorAno() throws SQLException {
        java.util.Map<Integer, Integer> resultado = new java.util.LinkedHashMap<>();
        
        // Consulta SQL considerando o status como 'CONCLUIDO' e extraindo o ano da data
        // (Sintaxe compatível com MySQL. Se usar PostgreSQL, substitua YEAR() por EXTRACT(YEAR FROM ...))
        String sql = "SELECT YEAR(data_fim_prevista) AS ano, COUNT(*) AS total " +
                     "FROM projeto " +
                     "WHERE status = 'CONCLUIDO' " +
                     "GROUP BY YEAR(data_fim_prevista) " +
                     "ORDER BY ano DESC";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int ano = rs.getInt("ano");
                int total = rs.getInt("total");
                resultado.put(ano, total);
            }
        }
        return resultado;
    }
}
