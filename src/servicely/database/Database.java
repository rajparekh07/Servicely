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

    public Database() throws Exception {
        this.connect();
    }

    public static Database init() throws Exception {
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
        this.cleanUp();

        return result;
    }

    public Database query(String query) throws Exception {
        if( connection==null ) {
            this.connect();
        }
        System.out.println(query);
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

    private Database connect() throws Exception{
        connection = Database.getMySqlConnection();
        return this;
    }

}
