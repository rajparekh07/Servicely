package servicely.database;

import servicely.utils.Escaper;

import java.sql.ResultSet;

public abstract class Model {

    protected static String TABLE_NAME;

    public static ResultSet find(int id) throws Exception{
        String query = "SELECT * FROM " + TABLE_NAME + " WHERE `id` = "+id;
        return Database.init().query(query).fireSelect();
    }

    public static ResultSet all() throws Exception {
        String query = "SELECT * FROM " + TABLE_NAME;
        return Database.init().query(query).fireSelect();
    }

    public static ResultSet where(String columnName, String val) throws Exception {

        columnName = Escaper.escapeString(columnName);

        val = Escaper.escapeString(val);

        String query = "SELECT * FROM " + TABLE_NAME  + "WHERE `" + columnName + "` = '" + val + "'";
        return Database.init().query(query).fireSelect();
    }

    abstract public int save() throws Exception;


}
