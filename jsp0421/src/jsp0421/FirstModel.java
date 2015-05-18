package jsp0421;

public class FirstModel {
	private int num;
	
	public FirstModel() {
		num = 20;
	}
	
	public String printMsg(String msg){
		return "당신이 입력한 메세지는:"+msg+"입니다."+"Num:"+num;
	}
	
	public int multiply(int a,int b){
		int c = a*b;
		return c;
	}
	
	public int add(int a,int b){
		int c = a+b;
		return c;
	}
	public int subtract(int a,int b){
		int c = a-b;
		return c;
	}
}
