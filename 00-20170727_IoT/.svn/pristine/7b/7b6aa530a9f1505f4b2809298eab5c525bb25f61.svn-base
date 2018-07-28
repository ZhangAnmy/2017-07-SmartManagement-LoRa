package edu.hnu.csee.luo.action;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hnu.csee.luo.model.Department;
import edu.hnu.csee.luo.model.User;
import edu.hnu.csee.luo.model.UserLogin;
import edu.hnu.csee.luo.service.DepartmentManageService;
import edu.hnu.csee.luo.service.UserLoginService;
import edu.hnu.csee.luo.service.UserManageService;

import java.util.Date;
import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

public class UserLoginAction extends ActionSupport implements Serializable{
    
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
    private User user;
    private Department department;
    public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public static Logger log = Logger.getLogger(SensorNodeManageAction.class);
    
	public String sayHello(){
	    
		String result = null;
		
		if(userLogin == null){
			result= "login";
		}
		else if(userLogin.getUsername().equals("username")){
			result= SUCCESS;
		}
		System.out.print(result);
		return result;
	
    }
	
	public String checkUserLogin(){
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	    System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		ActionContext actionContext = ActionContext.getContext(); 
		Map<String,Object> request = (Map) actionContext.get("request"); 
		String result = null;
		String respString = null;
		Map<String,Object> session =  ActionContext.getContext().getSession();
		if(null==userLogin.getUsername()||"".equals(userLogin.getUsername())){
			respString+="请输入登录名";
			request.put("LoginMsg",  respString); 
			return "login";
		}
		else if(null==userLogin.getPassword()||"".equals(userLogin.getPassword())){
			respString+="请输入密码";
			request.put("LoginMsg",  respString); 
			return "login";
		}
		UserLoginService service = new UserLoginService();
		UserManageService service2=new UserManageService();
		DepartmentManageService service3=new DepartmentManageService();
		UserLogin userLoginResp = service.queryPasswordByUsername(userLogin.getUsername());
		User user=new User();
		Department department=new Department();		
		user.setUserId(userLoginResp.getUserId());
		Integer Id= user.getUserId();
		String departRest=null;
		if(Id!=null){
			user=service2.queryUserInfoByUserId(user);		
		}	
		if(null==userLoginResp.getUsername()||"".equals(userLoginResp.getUsername()) ){
			respString+="用户名不存在";
			request.put("LoginMsg",  respString); 
			return "login";
		}
		if(userLoginResp.getPassword().equals(userLogin.getPassword())){
			recentTime=df.format(new Date());
			userLogin.setRecentTime(recentTime);
			service.updateUserLoginRTByUsername(userLogin.getUsername(),userLogin.getRecentTime());			
			//UserLogin userlist=service.queryPasswordByUsername(userLogin.getUsername());
			String userName = userLoginResp.getUsername();
			String password=userLoginResp.getPassword();
			session.put("userName", userName);
			session.put("password", password);
			session.put("realname", user.getUserName());
			session.put("department", user.getDepartmentId());
			session.put("tel", user.getTel());
			session.put("email", user.getEmail());
			session.put("remark", user.getRemark());
			result = "success"; 
			return result;
		}

		log.info("**return login...**");
		result = "login";
		return result;
    }
}
