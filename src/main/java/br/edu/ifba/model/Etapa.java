package br.edu.ifba.model;

import java.sql.Date;

public class Etapa {

    private String id;
    private String projetoId;
    private String titulo;
    private String descricao;
    private Date dataInicio;
    private Date dataFim;
    private String status;
    private int ordem;


    public Etapa() {
    }

    public Etapa(String id,
                  String projetoId,
                  String titulo,
                  String descricao,
                  Date dataInicio,
                  Date dataFim,
                  String status,
                  int ordem) {

        this.id = id;
        this.projetoId = projetoId;
        this.titulo = titulo;
        this.descricao = descricao;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.status = status;
        this.ordem = ordem;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProjetoId() {
        return projetoId;
    }

    public void setProjetoId(String projetoId) {
        this.projetoId = projetoId;
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

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrdem() {
        return ordem;
    }

    public void setOrdem(int ordem) {
        this.ordem = ordem;
    }
}
