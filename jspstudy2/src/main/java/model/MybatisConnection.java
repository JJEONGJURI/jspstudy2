package model;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConnection {  //클래스정보 로드되자마자 static 밑부터 sqlMap 까지 작업함?
	private MybatisConnection() {}
	private static SqlSessionFactory sqlMap;
	//static 초기화 블럭은 메인보다먼저 실행
	//static 초기화 블럭의 기능 : static 변수(sqlMap)의 초기화를 담당한다. 
	static { //MybatisConnection 클래스가 메모리에 로드 될때 실행되는 블럭
		String resource = "model/mapper/mybatis-config.xml";
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream(resource);
		} catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static SqlSession getConnection( ) {
		return sqlMap.openSession();
	}
	public static void close(SqlSession session) {
		session.commit();
		session.close();
		
	}
}
