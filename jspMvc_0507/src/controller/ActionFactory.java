package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import oracle.net.aso.r;
import action.Action;
import action.IndexAction;


public class ActionFactory {
	private static ActionFactory af;
	private String cmd,url;
	private Properties prop;
	
	
	public static synchronized ActionFactory getaa(){ 
		//서블릿은 스레드들로 이루어져 있음. 서블릿이 접근하니깐 동시성 문제 해결을위해 싱크로나이즈해준다.
		if(af ==null) af= new ActionFactory();
		return af; 
	}
	public ActionFactory(){
		prop = new Properties();
	}
	
	public Action getCmd(String cmd){
		Action action = null;
		try{
			prop.load(new FileInputStream("C:\\kosta97\\webapp\\workspace\\jspMvc_0507\\WebContent\\classinfo.properties"));
			System.out.println("key :"+prop.getProperty("index")); //value값을 가져와서 rPath에 넣어준다.
			String rPath = prop.getProperty(cmd);
			
			System.out.println("kk:"+rPath);
			if(rPath == null){
				cmd = "index";
				rPath = prop.getProperty(cmd);
			}
			
			Class<Action> handlerClass = 
					(Class<Action>) Class.forName(rPath); //rPath경로를 클래스화 하고
			action = handlerClass.newInstance();//다시 객체화 시킴.
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		return action;
	}
}
