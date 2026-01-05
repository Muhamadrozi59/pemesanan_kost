package model;

import java.sql.Date;

public class pesanan {
    private int id;
    private String nama;
    private String noHp;
    private String jenisKost; // Putra / Putri
    private String lokasi;
    private Date tanggalMasuk;
    private int durasi;
    private String username;

    // getter & setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }

    public String getNoHp() { return noHp; }
    public void setNoHp(String noHp) { this.noHp = noHp; }

    public String getJenisKost() { return jenisKost; }
    public void setJenisKost(String jenisKost) { this.jenisKost = jenisKost; }

    public String getLokasi() { return lokasi; }
    public void setLokasi(String lokasi) { this.lokasi = lokasi; }

    public Date getTanggalMasuk() { return tanggalMasuk; }
    public void setTanggalMasuk(Date tanggalMasuk) { this.tanggalMasuk = tanggalMasuk; }

    public int getDurasi() { return durasi; }
    public void setDurasi(int durasi) { this.durasi = durasi; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}
