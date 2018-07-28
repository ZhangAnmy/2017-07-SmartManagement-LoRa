package edu.hnu.csee.luo.dao;

import java.util.List;

import edu.hnu.csee.luo.model.NodeCollectData;

public interface NodeCollectDataDao extends ObjectDaoInterface {
	 public List<NodeCollectData> queryNodeCollectDataRecordByCondition(NodeCollectData nodeCollectData);
	 public List<NodeCollectData> queryAllNodeCollectDataRecord(NodeCollectData nodeCollectData);
	 public Integer queryNodeCollectDataCount(NodeCollectData nodeCollectData);
	 
	 public Integer queryHistoryDataCount(NodeCollectData nodeCollectData);
	 
	 public  List<NodeCollectData> queryNodeCollectData(NodeCollectData nodeCollectData);
 	 public List<NodeCollectData> queryRecentNodeCollectData(NodeCollectData nodeCollectData);
	public List<NodeCollectData> queryNodeCollectDataDesc(
			NodeCollectData nodeCollectData);
}
