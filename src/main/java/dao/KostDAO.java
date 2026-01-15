package dao;

import config.koneksi;
import model.Kost;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class KostDAO {

    // Method Simpan yang dicari Servlet
    public void simpan(Kost k) {
        String sql = "INSERT INTO kost (nama_kost) VALUES (?)";
        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, k.getNamaKost());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method Ubah yang dicari Servlet
    public void ubah(Kost k) {
        String sql = "UPDATE kost SET nama_kost=? WHERE id=?";
        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, k.getNamaKost());
            ps.setInt(2, k.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method Hapus yang dicari Servlet
    public void hapus(int id) {
        String sql = "DELETE FROM kost WHERE id=?";
        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Kost> getAll() {
        List<Kost> list = new ArrayList<>();
        String sql = "SELECT * FROM kost ORDER BY id";
        try (Connection con = koneksi.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Kost k = new Kost();
                k.setId(rs.getInt("id"));
                k.setNamaKost(rs.getString("nama_kost"));
                list.add(k);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}