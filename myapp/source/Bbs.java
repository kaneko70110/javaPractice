import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;

public class Bbs extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException
	{
		request.setCharacterEncoding("UTF-8");

		// 値の取得&設定
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String hp_address = request.getParameter("hp_address");
		String gender = request.getParameter("gender");
		String area = request.getParameter("area");
		String body = request.getParameter("body");
		String delete_key = request.getParameter("delete_key");
		// データベースへ保存
		try
		{
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
			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			// テーブル登録
			Statement stmt = con.createStatement ();
			String sql = "INSERT INTO bbs (title, name, hp_address, gender, area, body, delete_key, post_date) VALUES (";
			sql += "'" + title + "', ";
			sql += "'" + name + "', ";
			sql += "'" + hp_address + "', ";
			sql += "'" + gender + "', ";
			sql += "'" + area + "', ";
			sql += "'" + body + "', ";
			sql += "'" + delete_key + "', ";
			sql += "'" + sdf1.format(date) + "')";
			int num = stmt.executeUpdate(sql);
			// データベースのクローズ
			stmt.close();
			con.close();
System.out.println(sql);
		}
		catch (SQLException e)
		{
			System.err.println("SQL failed.");
			e.printStackTrace ();
		}
		catch (ClassNotFoundException ex)
		{
			ex.printStackTrace ();
		}
		// jspへ遷移
//		getServletConfig().getServletContext().getRequestDispatcher("/jsp/bbs.jsp").forward(request, response);
	}

}

