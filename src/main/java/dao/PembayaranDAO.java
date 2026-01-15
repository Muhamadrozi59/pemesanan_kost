package dao;

import config.koneksi;
import model.Pembayaran;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PembayaranDAO {

    public List<Pembayaran> getAll() {
        List<Pembayaran> list = new ArrayList<>();
        // Query JOIN untuk mengambil Nama Pemesan dan Nama Kost dari tabel Pesanan
        String sql = "SELECT p.id, ps.nama AS nama_pemesan, ps.lokasi AS nama_kost, " +
                     "p.total_biaya, p.total_dibayar " +
                     "FROM pembayaran p " +
                     "JOIN pesanan ps ON p.pesanan_id = ps.id " +
                     "ORDER BY p.id DESC";
                     
        try (Connection con = koneksi.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Pembayaran p = new Pembayaran();
                p.setId(rs.getInt("id"));
                p.setNamaPemesan(rs.getString("nama_pemesan")); // Dari tabel pesanan
                p.setNamaKost(rs.getString("nama_kost"));       // Dari tabel pesanan
                p.setTotalBiaya(rs.getDouble("total_biaya"));
                p.setTotalDibayar(rs.getDouble("total_dibayar"));
                list.add(p);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void bayar(int id, double jumlah) {
        String sql = "UPDATE pembayaran SET total_dibayar = total_dibayar + ? WHERE id = ?";
        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDouble(1, jumlah);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}