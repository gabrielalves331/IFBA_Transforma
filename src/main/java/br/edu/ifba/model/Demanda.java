package br.edu.ifba.model;

import java.sql.Date;

public class Demanda {

    private int id;
    private String usuarioId;
    private int subareaId;
    private String titulo;
    private String descricao;
    private String contexto;
    private String justificativa;
    private String impactoEsperado;
    private Date prazo;
    private String localidade;
    private String status;
    private String tipoCriador;
    private String descDemandante;
    private String orientadorId;

    // --- CONSTRUTOR PADRÃO ---
    public Demanda() {
    }

    // --- GETTERS E SETTERS ---

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(String usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getSubareaId() {
        return subareaId;
    }

    public void setSubareaId(int subareaId) {
        this.subareaId = subareaId;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getContexto() {
        return contexto;
    }

    public void setContexto(String contexto) {
        this.contexto = contexto;
    }

    public String getJustificativa() {
        return justificativa;
    }

    public void setJustificativa(String justificativa) {
        this.justificativa = justificativa;
    }

    public String getImpactoEsperado() {
        return impactoEsperado;
    }

    public void setImpactoEsperado(String impactoEsperado) {
        this.impactoEsperado = impactoEsperado;
    }

    public Date getPrazo() {
        return prazo;
    }

    public void setPrazo(Date prazo) {
        this.prazo = prazo;
    }

    public String getLocalidade() {
        return localidade;
    }

    public void setLocalidade(String localidade) {
        this.localidade = localidade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTipoCriador() {
        return tipoCriador;
    }

    public void setTipoCriador(String tipoCriador) {
        this.tipoCriador = tipoCriador;
    }

    public String getDescDemandante() {
        return descDemandante;
    }

    public void setDescDemandante(String descDemandante) {
        this.descDemandante = descDemandante;
    }

    public String getOrientadorId() {
        return orientadorId;
    }

    public void setOrientadorId(String orientadorId) {
        this.orientadorId = orientadorId;
    }
}