package servicely;


import servicely.database.Database;
import servicely.database.QueryHelper;

import java.util.ArrayList;
import java.util.List;

public class Startup {

    public static String start () {

        try{
            migrate();

        } catch (Exception e) {
            return e.getMessage();
        }
        return "true";
    }

    private static boolean migrate() throws Exception {
        String query;

        List<String> queries = new ArrayList<>();

         query = QueryHelper.createTable("users", "(" +
                "id int UNSIGNED AUTO_INCREMENT PRIMARY KEY," +
                "name VARCHAR(100) NOT NULL," +
                "email VARCHAR(100) UNIQUE NOT NULL," +
                "mobile_number VARCHAR(10) NOT NULL," +
                "password VARCHAR(50) NOT NULL" +
                ")");

         queries.add(query);

        query = QueryHelper.createTable("devices", "(" +
                "id int UNSIGNED AUTO_INCREMENT PRIMARY KEY," +
                "name VARCHAR(100) NOT NULL," +
                "type VARCHAR(100) UNIQUE NOT NULL" +
                ")");
        queries.add(query);

        query = QueryHelper.createTable("services", "(" +
                "id int UNSIGNED AUTO_INCREMENT PRIMARY KEY," +
                "name VARCHAR(100) NOT NULL" +
                ")");
        queries.add(query);

        query = QueryHelper.createTable("contracts", "(" +
                "id int UNSIGNED AUTO_INCREMENT PRIMARY KEY," +
                "name VARCHAR(100) NOT NULL," +
                "device_id int unsigned, " +
                    "FOREIGN KEY (device_id) REFERENCES devices (id) ON DELETE CASCADE ON UPDATE CASCADE," +
                "user_id int unsigned, " +
                    "FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE" +
                ")");
        queries.add(query);

        query = QueryHelper.createTable("device_service", "(" +
                "id int UNSIGNED AUTO_INCREMENT PRIMARY KEY," +
                "cost FLOAT NOT NULL," +
                "device_id int unsigned, " +
                    "FOREIGN KEY (device_id) REFERENCES devices (id) ON DELETE CASCADE ON UPDATE CASCADE," +
                "service_id int unsigned, " +
                    "FOREIGN KEY (service_id) REFERENCES services (id) ON DELETE CASCADE ON UPDATE CASCADE" +
                ")");
        queries.add(query);

        query = QueryHelper.createTable("address", "(" +
                "id int UNSIGNED AUTO_INCREMENT PRIMARY KEY," +
                "address VARCHAR(255) NOT NULL," +
                "user_id int unsigned, " +
                    "FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE" +
                ")");
        queries.add(query);

        query = QueryHelper.createTable("orders", "(" +
                "id int UNSIGNED AUTO_INCREMENT PRIMARY KEY," +
                "device_service_id int unsigned, " +
                    "FOREIGN KEY (device_service_id) REFERENCES device_service (id) ON DELETE CASCADE ON UPDATE CASCADE," +
                "user_id int unsigned, " +
                    "FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE" +
                ")");
        queries.add(query);

        for(String q : queries) {

            Database.init().query(q).fireUpdate();
        }

        return true;
    }

    public static boolean seed() throws Exception{

        userSeeder();



        return true;
    }

    private static void userSeeder() {

        List<String> queries = new ArrayList<>();

        String query;

        query = "";

    }


}
