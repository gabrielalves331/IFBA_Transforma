package br.edu.ifba.dao;

import br.edu.ifba.model.Etapa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EtapaDAO {

    public void salvar(Etapa etapa) throws SQLException {
        String sql = "INSERT INTO etapa (projeto_id, titulo, descricao, data_inicio, data_fim, status, ordem) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, etapa.getProjetoId());
            stmt.setString(2, etapa.getTitulo());
            stmt.setString(3, etapa.getDescricao());
            stmt.setDate(4, etapa.getDataInicio());
            stmt.setDate(5, etapa.getDataFim());
            stmt.setString(6, etapa.getStatus());
            stmt.setInt(7, etapa.getOrdem());
            stmt.executeUpdate();
        }
    }

    public List<Etapa> listarPorProjeto(String projetoId) throws SQLException {
        List<Etapa> lista = new ArrayList<>();
        String sql = "SELECT * FROM etapa WHERE projeto_id = ? ORDER BY ordem ASC, data_inicio ASC";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, projetoId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Etapa e = new Etapa();
                    e.setId(rs.getString("id"));
                    e.setProjetoId(rs.getString("projeto_id"));
                    e.setTitulo(rs.getString("titulo"));
                    e.setDescricao(rs.getString("descricao"));
                    e.setDataInicio(rs.getDate("data_inicio"));
                    e.setDataFim(rs.getDate("data_fim"));
                    e.setStatus(rs.getString("status"));
                    e.setOrdem(rs.getInt("ordem"));
                    lista.add(e);
                }
            }
        }
        return lista;
    }

    public void atualizarStatus(String etapaId, String status) throws SQLException {
        String sql = "UPDATE etapa SET status = ? WHERE id = ?";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setString(2, etapaId);
            stmt.executeUpdate();
        }
    }

    public void excluir(String id) throws SQLException {
        String sql = "DELETE FROM etapa WHERE id = ?";
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, id);
            stmt.executeUpdate();
        }
    }
}
