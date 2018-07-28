package edu.hnu.csee.luo.service;

import edu.hnu.csee.luo.dao.SensorNodeDao;
import edu.hnu.csee.luo.dao.UserLoginDao;
import edu.hnu.csee.luo.model.UserLogin;
import edu.hnu.csee.luo.util.BaseUtil;

public class UserLoginService {
	
public UserLogin queryPasswordByUsername(String username){
		
		String beanName = "userLoginDao";
		UserLoginDao userLoginDao= (UserLoginDao) BaseUtil.getBeanAppContext(beanName);
		UserLogin userLogin = new UserLogin();
		userLogin.setUsername(username);
		return userLoginDao.queryPasswordInfoByUsername(userLogin);
	}

public void updateUserLoginRTByUsername(String username,String recentTime){
		String beanName = "userLoginDao";
		UserLoginDao userLoginDao = (UserLoginDao) BaseUtil.getBeanAppContext(beanName);
		UserLogin userLogin = new UserLogin();
		userLogin.setUsername(username);
		userLogin.setRecentTime(recentTime);
		userLoginDao.updateUserLoginRTByUsername(userLogin);
	}

public void addUserLoginById(UserLogin userLogin){
		String beanName = "userLoginDao";
		UserLoginDao userLoginDao= (UserLoginDao) BaseUtil.getBeanAppContext(beanName);
		userLoginDao.addUserLoginById(userLogin);
	}

public void deleteUserLoginById(UserLogin userLogin){
	String beanName = "userLoginDao";
	UserLoginDao userLoginDao= (UserLoginDao) BaseUtil.getBeanAppContext(beanName);
	userLoginDao.deleteUserLoginById(userLogin);
	}

public void updateUserPwdInfo(UserLogin userlogin) {
	// TODO Auto-generated method stub
	String beanName = "userLoginDao";
	UserLoginDao userLoginDao= (UserLoginDao) BaseUtil.getBeanAppContext(beanName);
	userLoginDao.updateUserPwdInfo(userlogin);
	}
}
