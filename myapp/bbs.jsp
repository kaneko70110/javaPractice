<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	background-color:	#FDFEE2;
}
h1, div, table {
	width:	700px;
	margin:	0 auto;
}
th {
	text-align:	right;
	padding:	5px;
}
td {
	padding:	5px;
}

table.list {
	border-collapse:	collapse;
}
.list thead td {
	background-color:	#66f;
	color:			#fff;
}
.list tbody td {
	background-color:	#dff;
}
</style>
<title>掲示板</title>
</head>
<body>
<h1>掲示板</h1>
<form method="post" action="bbs">
<table>
	<tr>
		<th>タイトル</th><td colspan="2"><input type="text" name="title"></td>
	</tr>
	<tr>
		<th>名前</th><td colspan="2"><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>HPアドレス</th><td colspan="2"><input type="text" name="hp_address"></td>
	</tr>
	<tr>
		<th>性別</th>
		<td colspan="2">
			<label><input type="radio" name="gender" value="1">男</label>
			<label><input type="radio" name="gender" value="0">女</label>
		</td>
	</tr>
	<tr>
		<th>地域</th>
		<td colspan="2">
			<select name="area">
				<option value="0"></option>
				<option value="1">北海道</option>
				<option value="2">東北</option>
				<option value="3">関東</option>
				<option value="4">中部</option>
				<option value="5">近畿</option>
				<option value="6">中国</option>
				<option value="7">四国</option>
				<option value="8">九州・沖縄</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>内容</th>
		<td colspan="2"><textarea name="body" rows="6"></textarea></td>
	</tr>
	<tr>
		<th>削除キー</th>
		<td><input type="text" name="delete_key"></td>
		<td style="text-align:right;"><input type="submit" value="OK"></td>
	</tr>
</table>
</form>
<hr>
<%
Connection con = null;

// JDBCドライバの登録
String driver = "org.postgresql.Driver";
// データベースの指定
String server   = "localhost";   // PostgreSQL サーバ ( IP または ホスト名 )
String dbname   = "postgres";         // データベース名
String url = "jdbc:postgresql://" + server + "/" + dbname;
String user     = "postgres";         //データベース作成ユーザ名
String password = "";     //データベース作成ユーザパスワード
try
{
	Class.forName(driver);
	// データベースとの接続
	con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	String sql = "SELECT * FROM bbs";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
		int id = rs.getInt("id");
		String title = rs.getString("title");
		String name = rs.getString("name");
		String hp_address = rs.getString("hp_address");
		int gender = rs.getInt("gender");
		String gender_name = "";
		switch (gender) {
			case 0:
				gender_name = "女";
				break;
			case 1:
				gender_name = "男";
				break;
		}
		String area = rs.getString("area");
		String body = rs.getString("body");
		String delete_key = rs.getString("delete_key");
		Timestamp post_date = rs.getTimestamp("post_date");
%>
<table class="list">
	<thead>
	<tr>
		<td>[<%= id %>]</td><td><%= title %></td><td><%= name %></td><td><%= hp_address %></td>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><%= gender_name %><td colspan="3"><%= post_date %></td>
	</tr>
	<tr>
		<td colspan="4" style="height:5em;"><%= body %></td>
	</tr>
</table>
<%
	}	
	rs.close();
	stmt.close();
}
catch (ClassNotFoundException e)
{
	out.println("ClassNotFoundException:" + e.getMessage());
}
catch (SQLException e)
{
	out.println("SQLException:" + e.getMessage());
}
catch (Exception e)
{
	out.println("Exception:" + e.getMessage());
}
finally
{
	try {
		if (con != null) {
			con.close();
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
}
%>
</body>
</html>

