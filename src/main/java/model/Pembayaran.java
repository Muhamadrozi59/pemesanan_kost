package model;

public class Pembayaran {
    private int id;
    private String namaPemesan; // Untuk menampung hasil JOIN
    private String namaKost;    // Untuk menampung hasil JOIN
    private double totalBiaya;
    private double totalDibayar;

    // Getter dan Setter tetap sama seperti sebelumnya
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNamaPemesan() { return namaPemesan; }
    public void setNamaPemesan(String n) { this.namaPemesan = n; }
    public String getNamaKost() { return namaKost; }
    public void setNamaKost(String k) { this.namaKost = k; }
    public double getTotalBiaya() { return totalBiaya; }
    public void setTotalBiaya(double b) { this.totalBiaya = b; }
    public double getTotalDibayar() { return totalDibayar; }
    public void setTotalDibayar(double d) { this.totalDibayar = d; }
    
    public double getSisa() { return totalBiaya - totalDibayar; }
    public String getStatus() { return (totalDibayar >= totalBiaya) ? "Lunas" : "Booking"; }
}