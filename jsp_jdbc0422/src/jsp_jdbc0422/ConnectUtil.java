package jsp_jdbc0422;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectUtil {
		//static�ʱ�ȭ�� ���θ޼��庸�� ���� ���� ������ ��!
	static{
		try{
			//����Ŭ�翡�� �����ϴ� ojdbc6.jar���� ����Ŭ�� �����ϱ� ���ؼ�
			// ����̹��� �ε��Ѵ�.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	//Connection��ü�� ����Ŭ�� �����ϱ� ���ؼ��� 
	//conn �����/��� �������� �α��� �ϴ� ����
	//����� �ִ� �޼��带 ���� ����
	public static Connection getConn() throws SQLException{
		//jdbc:oracle:thin:  - ����Ŭ protocol(����)
		//@localhost - host
		//1521 - port
		//xe - sid
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kosta97";
		String password = "test09";
		//DrinverManager�� ���ؼ� ���� 3���� ���� ���ڷ� �����ϸ�
		//OracleDriver�� ���ؼ� ���� ����Ŭ ������ ������ ��.
		try{
		return DriverManager.getConnection(url,user,password);
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
}
