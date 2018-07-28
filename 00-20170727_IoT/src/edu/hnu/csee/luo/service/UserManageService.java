package edu.hnu.csee.luo.service;

import java.util.List;

import edu.hnu.csee.luo.dao.DepartmentDao;
import edu.hnu.csee.luo.dao.UserDao;
import edu.hnu.csee.luo.dao.UserLoginDao;
import edu.hnu.csee.luo.model.SensorNode;
import edu.hnu.csee.luo.model.User;
import edu.hnu.csee.luo.model.UserInfoChange;
import edu.hnu.csee.luo.model.UserLogin;
import edu.hnu.csee.luo.util.BaseUtil;

public class UserManageService {
	private User user;

	public User getUser() {
		return user;
	}
	private UserLogin userLogin;

	public void setUser(User user) {
		this.user = user;
	}

	public static UserDao userDao = (UserDao) BaseUtil.getBeanAppContext("userDao");
	public List<User> queryAllUserInfo(User user){
		
		return userDao.queryAllUserInfo( user);

	}
	
	 public Integer queryUserCount(User user){

			return userDao.queryUserCount(user);
		}
	
	 public List<User> queryUserInfo(User user){

			return userDao.queryUserInfo(user);
		}

		 public void insertOneUser(User user){
			
			userDao.insertOneUser(user);
		}
		 
		 public void deleteUserById(User user){

			userDao.deleteUserById(user);
		}
		 
		 public void updateUserInfo(User user){

			userDao.updateUserInfo(user);
		}

		public void editUserInfo(User user) {
			// TODO Auto-generated method stub
			userDao.editUserInfo(user);
		}

		public User queryUserInfoByUserId(User user) {
			// TODO Auto-generated method stub
			return userDao.queryUserInfoByUserId(user);
		}
}
