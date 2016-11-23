import java.sql.*;
class DbTest {
    public static void main(String[] args) {
        int id;
        String name;
        try {
            // JDBCドライバの登録
            String driver = "org.postgresql.Driver";
            // データベースの指定
            String server   = "localhost";   // PostgreSQL サーバ ( IP または ホスト名 )
            String dbname   = "postgres";         // データベース名
            String url = "jdbc:postgresql://" + server + "/" + dbname;
            String user     = "postgres";         //データベース作成ユーザ名
            String password = "";     //データベース作成ユーザパスワード
            Class.forName (driver);
            // データベースとの接続
            Connection con = DriverManager.getConnection(url, user, password);
            // テーブル照会実行
            Statement stmt = con.createStatement ();
            String sql = "SELECT * FROM testtbl";
            ResultSet rs = stmt.executeQuery (sql);
            // テーブル照会結果を出力
	    int counter = 0;
            while(rs.next()){
               id = rs.getInt("num");
               name = rs.getString("name");
               System.out.println("ID：" + id);
               System.out.println("名前：" + name);
	       counter++;
            }
	    if (counter == 0) {
	       System.out.println("empty!!!");
	    }
            // データベースのクローズ
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            System.err.println("SQL failed.");
            e.printStackTrace ();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace ();
        }
    }
}

