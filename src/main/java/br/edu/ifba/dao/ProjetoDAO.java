package br.edu.ifba.dao;

import br.edu.ifba.model.Projeto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.LinkedHashMap;

public class ProjetoDAO {

    public void salvar(Projeto projeto) throws SQLException {
        String sql = "INSERT INTO projeto (demanda_id, titulo, descricao, status, data_inicio, data_fim_prevista, responsavel_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, projeto.getDemandaId());
            stmt.setString(2, projeto.getTitulo());
            stmt.setString(3, projeto.getDescricao());
            stmt.setString(4, projeto.getStatus());
            stmt.setDate(5, projeto.getDataInicio());
            stmt.setDate(6, projeto.getDataFimPrevista());
            stmt.setString(7, projeto.getResponsavelId());
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    projeto.setId(String.valueOf(rs.getLong(1)));
                }
            }
        }
    }

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

    // MÉTODO PARA O DASHBOARD DO PROFESSOR
    public List<Projeto> listarPorResponsavel(String responsavelId) throws SQLException {
        List<Projeto> lista = new ArrayList<>();
        String sql = "SELECT * FROM projeto WHERE responsavel_id = ?";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, responsavelId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    lista.add(mapearProjeto(rs));
                }
            }
        }
        return lista;
    }

    public Projeto buscarPorId(String id) throws SQLException {
        String sql = "SELECT * FROM projeto WHERE id = ?";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapearProjeto(rs);
                }
            }
        }
        return null;
    }

    public void atualizar(Projeto projeto) throws SQLException {
        String sql = "UPDATE projeto SET titulo = ?, descricao = ?, status = ?, " +
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

    public void excluir(String id) throws SQLException {
        String sql = "DELETE FROM projeto WHERE id = ?";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, id);
            stmt.executeUpdate();
        }
    }

    // MÉTODO QUE TINHA SUMIDO E É USADO NO DASHBOARD ADMIN
    public Map<Integer, Integer> contarProjetosConcluidosPorAno() throws SQLException {
        Map<Integer, Integer> resultado = new LinkedHashMap<>();
        String sql = "SELECT YEAR(data_fim_prevista) AS ano, COUNT(*) AS total " +
                     "FROM projeto " +
                     "WHERE status = 'Concluído' " +
                     "GROUP BY YEAR(data_fim_prevista) " +
                     "ORDER BY ano DESC";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultado.put(rs.getInt("ano"), rs.getInt("total"));
            }
        }
        return resultado;
    }

    public Projeto buscarPorDemandaId(String demandaId) throws SQLException {
        String sql = "SELECT * FROM projeto WHERE demanda_id = ? LIMIT 1";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, demandaId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapearProjeto(rs);
                }
            }
        }
        return null;
    }

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
}
