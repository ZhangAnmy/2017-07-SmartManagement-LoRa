package edu.hnu.csee.luo.model;



public class Entity {
	private Integer id;
    private Integer entityId;
    private Integer userId;
    private String entityType;

    private String statusType;

    private String entityStatus;

    private Double longitude;

    private Double latitude;

    private String area;

    private String streetAddress;

    private String detailAddress;

    private String remark;

    private User user;
    
    private Pagination paging;
    
	public Pagination getPaging() {
		return paging;
	}

	public void setPaging(Pagination paging) {
		this.paging = paging;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public Integer getEntityId() {
		return entityId;
	}

	public Integer getUserId() {
		return userId;
	}

	public String getEntityType() {
		return entityType;
	}

	public String getStatusType() {
		return statusType;
	}

	public String getEntityStatus() {
		return entityStatus;
	}

	public Double getLongitude() {
		return longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public String getArea() {
		return area;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public String getRemark() {
		return remark;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setEntityId(Integer entityId) {
		this.entityId = entityId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public void setEntityType(String entityType) {
		this.entityType = entityType;
	}

	public void setStatusType(String statusType) {
		this.statusType = statusType;
	}

	public void setEntityStatus(String entityStatus) {
		this.entityStatus = entityStatus;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Entity [id=" + id + ", entityId=" + entityId + ", userId="
				+ userId + ", entityType=" + entityType + ", statusType="
				+ statusType + ", entityStatus=" + entityStatus
				+ ", longitude=" + longitude + ", latitude=" + latitude
				+ ", area=" + area + ", streetAddress=" + streetAddress
				+ ", detailAddress=" + detailAddress + ", remark=" + remark
				+ "]";
	}

   
}