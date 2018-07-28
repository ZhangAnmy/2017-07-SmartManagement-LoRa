package edu.hnu.csee.luo.model;

public class Pagination {
	 @Override
	public String toString() {
		return "Pagination [currentPage=" + currentPage + ", pageSize="
				+ pageSize + ", begin=" + begin + ", totalPage=" + totalPage
				+ ", rows=" + rows + ", hasFirst=" + hasFirst + ", hasPre="
				+ hasPre + ", hasNext=" + hasNext + ", hasLast=" + hasLast
				+ "]";
	}
	private Integer currentPage;      //当前页  
     private Integer pageSize=8;   //每页显示多少条记录  
     private Integer begin;   //开始序号
 	 private Integer totalPage; //总页数
 	 private Integer rows=30; //总记录数
     private boolean hasFirst;   //是否有首页  
     private boolean hasPre;     //是否有前一页  
     private boolean hasNext;    //是否有下一页  
     private boolean hasLast;    //是否有最后一页  
	public Integer getCurrentPage() {
		return currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public Integer getBegin() {
		return (currentPage-1<0?0:currentPage-1)*pageSize;
	}
	public Integer getTotalPage() {
		return rows/pageSize+1;
	}
	public Integer getRows() {
		return rows;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public void setBegin(Integer begin) {
		this.begin = begin;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public boolean isHasFirst() {
		return hasFirst;
	}
	public boolean isHasPre() {
		return hasPre;
	}
	public boolean isHasNext() {
		return hasNext;
	}
	public boolean isHasLast() {
		return hasLast;
	}
	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}
	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}
	

}
