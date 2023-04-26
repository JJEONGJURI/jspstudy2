package model;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberMybatisDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String,Object> map = new HashMap<>();
	public boolean insert(Member mem) { // Member는 join.jsp 에서 채웠다
		SqlSession session = MybatisConnection.getConnection();
		//session은 MybatisConnection 클래스가 메모리에 로드 되는 순간 실행된다
		try {
			int cnt = session.getMapper(cls).insert(mem);
			if (cnt > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}

	public Member selectOne(String id) { // 입력된 id값
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectOne(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}

	public boolean update(Member mem) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).update(mem);
			return cnt > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}

	public List<Member> list() {
		SqlSession session = MybatisConnection.getConnection();
		try {
			return session.getMapper(cls).list(null); //매개변수 없고 전체 목록 다 조회해
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}

	public boolean delete(String id) {
		SqlSession session = MybatisConnection.getConnection();
		
		try {
			int cnt = session.getMapper(cls).delete(id);
			return cnt > 0; // 한레코드는 삭제가 됐다?
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}

	public String idSearch(String email, String tel) {
		SqlSession session = MybatisConnection.getConnection();
		try {			
			return session.getMapper(cls).idSearch(email,tel);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}

	public String pwSearch(String id, String email, String tel) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			map.put("email", email);
			map.put("tel", tel);
			return session.getMapper(cls).pwSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null; // 없으면 넘어감
	}

	public boolean updatePass(String id, String pass) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).updatePass(id,pass);
			return cnt > 0; // true : 변경된 레코드 존재 //executeUpdate()=0 변경된게 없다
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return false;
	}

	public String idchk(String id) {
		SqlSession session = MybatisConnection.getConnection();
	
		try {
			return session.getMapper(cls).idchk(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;

	}
	public List<Member> selectEmail(String[] ids) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("ids", ids);
			return session.getMapper(cls).list(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return null;
	}

}


