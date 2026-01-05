package dao;

import config.koneksi;
import model.Kost;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class KostDAO {

    public List<Kost> getAll() {
        List<Kost> list = new ArrayList<>();
        String sql = "SELECT * FROM kost ORDER BY id";

        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

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

    public Kost getById(int id) {
        Kost k = new Kost();
        String sql = "SELECT * FROM kost WHERE id=?";

        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                k.setId(rs.getInt("id"));
                k.setNamaKost(rs.getString("nama_kost"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }

    public void delete(int id) {
        String sql = "DELETE FROM kost WHERE id=?";

        try (Connection con = koneksi.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
