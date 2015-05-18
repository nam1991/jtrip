package conn;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import oracle.jdbc.pool.OracleDataSource;

public class MyJndiContext {
	private static OracleDataSource ds;
	static{
		try {
			//context.xml 의 Context를 읽어 오기 위한 객체를 생성한다.
			InitialContext ctx = new InitialContext();
			// Resource 의  name값을 읽어 내어와서 OracleDataSource객체로 반환
			ds = (OracleDataSource) ctx.lookup("java:comp/env/jdbc/myora");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getDs() throws SQLException {
		return ds.getConnection();
	}
	
	
	
	
	
	

}
