package edu.hnu.csee.luo.service;

import java.util.List;

import edu.hnu.csee.luo.dao.DepartmentDao;
import edu.hnu.csee.luo.dao.MaintainDao;
import edu.hnu.csee.luo.model.Maintain;
import edu.hnu.csee.luo.util.BaseUtil;

public class MaintainManageService {

	public static MaintainDao maintainDao= (MaintainDao) BaseUtil.getBeanAppContext("maintainDao");
	 public List<Maintain> queryMaintainInfoByCondition(Maintain maintain){
		return maintainDao.queryMaintainInfoByCondition(maintain);
		 
	 }
	 public List<Maintain> queryAllMaintainInfo(Maintain maintain){
		 return maintainDao.queryAllMaintainInfo(maintain);
	 }
	 public void insertOneMaintain(Maintain maintain){
		 maintainDao.insertOndeMaintainRecord(maintain);
	 }
	 public void deleteMaintainById(Maintain maintain){
		 maintainDao.deleteMainInfoById(maintain);
	 }
	 public void updateMaintainInfo(Maintain maintain){
		 
		String beanName = "maintainDao";
		MaintainDao maintainDao = (MaintainDao) BaseUtil.getBeanAppContext(beanName);
		maintainDao.changeMaintainInfo(maintain);
	 }
	 
	 public Integer queryMainInfoCount(Maintain maintain){

			return maintainDao.queryMainInfoCount(maintain);
		}
}
