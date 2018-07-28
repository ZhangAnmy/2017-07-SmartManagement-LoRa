package edu.hnu.csee.luo.service;

import java.util.List;

import edu.hnu.csee.luo.dao.EntityDao;
import edu.hnu.csee.luo.dao.SensorNodeDao;
import edu.hnu.csee.luo.model.Entity;
import edu.hnu.csee.luo.util.BaseUtil;

public class EntityManageService {
	
	public static EntityDao entityDao= (EntityDao) BaseUtil.getBeanAppContext("entityDao");
	
	
	 public List<Entity> queryAllEntityInfo(Entity entity){

			return entityDao.queryAllEntityInfo(entity);
		}
	 
	 public List<Entity> queryEntityInfo(Entity entity){

		return entityDao.queryEntityInfo(entity);
	}
	 
	 public Integer queryEntityCount(Entity entity){

			return entityDao.queryEntityCount(entity);
		}
	public List<Entity> queryEntityInfoById(String entityId) {
		// TODO Auto-generated method stub
		return entityDao.queryEntityInfoById(entityId);
	}

	 public void insertOneEntity(Entity entity){
		
		 entityDao.insertOneEntity(entity);
	}
	 
	 public void deleteEntityById(Entity entity){

		 entityDao.deleteEntityById(entity);
	}
	 
	 public void updateEntityInfo(Entity entity){

		 entityDao.updateEntityInfo(entity);
	}
}
