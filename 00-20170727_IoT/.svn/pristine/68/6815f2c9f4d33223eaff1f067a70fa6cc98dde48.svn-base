package edu.hnu.csee.luo.service;

import java.util.List;

import edu.hnu.csee.luo.dao.DepartmentDao;
import edu.hnu.csee.luo.model.Department;
import edu.hnu.csee.luo.util.BaseUtil;

public class DepartmentManageService {
	
public static DepartmentDao departmentDao = (DepartmentDao) BaseUtil.getBeanAppContext("departmentDao");
	
	public Department queryDeptInfoById(String departmentId){
		String beanName = "departmentDao";
		DepartmentDao departmentDao = (DepartmentDao) BaseUtil.getBeanAppContext(beanName);
		Department department = new Department();
		department.setDepartmentId(departmentId);
		return departmentDao.queryDepartmentInfoById(department);
	 }
	
	 public Department queryDeptsInfoByName(String departmentName){
		String beanName = "departmentDao";
		DepartmentDao departmentDao = (DepartmentDao) BaseUtil.getBeanAppContext(beanName);
		Department department = new Department();
		department.setDepartmentName(departmentName);
		return departmentDao.queryDepartmentsInfoByName(department);
	}
	 
	 public List<Department> queryAllDeptsInfo(Department department){
		return departmentDao.queryAllDepartmentsInfo(department);
	}

	 public Integer queryDepartmentsCount(Department department){

			return departmentDao.queryDepartmentsCount(department);
		}
	 
	 public void insertOneDepartment(Department department){
		
		 departmentDao.insertOneDepartment(department);
	}
	 
	 public void deleteDepartmentById(Department department){

		 departmentDao.deleteDepartmentById(department);
	}
	 
	 public void updateDepartmentInfo(Department department){

		String beanName = "departmentDao";
		DepartmentDao departmentDao = (DepartmentDao) BaseUtil.getBeanAppContext(beanName);
		departmentDao.updateDepartmentInfo(department);
	}
}
