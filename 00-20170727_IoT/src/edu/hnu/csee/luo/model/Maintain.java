package edu.hnu.csee.luo.model;

public class Maintain {
    private Integer id;

    private Integer entityid;

    private String status;

    private Integer userid;

    private String cause;

    private String recordtime;

    private String maintaintime;

    private String respmem;

    private String respmemtel;

    private String maintainpeople;

    private String maintainmemtel;

    private String remark;
    
    private Integer startIndex;
     
    private Integer pageSize;
    
    public Condition getCondition() {
		return condition;
	}
	public void setCondition(Condition condition) {
		this.condition = condition;
	}

	private Condition condition;
    
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
	
    public Pagination getPaging() {
		return paging;
    }

	public void setPaging(Pagination paging) {
			this.paging = paging;
	}

	private Pagination paging;
    
    public User getUser() {
		return user;
	}

	public Entity getEntity() {
		return entity;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setEntity(Entity entity) {
		this.entity = entity;
	}

	private User user;
    
    private Entity entity;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEntityid() {
        return entityid;
    }

    public void setEntityid(Integer entityid) {
        this.entityid = entityid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause == null ? null : cause.trim();
    }

    public String getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(String recordtime) {
        this.recordtime = recordtime == null ? null : recordtime.trim();
    }

    public String getMaintaintime() {
        return maintaintime;
    }

    public void setMaintaintime(String maintaintime) {
        this.maintaintime = maintaintime == null ? null : maintaintime.trim();
    }

    public String getRespmem() {
        return respmem;
    }

    public void setRespmem(String respmem) {
        this.respmem = respmem == null ? null : respmem.trim();
    }

    public String getRespmemtel() {
        return respmemtel;
    }

    public void setRespmemtel(String respmemtel) {
        this.respmemtel = respmemtel == null ? null : respmemtel.trim();
    }

    public String getMaintainpeople() {
        return maintainpeople;
    }

    public void setMaintainpeople(String maintainpeople) {
        this.maintainpeople = maintainpeople == null ? null : maintainpeople.trim();
    }

    public String getMaintainmemtel() {
        return maintainmemtel;
    }

    public void setMaintainmemtel(String maintainmemtel) {
        this.maintainmemtel = maintainmemtel == null ? null : maintainmemtel.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}