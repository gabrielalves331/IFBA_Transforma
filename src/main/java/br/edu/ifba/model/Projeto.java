package br.edu.ifba.model;

public class Projeto {
    private int id;
    private String titulo;
    private String orientador;
    private String status;

    // Getters e Setters
    public void setId(int id) { this.id = id; }
    public int getId() { return id; }

    public void setTitulo(String titulo) { this.titulo = titulo; }
    public String getTitulo() { return titulo; }

    public void setOrientador(String orientador) { this.orientador = orientador; }
    public String getOrientador() { return orientador; }

    public void setStatus(String status) { this.status = status; }
    public String getStatus() { return status; }
}
