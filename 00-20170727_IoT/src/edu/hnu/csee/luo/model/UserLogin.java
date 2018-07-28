package edu.hnu.csee.luo.model;

public class UserLogin implements ObjectInterface {
	
	private int userId;
	private String userName;
	private String password;
	private String recentTime;
    private String remark;
	
    public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUsername(String userName) {
		this.userName = userName;
	}
	
	public String getUsername() {
		return userName;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}
	
    public void setRecentTime(String recentTime) {
		this.recentTime = recentTime;
	}
    
    public String getRecentTime() {
		return recentTime;
	}

    public void setRemark(String remark) {
		this.remark = remark;
	}
    
	public String getRemark() {
		return remark;
	}
}
