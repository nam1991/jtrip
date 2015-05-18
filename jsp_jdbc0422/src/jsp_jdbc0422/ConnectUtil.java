package jsp_jdbc0422;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectUtil {
		//static초기화는 메인메서드보다 가장 먼저 실행이 됨!
	static{
		try{
			//오라클사에서 제공하는 ojdbc6.jar에서 오라클을 접속하기 위해서
			// 드라이버를 로딩한다.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	//Connection객체는 오라클을 접속하기 위해서는 
	//conn 사용자/비번 형식으로 로그인 하는 것을
	//대신해 주는 메서드를 만들어서 제공
	public static Connection getConn() throws SQLException{
		//jdbc:oracle:thin:  - 오라클 protocol(고정)
		//@localhost - host
		//1521 - port
		//xe - sid
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kosta97";
		String password = "test09";
		//DrinverManager를 통해서 위의 3가지 값을 인자로 전달하면
		//OracleDriver를 통해서 실제 오라클 서버에 접속을 함.
		try{
		return DriverManager.getConnection(url,user,password);
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
}
