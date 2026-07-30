package br.edu.ifba.dao;

import br.edu.ifba.model.Demanda; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map; 

public class DemandaDAO {

    public boolean cadastrar(Demanda demanda) {
        String sql = "INSERT INTO demanda (titulo, descricao, status, descDemandante, orientador_id, usuario_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, demanda.getTitulo());
            stmt.setString(2, demanda.getDescricao());
            stmt.setString(3, demanda.getStatus());
            stmt.setString(4, demanda.getDescDemandante());
            
            if (demanda.getOrientadorId() != null && !demanda.getOrientadorId().toString().isEmpty()) {
                stmt.setString(5, demanda.getOrientadorId().toString());
            } else {
                stmt.setNull(5, java.sql.Types.VARCHAR);
            }
            
            if (demanda.getUsuarioId() != null && !demanda.getUsuarioId().toString().isEmpty()) {
                stmt.setString(6, demanda.getUsuarioId().toString());
            } else {
                stmt.setNull(6, java.sql.Types.VARCHAR);
            }
            
            return stmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Demanda> listarPorOrientador(String idOrientador) { 
        List<Demanda> lista = new ArrayList<>();
        String sql = "SELECT * FROM demanda WHERE orientador_id = ? ORDER BY id DESC"; 
        
        try (Connection conn = ConexaoDB.getConexao(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, idOrientador); 
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    lista.add(montarDemanda(rs));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List<Demanda> listarPorUsuario(String idUsuario) { 
        List<Demanda> lista = new ArrayList<>();
        String sql = "SELECT * FROM demanda WHERE usuario_id = ? ORDER BY id DESC"; 
        
        try (Connection conn = ConexaoDB.getConexao(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, idUsuario); 
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    lista.add(montarDemanda(rs));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List<Demanda> listarTodas() { 
        List<Demanda> lista = new ArrayList<>();
        String sql = "SELECT * FROM demanda ORDER BY id DESC"; 
        
        try (Connection conn = ConexaoDB.getConexao(); 
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                lista.add(montarDemanda(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Demanda buscarPorId(int id) {
        String sql = "SELECT * FROM demanda WHERE id = ?";
        Demanda demanda = null;

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    demanda = montarDemanda(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return demanda;
    }

    public boolean atualizarStatus(int id, String novoStatus) {
        String sql = "UPDATE demanda SET status = ? WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, novoStatus);
            stmt.setInt(2, id);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Map<String, Integer> contarDemandasPorStatus() {
        Map<String, Integer> mapa = new LinkedHashMap<>();
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

    // Método auxiliar para evitar duplicação de código
    private Demanda montarDemanda(ResultSet rs) throws SQLException {
        Demanda d = new Demanda();
        d.setId(rs.getInt("id"));
        d.setTitulo(rs.getString("titulo"));
        d.setStatus(rs.getString("status"));
        d.setDescricao(rs.getString("descricao"));
        d.setDescDemandante(rs.getString("descDemandante"));
        d.setOrientadorId(rs.getString("orientador_id"));
        d.setUsuarioId(rs.getString("usuario_id"));
        return d;
    }
}