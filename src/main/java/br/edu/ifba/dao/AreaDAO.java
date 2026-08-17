package br.edu.ifba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifba.model.Area;

public class AreaDAO {

    public List<Area> listarTodas() throws SQLException {
        List<Area> lista = new ArrayList<>();
        String sql = "SELECT id, nome FROM area ORDER BY nome";

        // CORREÇÃO: Utilizando getConexao()
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Area area = new Area();
                area.setId(rs.getInt("id"));
                area.setNome(rs.getString("nome"));
                lista.add(area);
            }
        }
        return lista;
    }

    // CORREÇÃO: Implementado método para busca
    public Area buscarPorId(int id) throws SQLException {
        String sql = "SELECT id, nome FROM area WHERE id = ?";
        Area area = null;

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    area = new Area();
                    area.setId(rs.getInt("id"));
                    area.setNome(rs.getString("nome"));
                }
            }
        }
        return area;
    }
}