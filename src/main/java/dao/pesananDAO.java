package dao;

import model.pesanan;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import config.koneksi;

public class pesananDAO {

    private Connection conn;

    public pesananDAO() {
        conn = koneksi.getConnection();
    }

    // Insert pesanan
    public void insert(pesanan p) throws SQLException {
        String sql = "INSERT INTO pesanan (nama, no_hp, jenis_kost, lokasi, tanggal_masuk, durasi, username) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, p.getNama());
        ps.setString(2, p.getNoHp());
        ps.setString(3, p.getJenisKost());
        ps.setString(4, p.getLokasi());
        ps.setDate(5, p.getTanggalMasuk());
        ps.setInt(6, p.getDurasi());
        ps.setString(7, p.getUsername());
        ps.executeUpdate();
        ps.close();
    }

    // Get pesanan by username
    public List<pesanan> getPesananByUser(String username) throws SQLException {
        List<pesanan> list = new ArrayList<>();
        String sql = "SELECT * FROM pesanan WHERE username=? ORDER BY tanggal_masuk DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            pesanan p = new pesanan();
            p.setId(rs.getInt("id"));
            p.setNama(rs.getString("nama"));
            p.setNoHp(rs.getString("no_hp"));
            p.setJenisKost(rs.getString("jenis_kost"));
            p.setLokasi(rs.getString("lokasi"));
            p.setTanggalMasuk(rs.getDate("tanggal_masuk"));
            p.setDurasi(rs.getInt("durasi"));
            p.setUsername(rs.getString("username"));
            list.add(p);
        }
        rs.close();
        ps.close();
        return list;
    }

    // Total semua pesanan
    public int getTotalPesanan() throws SQLException {
        String sql = "SELECT COUNT(*) FROM pesanan";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        int total = 0;
        if(rs.next()) total = rs.getInt(1);
        rs.close();
        st.close();
        return total;
    }

    // Total pesanan berdasarkan jenis kost
    public int getTotalByJenis(String jenis) throws SQLException {
        String sql = "SELECT COUNT(*) FROM pesanan WHERE jenis_kost = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, jenis);
        ResultSet rs = ps.executeQuery();
        int total = 0;
        if(rs.next()) total = rs.getInt(1);
        rs.close();
        ps.close();
        return total;
    }

    // Pesanan terbaru (limit)
    public List<pesanan> getLatestPesanan(int limit) throws SQLException {
        String sql = "SELECT * FROM pesanan ORDER BY tanggal_masuk DESC LIMIT ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, limit);
        ResultSet rs = ps.executeQuery();
        List<pesanan> list = new ArrayList<>();
        while(rs.next()) {
            pesanan p = new pesanan();
            p.setId(rs.getInt("id"));
            p.setNama(rs.getString("nama"));
            p.setNoHp(rs.getString("no_hp"));
            p.setJenisKost(rs.getString("jenis_kost"));
            p.setLokasi(rs.getString("lokasi"));
            p.setTanggalMasuk(rs.getDate("tanggal_masuk"));
            p.setDurasi(rs.getInt("durasi"));
            p.setUsername(rs.getString("username"));
            list.add(p);
        }
        rs.close();
        ps.close();
        return list;
    }
}
