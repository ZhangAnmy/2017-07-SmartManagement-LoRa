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
import edu.hnu.csee.luo.service.UserManageService;

public class UserManageAction extends ActionSupport implements Serializable{
	
	private Pagination paging;
	public Pagination getPaging() {
		return paging;
	}
	
	public void setPaging(Pagination paging) {
		this.paging = paging;
	}
	
	private UserLogin userlogin;
	public void setUserLogin(UserLogin userlogin)
	{
		this.userlogin = userlogin;
	}
	public UserLogin getUserLogin()
	{
		return userlogin;
	}
	private User user;
	public User getUser() {
		return user;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	private List<User> userList;
	
	public static 	UserManageService  service= new UserManageService();
	public static Logger log = Logger.getLogger(SensorNodeManageAction.class);
	
	public String addUser(){
		init();
		service.insertOneUser(user);
		return "success";
	}
	
	public String editUserInfo(){
		service.updateUserInfo(user);
		return "success";
	}
	
	public String deleteUser(){
		
		service.deleteUserById(user);
		return "success";
	}
	
	Map<String,Object> session =  ActionContext.getContext().getSession();
	
	public void init(){
		 if(user==null){
			 log.info("本地user没有传入数值，初始化user");
			 user = new User();
		 }

	}
	public void pageHandle(){
		
		 if(paging==null){
			 log.info("paging没有传入数值，初始化paging");
			 paging = new Pagination();
		 }
		 if( paging.getCurrentPage()==null){
			 log.info("当前页面为空，设置当前页为1");
			 paging.setCurrentPage(1);
		 }

	}
	private Map<String, Object> dataMap;
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	private String result;
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void pageHandleAfter(){
		
	}
	/*
	 * @desc 查询所有用户信息
	 * @author
	 */
	public String queryAllUser(){
		log.info("查询所有节点信息开始");
		Map request = (Map)ActionContext.getContext().get("request");
		log.info("查找已保存的条件");
		userList = service.queryAllUserInfo(user);

		Map<String, Object> dataMap1 = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(User userTemp:userList){
			Map m =  new HashMap<String, Object>();
			m.put("user", userTemp);
			list.add(m);
		}
		dataMap1.put("list", list);
		this.setDataMap(dataMap1);
		JSONObject jsonOject = JSONObject.fromObject(dataMap1);
		JSONArray jsonArray = JSONArray.fromObject(dataMap1);
		

		dataMap1.put("jsonArray", jsonOject.toString());
		
		log.info(jsonOject.toString());
		result = jsonOject.toString();
		return "success";
	}
	
	public String queryUserInfo(){
		log.info("带条件的节点查询开始");
	
		pageHandle();
		 if(user==null || user.equals("")){
			 log.info("本地user没有传入数值，初始化user");
			 user = new User();
			/*if(session.get("Condition")!=null){
				user=(User) session.get("Condition");
			}*/
		}
		paging.setRows(service.queryUserCount(user));
		user.setPaging(paging);
		this.setUserList(service.queryUserInfo(user));
		log.info("保留查询条件:"+user.toString());
		session.put("Condition", user);
		setPaging(paging);
		return "success";
	}
	
	public String queryUserEntity(){
		log.info("带条件的节点查询开始");
		pageHandle();
		 if(user==null || user.equals("")){
			 log.info("本地user没有传入数值，初始化user");
			 user = new User();
		}
		paging.setRows(service.queryUserCount(user));
		user.setPaging(paging);
		userList = service.queryUserInfo(user);
		log.info("保留查询条件:"+user.toString());
		setPaging(paging);
		JSONArray jsonArray = JSONArray.fromObject(userList);
		result = jsonArray.toString();
		
		log.info("entity页面从后台取出的数据为"+result);
		
		return "success";
	}
}
