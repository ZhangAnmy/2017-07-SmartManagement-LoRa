package edu.hnu.csee.luo.dao;

import java.util.List;

import edu.hnu.csee.luo.model.Entity;





public interface EntityDao extends ObjectDaoInterface{
	 public List<Entity> queryAllEntityInfo(Entity entity);
	 public List<Entity> queryEntityInfo(Entity entity);
	 public Integer queryEntityCount(Entity entity);
	 public List<Entity> queryEntityInfoById(String entityId);
	 public void insertOneEntity(Entity entity);
	 public void deleteEntityById(Entity entity);
	 public void updateEntityInfo(Entity entity);
}