package edu.hnu.csee.luo.model;

public class User implements ObjectInterface{

	private Integer userId;
	private String userName;
	private String userGroupId;
	private String departmentId;
	private String tel;
	private String email;
	private String userAuth;
	private String remark;
	private UserLogin userlogin;

	public UserLogin getUserLogin() {
		return userlogin;
	}
	public void setUserLogin(UserLogin userlogin) {
		this.userlogin = userlogin;
	}
	
	public Integer getStartIndex() {
		return startIndex;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	private Integer startIndex;
	private Integer pageSize;
	
	private Department dep;
	public Department getDep() {
		return dep;
	}
	public void setDep(Department dep) {
		this.dep = dep;
	}
	public int getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}

	public Pagination getPaging() {
			return paging;
	}

	public void setPaging(Pagination paging) {
			this.paging = paging;
	}

	private Pagination paging;
		
	public String getEmail() {
		return email;
	}
	public String getUserAuth() {
		return userAuth;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @param tele
	 */

	public String getUserGroupId() {
		return userGroupId;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public String getRemark() {
		return remark;
	}
	public void setUserGroupId(String userGroupId) {
		this.userGroupId = userGroupId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", userGroupId=" + userGroupId + ", departmentId="
				+ departmentId + ", tele=" + tel + ", email=" + email
				+ ", userAuth=" + userAuth + ", remark=" + remark + "]";
	}
}