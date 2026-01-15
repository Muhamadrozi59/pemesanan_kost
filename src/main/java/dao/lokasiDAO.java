package dao;

import config.koneksi;
import model.lokas;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class lokasiDAO {

    // 1. Ambil Semua Data (Sudah Anda buat, saya rapikan sedikit)
    public List<lokas> getAll() {
        List<lokas> list = new ArrayList<>();
        String sql = "SELECT * FROM lokasi ORDER BY id ASC";
        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lokas l = new lokas();
                l.setId(rs.getInt("id"));
                l.setNama(rs.getString("nama"));
                list.add(l);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Simpan Lokasi Baru
    public void simpan(lokas l) {
        String sql = "INSERT INTO lokasi (nama) VALUES (?)";
        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, l.getNama());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 3. Ubah Nama Lokasi
    public void ubah(lokas l) {
        String sql = "UPDATE lokasi SET nama=? WHERE id=?";
        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, l.getNama());
            ps.setInt(2, l.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 4. Hapus Lokasi
    public void hapus(int id) {
        String sql = "DELETE FROM lokasi WHERE id=?";
        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}