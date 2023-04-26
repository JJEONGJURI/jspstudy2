package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnection {
	private DBConnection() {} //외부에서 객체 생성 못함
	static Connection getConnection() { //static이 붙으면 class.함수명으로 호출
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/gdudb","gdu","1234");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	} //getConnection 메서드 종료
	static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	} //close 메서드 종료
} //class 종료
