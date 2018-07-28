package edu.hnu.csee.luo.dao;

import java.util.List;

import edu.hnu.csee.luo.model.User;
import edu.hnu.csee.luo.model.UserInfoChange;

public interface UserDao extends ObjectDaoInterface{
	 public User queryUserInfoByName(User user) ; 
	 public List<User> queryUsersInfoByGroup(User user);
	 public List<User> queryAllUserInfo(User user);
	 public List<User> queryUserInfo(User user);
	 public void insertOneUser(User user);
	 public void deleteUserById(User user);
	 public void updateUserInfo(User user);
	 public Integer queryUserCount(User user);
	 public void editUserInfo(User user);
	public User queryUserInfoByUserId(User user);
}


