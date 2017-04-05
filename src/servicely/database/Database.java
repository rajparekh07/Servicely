package servicely.database;
import java.sql.*;
import java.util.List;

public class Database {
    private Connection connection;

    private PreparedStatement statement;


    public static Connection getMySqlConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/test", "root", "");
    }

    public Database() {
        this.connect();
    }

    public static Database init() {
        Database db = new Database();
        return db;
    }

    public ResultSet fireSelect() {

        ResultSet resultSet = null;
        try {
            resultSet = this.statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.cleanUp();
        return resultSet;
    }

    private void cleanUp() {
        try {
            if (this.statement != null) {
                this.statement.close();
            }
            if (this.connection != null) {
                this.connection.close();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int fireUpdate() {
        int result = 0;
        try {
            result = this.statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public Database query(String query) {
        if( connection==null ) {
            this.connect();
        }

        this.createStatement(query);

        return this;
    }

    private Database createStatement(String query) {

        try {
            this.statement = connection.prepareStatement(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return this;
    }

    private Database connect() {
        try {
            connection = Database.getMySqlConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this;
    }

}
