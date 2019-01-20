package model;

public class StanzaTabella {
    private String nome;
    private int piano;
    private Double avg_temp;
    private Double avg_um;
    private Double avg_pres;
    private Double avg_lum;

    public int getPiano() {
        return piano;
    }

    public void setPiano(int piano) {
        this.piano = piano;
    }

    @Override
    public String toString() {
        return "StanzaTabella{" +
                "nome='" + nome + '\'' +
                ", piano=" + piano +
                ", avg_temp=" + avg_temp +
                ", avg_um=" + avg_um +
                ", avg_pres=" + avg_pres +
                ", avg_lum=" + avg_lum +
                '}';
    }

    public StanzaTabella(Double avg_temp, Double avg_um, Double avg_pres, Double avg_lum, int piano) {
        this.avg_temp = avg_temp;
        this.avg_um = avg_um;
        this.avg_pres = avg_pres;
        this.avg_lum = avg_lum;
        this.piano = piano;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getAvg_temp() {
        return avg_temp;
    }

    public void setAvg_temp(Double avg_temp) {
        this.avg_temp = avg_temp;
    }

    public Double getAvg_um() {
        return avg_um;
    }

    public void setAvg_um(Double avg_um) {
        this.avg_um = avg_um;
    }

    public Double getAvg_pres() {
        return avg_pres;
    }

    public void setAvg_pres(Double avg_pres) {
        this.avg_pres = avg_pres;
    }

    public Double getAvg_lum() {
        return avg_lum;
    }

    public void setAvg_lum(Double avg_lum) {
        this.avg_lum = avg_lum;
    }
}
