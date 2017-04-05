package servicely.database;

import java.sql.ResultSet;

public class Service extends Model{
    protected static String TABLE_NAME = "device";

    public int id;

    public String name;


    public Service() {

    }

    public Service(String name) {

        this.name = name;

    }

    public Service(int id, String name) {

        this.id = id;
        this.name = name;


    }

    public static Service findService(int id) {
        Service user = null;
        try {
            ResultSet rs = find(id);
            rs.first();
            user = new Service(rs.getInt("id"), rs.getString("name"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public int save() throws Exception {

        String query = "INSERT INTO "+TABLE_NAME+ "(name) VALUES " +
                "(" + this.name + ")";
        return Database.init().query(query).fireUpdate();
    }

}
