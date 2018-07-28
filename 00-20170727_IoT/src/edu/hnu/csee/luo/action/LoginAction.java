package edu.hnu.csee.luo.action;
import java.io.Serializable;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hnu.csee.luo.model.UserLogin;
import edu.hnu.csee.luo.service.UserLoginService;

import java.util.Date;
import java.text.SimpleDateFormat;

public class LoginAction extends ActionSupport implements Serializable{
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public UserLogin getUserLogin() {
		return userLogin;
	}
	public void setUserLogin(UserLogin userLogin) {
		this.userLogin = userLogin;
	}
	
	/*
    *封装用户请求参数
    *提供getter和setter方法
    */
    private UserLogin userLogin ;
	private String recentTime;
	
	public String checkUserLogin(){
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	    System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		
		String result = null;
		String respString = null;
		
		if(userLogin.getUsername() == null||userLogin.getUsername().equals("")){
			respString+="请输入登录名";
			return "login";
		}
		if(userLogin.getPassword()==null||userLogin.getPassword().equals("") ){
			respString+="请输入密码";
			return "login";
		}
		
		UserLoginService service = new UserLoginService();
		UserLogin userLoginResp = service.queryPasswordByUsername(userLogin.getUsername());
		
		if(userLoginResp.getPassword()==null||userLoginResp.getPassword().equals("") ){
			respString+="输入密码错误";
			return "login";
		}
		System.out.println("password is:"+userLogin.getPassword());
		
		if(userLoginResp.getPassword().equals(userLogin.getPassword())){
			recentTime=df.format(new Date());
			System.out.println(userLogin.getUsername()+" login at "+recentTime);
			userLogin.setRecentTime(recentTime);
			result = "success";  
			return result;
		}
		        
		result = "login";
		return result;
    }
}
