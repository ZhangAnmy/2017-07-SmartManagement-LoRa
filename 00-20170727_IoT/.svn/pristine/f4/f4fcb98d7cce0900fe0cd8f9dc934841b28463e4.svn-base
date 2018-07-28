package edu.hnu.csee.luo.action;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hnu.csee.luo.model.Pagination;
import edu.hnu.csee.luo.model.SensorNode;
import edu.hnu.csee.luo.model.User;
import edu.hnu.csee.luo.model.UserLogin;
import edu.hnu.csee.luo.service.SensorNodeManageService;
import edu.hnu.csee.luo.service.UserLoginService;
import edu.hnu.csee.luo.service.UserManageService;


public class UserPwdChangeAction extends ActionSupport implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserLogin userlogin;
	
	private User user;
	
	public void setUserLogin(UserLogin userlogin)
	{
		this.userlogin = userlogin;
	}
	public UserLogin getUserLogin()
	{
		return userlogin;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public static UserLoginService  service= new UserLoginService();
	public static Logger log = Logger.getLogger(UserPwdChangeAction.class);
	
	
	public String editUserInfo(){
		//service.updateUserInfo(user);
		log.info("user name is:"+userlogin.getUsername());
		log.info("the password is:  "+userlogin.getPassword());
		service.updateUserPwdInfo(userlogin);
		return "success";
	}
	public UserLogin getUserlogin() {
		return userlogin;
	}
	public void setUserlogin(UserLogin userlogin) {
		this.userlogin = userlogin;
	}
	
}
