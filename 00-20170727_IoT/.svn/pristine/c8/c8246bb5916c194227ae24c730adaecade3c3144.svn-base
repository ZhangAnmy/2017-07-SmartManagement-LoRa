package edu.hnu.csee.luo.action;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hnu.csee.luo.model.Department;
import edu.hnu.csee.luo.model.Pagination;
import edu.hnu.csee.luo.service.DepartmentManageService;

public class DepartmentManageAction extends ActionSupport implements Serializable{
	public static Logger log= Logger.getLogger(DepartmentManageAction.class);
	private List<Department> departmentList;
	private Department department;
	private Pagination paging;

	public static DepartmentManageService service = new DepartmentManageService();
	
	public void setDepartment(Department department) {
		this.department = department;
	}

	public Department getDepartment() {
		return department;
	}
	
	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}
	
	public List<Department> getDepartmentList() {
		return departmentList;
	}
	
	public Pagination getPaging() {
		return paging;
	}
	
	public void setPaging(Pagination paging) {
		this.paging = paging;
	}

	Map<String,Object> session =  ActionContext.getContext().getSession();
	
	public void init(){
		 if(department==null){
			 log.info("本地department没有传入数值，初始化department");
			 department = new Department();
		 }
	}
	public void pageHandle(){
		 if(paging==null){
			 log.info("paging没有传入数值，初始化paging");
			 paging = new Pagination();
		 }
		 if( paging.getCurrentPage()==null){
			 log.info("当前页面为空，设置当前页为1");
			 paging.setCurrentPage(1);
		 }
	}	
	public String queryAllDepartments(){
		log.info("查询开始");
		pageHandle();
		 if(department==null){
			 log.info("本地department没有传入数值，初始化department");
			 department = new Department();
			/*if(session.get("Condition")!=null){
				department=(Department) session.get("Condition");
			}*/
		}
		paging.setRows(service.queryDepartmentsCount(department));
		department.setPaging(paging);
		this.setDepartmentList(service.queryAllDeptsInfo(department));
		log.info("保留查询条件:"+department.toString());
		log.info("deptId:"+department.getDepartmentId());
		log.info("deptName:"+department.getDepartmentName());
		session.put("Condition", department);
		setPaging(paging);
		return "success";
	}
	
	public String queryDepartmentById(){
		service.queryDeptInfoById(department.getDepartmentId());
		return "success";
	}
	
	public String queryDepartmentByName(){
		service.queryDeptsInfoByName(department.getDepartmentName());
		return "success";
	}
	
	public String addDepartment(){
		init();
		service.insertOneDepartment(department);
		return "success";
	}
	
	public String deleteDepartment(){
		service.deleteDepartmentById(department);
		return "success";
	}
	
	public String editDepartmentInfo(){
		service.updateDepartmentInfo(department);
		return "success";
	}
}
