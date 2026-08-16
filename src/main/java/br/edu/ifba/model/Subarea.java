package br.edu.ifba.model;

public class Subarea {
    
    private int id;
    private String nome;
    private int areaId;

    // Construtor vazio padrão
    public Subarea() {
    }

    // --- GETTERS E SETTERS ---
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }
}