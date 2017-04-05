package servicely.database;

/**
 * Created by Administrator on 05-Apr-17.
 */
public class QueryHelper {

    public static String createTable(String tableName, String fields) {

        return "CREATE TABLE IF NOT EXISTS " + tableName + " " + fields;
    }


}
