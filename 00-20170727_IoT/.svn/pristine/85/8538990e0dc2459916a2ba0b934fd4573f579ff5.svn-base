package edu.hnu.csee.luo.service;

import java.util.List;

import edu.hnu.csee.luo.dao.SensorNodeDao;
import edu.hnu.csee.luo.model.SensorNode;
import edu.hnu.csee.luo.util.BaseUtil;

public class SensorNodeManageService {
	
	public static SensorNodeDao sensorNodeDao= (SensorNodeDao) BaseUtil.getBeanAppContext("sensorNodeDao");
	
	 
	 public List<SensorNode> queryAllSensorNodesInfo(SensorNode sensorNode){

		 	
			return sensorNodeDao.queryAllSensorNodesInfo(sensorNode);
		}
	 
	 public List<SensorNode> querySensorNodesInfo(SensorNode sensorNode){

		return sensorNodeDao.querySensorNodesInfo(sensorNode);
	}

	 
	 public Integer querySensorNodeCount(SensorNode sensorNode){

			return sensorNodeDao.querySensorNodeCount(sensorNode);
		}

	 public void insertOneSensorNode(SensorNode sensorNode){
		
		sensorNodeDao.insertOneSensorNode(sensorNode);
	}
	 
	 public void deleteSensorNodeById(SensorNode sensorNode){

		sensorNodeDao.deleteSensorNodeById(sensorNode);
	}
	 
	 public void updateSensorNodeInfo(SensorNode sensorNode){

		sensorNodeDao.updateSensorNodeInfo(sensorNode);
	}
	 
	 
	 
}
