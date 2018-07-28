package edu.hnu.csee.luo.service;

import java.util.List;

import edu.hnu.csee.luo.dao.NodeCollectDataDao;
import edu.hnu.csee.luo.model.NodeCollectData;
import edu.hnu.csee.luo.util.BaseUtil;

public class NodeCollectDataService {

	public static NodeCollectDataDao nodeCollectDataDao = (NodeCollectDataDao) BaseUtil.getBeanAppContext("nodeCollectDataDao");
	 public List<NodeCollectData> queryNodeCollectDataRecordByCondition(NodeCollectData nodeCollectData){
		 
		 return nodeCollectDataDao.queryNodeCollectDataRecordByCondition(nodeCollectData);
	 }
	 public List<NodeCollectData> queryAllNodeCollectDataRecord(NodeCollectData nodeCollectData){
		 return nodeCollectDataDao.queryAllNodeCollectDataRecord(nodeCollectData);
	 }
	 
	 public Integer queryNodeCollectDataCount(NodeCollectData nodeCollectData){
		 return nodeCollectDataDao.queryNodeCollectDataCount(nodeCollectData);
	 }
	 
	 
	 public  List<NodeCollectData>  queryNodeCollectData(NodeCollectData nodeCollectData){
		 return nodeCollectDataDao.queryNodeCollectData(nodeCollectData);
	 }
	 
	 
	 public Integer queryHistoryDataCount(NodeCollectData nodeCollectData){
		 
		 return nodeCollectDataDao.queryHistoryDataCount(nodeCollectData);
	 
	 }
	public List<NodeCollectData> queryRecentNodeCollectData(
			NodeCollectData nodeCollectData) {
		// TODO Auto-generated method stub
		return nodeCollectDataDao.queryRecentNodeCollectData(nodeCollectData);
	}
	public List<NodeCollectData> queryNodeCollectDataDesc(
			NodeCollectData nodeCollectData) {
		// TODO Auto-generated method stub
		return nodeCollectDataDao.queryNodeCollectDataDesc(nodeCollectData);
	}
	 
	 
}
