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

    // INSERT
    public void insert(pesanan p) throws SQLException {
        String sql = "INSERT INTO pesanan (nama, no_hp, jenis_kost, lokasi, tanggal_masuk, durasi, username, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, p.getNama());
        ps.setString(2, p.getNoHp());
        ps.setString(3, p.getJenisKost());
        ps.setString(4, p.getLokasi());
        ps.setDate(5, p.getTanggalMasuk());
        ps.setInt(6, p.getDurasi());
        ps.setString(7, p.getUsername());
        ps.setString(8, p.getStatus());
        ps.executeUpdate();
        ps.close();
    }

    // UPDATE
    public void update(pesanan p) throws SQLException {
        String sql = "UPDATE pesanan SET nama=?, no_hp=?, jenis_kost=?, lokasi=?, tanggal_masuk=?, durasi=?, username=?, status=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, p.getNama());
        ps.setString(2, p.getNoHp());
        ps.setString(3, p.getJenisKost());
        ps.setString(4, p.getLokasi());
        ps.setDate(5, p.getTanggalMasuk());
        ps.setInt(6, p.getDurasi());
        ps.setString(7, p.getUsername());
        ps.setString(8, p.getStatus());
        ps.setInt(9, p.getId());
        ps.executeUpdate();
        ps.close();
    }

    // DELETE
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM pesanan WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
    }

    // TOTAL PESANAN
    public int getTotalPesanan() throws SQLException {
        String sql = "SELECT COUNT(*) FROM pesanan";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        int t = 0;
        if (rs.next()) t = rs.getInt(1);
        rs.close();
        st.close();
        return t;
    }

    // TOTAL PENDAPATAN
    public int getRealRevenue() throws SQLException {
        int t = 0;
        String sql = "SELECT SUM(total_biaya) FROM pembayaran";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        if (rs.next()) t = rs.getInt(1);
        rs.close();
        st.close();
        return t;
    }

    // TOTAL PER BULAN
    public int getTotalByMonth(int m) throws SQLException {
        String sql = "SELECT COUNT(*) FROM pesanan WHERE EXTRACT(MONTH FROM tanggal_masuk)=? AND EXTRACT(YEAR FROM tanggal_masuk)=2026";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, m);
        ResultSet rs = ps.executeQuery();
        int t = 0;
        if (rs.next()) t = rs.getInt(1);
        rs.close();
        ps.close();
        return t;
    }

    // TOTAL PER JENIS
    public int getTotalByJenis(String j) throws SQLException {
        String sql = "SELECT COUNT(*) FROM pesanan WHERE jenis_kost = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, j);
        ResultSet rs = ps.executeQuery();
        int t = 0;
        if (rs.next()) t = rs.getInt(1);
        rs.close();
        ps.close();
        return t;
    }

    // DATA TERBARU
    public List<pesanan> getLatestPesanan(int limit) throws SQLException {
        List<pesanan> list = new ArrayList<>();
        String sql = "SELECT * FROM pesanan ORDER BY id DESC LIMIT ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, limit);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            pesanan p = new pesanan();
            p.setId(rs.getInt("id"));
            p.setNama(rs.getString("nama"));
            p.setNoHp(rs.getString("no_hp"));
            p.setJenisKost(rs.getString("jenis_kost"));
            p.setLokasi(rs.getString("lokasi"));
            p.setTanggalMasuk(rs.getDate("tanggal_masuk"));
            p.setDurasi(rs.getInt("durasi"));
            p.setUsername(rs.getString("username"));
            p.setStatus(rs.getString("status"));
            list.add(p);
        }

        rs.close();
        ps.close();
        return list;
    }

    // SEMUA DATA (UNTUK pesanan.jsp)
    public List<pesanan> getAllPesanan() throws SQLException {
        List<pesanan> list = new ArrayList<>();
        String sql = "SELECT * FROM pesanan ORDER BY id DESC";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            pesanan p = new pesanan();
            p.setId(rs.getInt("id"));
            p.setNama(rs.getString("nama"));
            p.setNoHp(rs.getString("no_hp"));
            p.setJenisKost(rs.getString("jenis_kost"));
            p.setLokasi(rs.getString("lokasi"));
            p.setTanggalMasuk(rs.getDate("tanggal_masuk"));
            p.setDurasi(rs.getInt("durasi"));
            p.setUsername(rs.getString("username"));
            p.setStatus(rs.getString("status"));
            list.add(p);
        }

        rs.close();
        st.close();
        return list;
    }
}
