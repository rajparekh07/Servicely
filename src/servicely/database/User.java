package servicely.database;

import java.sql.ResultSet;


public class User extends Model{

    protected static String TABLE_NAME = "users";

    public int id;

    public String name;

    public String email;

    public String mobileNumber;

    public String password;

    public User() {

    }

    public User(String name, String email, String mobileNumber, String password) {

        this.name = name;
        this.email = email;
        this.mobileNumber = mobileNumber;
        this.password = password;
    }

    public User(int id, String name, String email, String mobileNumber, String password) {

        this.id = id;
        this.name = name;
        this.email = email;
        this.mobileNumber = mobileNumber;
        this.password = password;
    }

    public static User findUser(int id) {
        User user = null;
        try {
            ResultSet rs = find(id);
            rs.first();
            user = new User(rs.getInt("id"), rs.getString("name"),rs.getString("email") , rs.getString("mobile_number"), rs.getString("password"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public int save() throws Exception {

        String query = "INSERT INTO "+TABLE_NAME+ "(name, email, mobile_number, password) VALUES " +
                "(" + this.name + "," +
                this.email + "," +
                this.mobileNumber + "," +
                this.password + ")";
        return Database.init().query(query).fireUpdate();
    }


}
