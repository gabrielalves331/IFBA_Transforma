package br.edu.ifba.model;

import java.io.Serializable;

public class Perfil implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private String usuarioId;
    private String organizacao;
    private String contato;
    private String localidade;
    private String curso;
    private Integer semestre;
    private String curriculoPath;
    private String areaAtuacao;
    private String disciplinas;

    // Construtor vazio
    public Perfil() {
    }

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(String usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getOrganizacao() {
        return organizacao;
    }

    public void setOrganizacao(String organizacao) {
        this.organizacao = organizacao;
    }

    public String getContato() {
        return contato;
    }

    public void setContato(String contato) {
        this.contato = contato;
    }

    public String getLocalidade() {
        return localidade;
    }

    public void setLocalidade(String localidade) {
        this.localidade = localidade;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public Integer getSemestre() {
        return semestre;
    }

    public void setSemestre(Integer semestre) {
        this.semestre = semestre;
    }

    public String getCurriculoPath() {
        return curriculoPath;
    }

    public void setCurriculoPath(String curriculoPath) {
        this.curriculoPath = curriculoPath;
    }

    public String getAreaAtuacao() {
        return areaAtuacao;
    }

    public void setAreaAtuacao(String areaAtuacao) {
        this.areaAtuacao = areaAtuacao;
    }

    public String getDisciplinas() {
        return disciplinas;
    }

    public void setDisciplinas(String disciplinas) {
        this.disciplinas = disciplinas;
    }
}