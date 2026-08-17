package br.edu.ifba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifba.model.Subarea;

public class SubareaDAO {

    public List<Subarea> listarTodas() throws SQLException {
        List<Subarea> lista = new ArrayList<>();
        String sql = "SELECT id, nome, area_id FROM subarea ORDER BY nome";

        // CORREÇÃO: Utilizando getConexao()
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Subarea sub = new Subarea();
                sub.setId(rs.getInt("id"));
                sub.setNome(rs.getString("nome"));
                sub.setAreaId(rs.getInt("area_id"));
                lista.add(sub);
            }
        }
        return lista;
    }

    public List<Subarea> listarPorArea(int areaId) throws SQLException {
        List<Subarea> lista = new ArrayList<>();
        String sql = "SELECT id, nome, area_id FROM subarea WHERE area_id = ? ORDER BY nome";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, areaId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Subarea sub = new Subarea();
                    sub.setId(rs.getInt("id"));
                    sub.setNome(rs.getString("nome"));
                    sub.setAreaId(rs.getInt("area_id"));
                    lista.add(sub);
                }
            }
        }
        return lista;
    }

    // CORREÇÃO: Implementadas as buscas e persistências
    public Subarea buscarPorId(int id) throws SQLException {
        String sql = "SELECT id, nome, area_id FROM subarea WHERE id = ?";
        Subarea sub = null;

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    sub = new Subarea();
                    sub.setId(rs.getInt("id"));
                    sub.setNome(rs.getString("nome"));
                    sub.setAreaId(rs.getInt("area_id"));
                }
            }
        }
        return sub;
    }

    public boolean salvar(Subarea subarea) throws SQLException {
        String sql = "INSERT INTO subarea (nome, area_id) VALUES (?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, subarea.getNome());
            stmt.setInt(2, subarea.getAreaId());

            return stmt.executeUpdate() > 0;
        }
    }

    public boolean atualizar(Subarea subarea) throws SQLException {
        String sql = "UPDATE subarea SET nome = ?, area_id = ? WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, subarea.getNome());
            stmt.setInt(2, subarea.getAreaId());
            stmt.setInt(3, subarea.getId());

            return stmt.executeUpdate() > 0;
        }
    }

    public boolean excluir(int id) throws SQLException {
        String sql = "DELETE FROM subarea WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;
        }
    }
}