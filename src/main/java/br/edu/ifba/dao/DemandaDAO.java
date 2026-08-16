package br.edu.ifba.dao;

import br.edu.ifba.model.Demanda; 
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map; 

public class DemandaDAO {

    public boolean cadastrar(Demanda demanda) {
        String sql = "INSERT INTO demanda (usuario_id, subarea_id, titulo, descricao, contexto, impacto_esperado, prazo, status, tipo_criador, desc_demandante) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, demanda.getUsuarioId());
            stmt.setInt(2, demanda.getSubareaId() > 0 ? demanda.getSubareaId() : 1);
            stmt.setString(3, demanda.getTitulo());
            stmt.setString(4, demanda.getDescricao());
            stmt.setString(5, demanda.getContexto());
            stmt.setString(6, demanda.getImpactoEsperado());
            
            if (demanda.getPrazo() != null) {
                stmt.setDate(7, new Date(demanda.getPrazo().getTime()));
            } else {
                stmt.setNull(7, java.sql.Types.DATE);
            }
            
            stmt.setString(8, (demanda.getStatus() != null) ? demanda.getStatus() : "Submetida");
            stmt.setString(9, (demanda.getTipoCriador() != null) ? demanda.getTipoCriador() : "Comunidade Interna");
            stmt.setString(10, demanda.getDescDemandante());
            
            return stmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
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

    private Demanda montarDemanda(ResultSet rs) throws SQLException {
        Demanda d = new Demanda();
        d.setId(rs.getInt("id"));
        d.setTitulo(rs.getString("titulo"));
        d.setStatus(rs.getString("status"));
        d.setDescricao(rs.getString("descricao"));
        d.setContexto(rs.getString("contexto"));
        d.setImpactoEsperado(rs.getString("impacto_esperado"));
        d.setPrazo(rs.getDate("prazo"));
        d.setDescDemandante(rs.getString("desc_demandante"));
        d.setUsuarioId(rs.getString("usuario_id"));
        d.setSubareaId(rs.getInt("subarea_id"));
        d.setOrientadorId(rs.getString("orientador_id"));
        return d;
    }
    
    public boolean atribuirOrientador(int demandaId, String orientadorId) {
        String sql = "UPDATE demanda SET orientador_id = ?, status = 'Assumida' WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, orientadorId);
            stmt.setInt(2, demandaId);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Demanda> listarComFiltros(String status, String subareaIdStr, String termoBusca) throws SQLException {
        List<Demanda> lista = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM demanda WHERE 1=1");
        List<Object> parametros = new ArrayList<>();

        if (status != null && !status.isEmpty() && !status.equalsIgnoreCase("TODOS")) {
            sql.append(" AND status = ?");
            parametros.add(status);
        }
        if (subareaIdStr != null && !subareaIdStr.isEmpty()) {
            try {
                int subareaId = Integer.parseInt(subareaIdStr);
                sql.append(" AND subarea_id = ?");
                parametros.add(subareaId);
            } catch (NumberFormatException e) { }
        }
        if (termoBusca != null && !termoBusca.trim().isEmpty()) {
            sql.append(" AND (titulo LIKE ? OR descricao LIKE ?)");
            parametros.add("%" + termoBusca.trim() + "%");
            parametros.add("%" + termoBusca.trim() + "%");
        }
        sql.append(" ORDER BY id DESC");

        // CORREÇÃO: Utilizando getConexao()
        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < parametros.size(); i++) {
                stmt.setObject(i + 1, parametros.get(i));
            }
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    lista.add(montarDemanda(rs));
                }
            }
        }
        return lista;
    }
}