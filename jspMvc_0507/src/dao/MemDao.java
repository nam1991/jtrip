package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemVO;
import conn.MyJndiContext;

public class MemDao {
	private static MemDao dao;
	
	public synchronized static MemDao getDao(){
		if(dao == null){
			dao = new MemDao();
		}
		return dao;
	}
	
	public int login(MemVO v) throws SQLException{
		
		int count = 0;
		ArrayList<MemVO> arlist = new ArrayList<MemVO>();
		Connection con = MyJndiContext.getDs();
		StringBuffer sql= new StringBuffer();
		sql.append("select count(*) cnt from member where id=? and pwd=?");
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		System.out.println("dao ~"+v.getId());
		System.out.println("dao ~"+v.getPwd());
		pstmt.setString(1, v.getId());
		pstmt.setString(2, v.getPwd());
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			count =rs.getInt("cnt");
		}
		rs.close();
		pstmt.close();
		con.close();
		return count;
	}

}
