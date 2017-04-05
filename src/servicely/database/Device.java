package servicely.database;

import java.sql.ResultSet;

public class Device extends Model{

    protected static String TABLE_NAME = "device";

    public int id;

    public String name;

    public String type;

    public Device() {

    }

    public Device(String name, String type) {

        this.name = name;
        this.type = type;
    }

    public Device(int id, String name, String type) {

        this.id = id;
        this.name = name;
        this.type = type;

    }

    public static Device findDevice(int id) {
        Device user = null;
        try {
            ResultSet rs = find(id);
            rs.first();
            user = new Device(rs.getInt("id"), rs.getString("name"),rs.getString("type"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public int save() throws Exception {

        String query = "INSERT INTO "+TABLE_NAME+ "(name, type) VALUES " +
                "(" + this.name + "," +
                this.type + ")";
        return Database.init().query(query).fireUpdate();
    }

}
