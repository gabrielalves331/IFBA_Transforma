package br.edu.ifba.dao;

import br.edu.ifba.model.Demanda; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map; 

public class DemandaDAO {

    public List<Demanda> listarPorOrientador(String idOrientador) { 
        List<Demanda> lista = new ArrayList<>();
        String sql = "SELECT * FROM demanda WHERE orientador_id = ?"; 
        
        try (Connection conn = ConexaoDB.getConexao(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, idOrientador); 
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Demanda d = new Demanda();
                
                d.setId(rs.getInt("id"));
                d.setTitulo(rs.getString("titulo"));
                d.setStatus(rs.getString("status"));
                d.setDescricao(rs.getString("descricao"));
                d.setDescDemandante(rs.getString("descDemandante"));
                d.setOrientadorId(rs.getString("orientador_id"));
                
                lista.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    public boolean cadastrar(Demanda demanda) {
        String sql = """
            INSERT INTO demanda (titulo, descricao, status, descDemandante, orientador_id, usuario_id) 
            VALUES (?, ?, ?, ?, ?, ?)
        """;
        
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, demanda.getTitulo());
            stmt.setString(2, demanda.getDescricao());
            stmt.setString(3, demanda.getStatus());
            stmt.setString(4, demanda.getDescDemandante());
            
            if (demanda.getOrientadorId() != null && !demanda.getOrientadorId().isEmpty()) {
                stmt.setString(5, demanda.getOrientadorId());
            } else {
                stmt.setNull(5, java.sql.Types.VARCHAR);
            }
            
            stmt.setString(6, demanda.getUsuarioId());
            
            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Map<String, Integer> contarDemandasPorStatus() {
        Map<String, Integer> mapa = new java.util.LinkedHashMap<>();
        String sql = "SELECT status, COUNT(*) as total FROM demanda GROUP BY status";
        
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                mapa.put(rs.getString("status"), rs.getInt("total"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapa;
    }
}