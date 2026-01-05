package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class koneksi {

    private static final String URL =
        "jdbc:postgresql://localhost:5432/kost_db";
    private static final String USER = "postgres";
    private static final String PASS = "Biyao!@#";

    public static Connection getConnection() {
        try {
            // WAJIB
            Class.forName("org.postgresql.Driver");

            Connection con =
                DriverManager.getConnection(URL, USER, PASS);

            System.out.println("KONEKSI DATABASE BERHASIL");
            return con;

        } catch (Exception e) {
            System.out.println("Koneksi gagal: " + e.getMessage());
            return null;
        }
    }
}
