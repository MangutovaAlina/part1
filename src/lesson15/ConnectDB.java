package lesson15;

import java.sql.*;

/** класс для удобного коннекта к БД
 */
public class ConnectDB  {
    private static String url = "jdbc:postgresql://localhost:5432/postgres";
    private static String bd = "postgres";
    private static String password = "InnopolisBD";

    /** метод коннекции к БД
     *  @return
     */
    public static Connection connectDB()  {
        Connection connection = null;

        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, bd, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }
}

