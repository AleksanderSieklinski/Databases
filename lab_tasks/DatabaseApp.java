import java.sql.*;

public class DatabaseApp {
    private Connection conn;
    public DatabaseApp(String dbUrl, String user, String password) throws SQLException {
        conn = DriverManager.getConnection(dbUrl, user, password);
        System.out.println("Connected to the PostgreSQL server successfully.");
    }
    public void CreateSequence(String name) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement("CREATE SEQUENCE ?");
        stmt.setString(1, name);
        stmt.executeUpdate();
        System.out.println("Created sequence " + name + " successfully.");
    }
    public void insertData(String table, String columns, String values) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement("INSERT INTO + " + table + " (?) VALUES (?)");
        stmt.setString(1, columns);
        stmt.setString(2, values);
        stmt.executeUpdate();
        System.out.println("Inserted data into " + table + " successfully.");
    }
    public void deleteData(String table, String condition) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement("DELETE FROM " + table + " WHERE ?");
        stmt.setString(2, condition);
        stmt.executeUpdate();
        System.out.println("Deleted data from " + table + " successfully.");
    }
    public void updateData(String table, String values, String condition) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement("UPDATE " + table + " SET ? WHERE ?");
        stmt.setString(1, values);
        stmt.setString(2, condition);
        stmt.executeUpdate();
        System.out.println("Updated data in " + table + " successfully.");
    }
    public void readData(String table) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM " + table);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            System.out.println(rs.getString("id"));
            System.out.println(rs.getString("lname"));
            System.out.println(rs.getString("fname"));
        }
        System.out.println("Read data from " + table + " successfully.");
    }
    public static void main(String[] args) {
        try {
            DatabaseApp app = new DatabaseApp("jdbc:postgresql://localhost:5432/u1sieklinski", "u1sieklinski", "1sieklinski");
            //app.CreateSequence("lab11.osoba_id_seq");
            //app.insertData("lab11.osoba", "lname, fname", "'Marek', 'Januszkiewicz'");
            //app.updateData("lab11.osoba", "lname='Marek'", "id=2");
            app.readData("lab11.osoba");
            //app.deleteData("lab11.osoba", "id>0");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}