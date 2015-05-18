package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.MyJndiContext;
import vo.ChaVO;

public class ChatDao {
	private static ChatDao dao;
	public static synchronized ChatDao getDao() {
		if(dao==null) dao=new ChatDao();
		return dao;
	}
	
	public void insertChat(ChaVO v){
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con=MyJndiContext.getDs();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into croom values(");
			sql.append("croom_seq.nextVal,?,?,sysdate,?)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, v.getU_id());
			pstmt.setString(2, v.getChat());
			pstmt.setString(3, v.getReip());
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<ChaVO> getList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ChaVO> list = new ArrayList<ChaVO>();
		try{
			con=MyJndiContext.getDs();
			StringBuffer sql = new StringBuffer();
			sql.append("select num,u_id,chat");
			sql.append(",to_char(cdate,'yyyy-mm-dd') cdate,reip from croom order by 1 desc");
			pstmt = con.prepareStatement(sql.toString());
			rs= pstmt.executeQuery();
			while(rs.next()){
				ChaVO v = new ChaVO();
				v.setNum(rs.getInt("num"));
				v.setU_id(rs.getString("u_id"));
				v.setChat(rs.getString("chat"));
				v.setCdate(rs.getString("cdate"));
				v.setReip(rs.getString("reip"));
				list.add(v);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
}
