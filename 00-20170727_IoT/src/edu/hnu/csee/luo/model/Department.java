package edu.hnu.csee.luo.model;

public class Department {
	private Integer id;
	private String departmentId;
	private String departmentName;
	private String address;
	private String tel;
	private Integer peopleNum;
	private String remark;
	private Pagination paging;
	

	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Pagination getPaging() {
		return paging;
	}

	public void setPaging(Pagination paging) {
		this.paging = paging;
	}
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getDepartmentId() {
		return departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public String getAddress() {
		return address;
	}
	public String getTel() {
		return tel;
	}
	public Integer getPeopleNum() {
		return peopleNum;
	}
	public String getRemark() {
		return remark;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setPeopleNum(Integer peopleNum) {
		this.peopleNum = peopleNum;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
