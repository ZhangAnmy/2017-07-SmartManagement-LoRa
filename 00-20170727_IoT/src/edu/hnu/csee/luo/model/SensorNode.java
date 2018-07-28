package edu.hnu.csee.luo.model;

public class SensorNode {
    private Integer id;

    private String sensorId;
    
    private Entity entity;
    
    private Integer entityId;


    public Pagination getPaging() {
		return paging;
	}

	public void setPaging(Pagination paging) {
		this.paging = paging;
	}

	private Pagination paging;



	public Integer getEntityId() {
		return entityId;
	}

	public void setEntityId(Integer entityId) {
		this.entityId = entityId;
	}

	private String setTime;

    private String remark;
  
    private String sensorType;

	public Integer getId() {
		return id;
	}

	public String getSensorId() {
		return sensorId;
	}

	public Entity getEntity() {
		return entity;
	}

	public void setEntity(Entity entity) {
		this.entity = entity;
	}

	public String getSetTime() {
		return setTime;
	}

	public String getRemark() {
		return remark;
	}

	public String getSensorType() {
		return sensorType;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setSensorId(String sensorId) {
		this.sensorId = sensorId;
	}


	public void setSetTime(String setTime) {
		this.setTime = setTime;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setSensorType(String sensorType) {
		this.sensorType = sensorType;
	}

   
}