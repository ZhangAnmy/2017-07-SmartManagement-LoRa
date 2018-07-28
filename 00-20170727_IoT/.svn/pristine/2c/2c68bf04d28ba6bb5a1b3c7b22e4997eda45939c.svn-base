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
import com.opensymphony.xwork2.util.finder.ClassFinder.Info;

import edu.hnu.csee.luo.model.Department;
import edu.hnu.csee.luo.model.Pagination;
import edu.hnu.csee.luo.model.SensorNode;
import edu.hnu.csee.luo.model.User;
import edu.hnu.csee.luo.model.UserInfoChange;
import edu.hnu.csee.luo.model.UserLogin;
import edu.hnu.csee.luo.service.DepartmentManageService;
import edu.hnu.csee.luo.service.SensorNodeManageService;
import edu.hnu.csee.luo.service.UserLoginService;
import edu.hnu.csee.luo.service.UserManageService; 
public class UserInfoChangeAction extends ActionSupport implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private UserLogin userlogin;
	private List<User> userList;
	private Department department;
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public UserLogin getUserlogin() {
		return userlogin;
	}
	public void setUserlogin(UserLogin userlogin) {
		this.userlogin = userlogin;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public static UserManageService  service= new UserManageService();
	public static UserLoginService  service2= new UserLoginService();
	public static DepartmentManageService service3= new DepartmentManageService();
	public static Logger log = Logger.getLogger(SensorNodeManageAction.class);	
	Map<String,Object> session =  ActionContext.getContext().getSession();
	public String editUserInfo(){
		userlogin= service2.queryPasswordByUsername(userlogin.getUsername());
		Integer UserId=userlogin.getUserId();
		if(UserId!=null){
			user.setUserId(userlogin.getUserId());
		}	
		service.editUserInfo(user);
		user=service.queryUserInfoByUserId(user);
		session.put("userName", userlogin.getUsername());
		session.put("password", userlogin.getPassword());
		session.put("realname", user.getUserName());
		session.put("department", user.getDepartmentId());
		session.put("tel", user.getTel());
		session.put("email", user.getEmail());
		session.put("remark", user.getRemark());
		setUserList(service.queryAllUserInfo(new User()));
		return "success";
	}
}

