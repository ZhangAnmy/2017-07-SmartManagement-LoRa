package edu.hnu.csee.luo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;
import edu.hnu.csee.luo.model.Condition;
import edu.hnu.csee.luo.model.Counter;
import edu.hnu.csee.luo.model.Entity;
import edu.hnu.csee.luo.model.NodeCollectData;
import edu.hnu.csee.luo.service.EntityManageService;
import edu.hnu.csee.luo.service.NodeCollectDataService;

import java.util.Date;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;

public class NodeCollectDataManageAction {
	private Condition condition;
	private Counter counter;
	private List<Counter> counterList;
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
	public List<Counter> getCounterList() {
		return counterList;
	}
	public void setCounterList(List<Counter> counterList) {
		this.counterList = counterList;
	}

	public Counter getCounter() {
		return counter;
	}
	public void setCounter(Counter counter) {
		this.counter = counter;
	}

	private NodeCollectData nodeCollectData;
	public static Logger log = Logger.getLogger(NodeCollectDataManageAction.class);
	public NodeCollectData getNodeCollectData() {
		return nodeCollectData;
	}
	public List<NodeCollectData> getNodeCollectDataList() {
		return nodeCollectDataList;
	}
	public void setNodeCollectData(NodeCollectData nodeCollectData) {
		this.nodeCollectData = nodeCollectData;
	}
	public void setNodeCollectDataList(List<NodeCollectData> nodeCollectDataList) {
		this.nodeCollectDataList = nodeCollectDataList;
	}
	private List<NodeCollectData> nodeCollectDataList;
	
	private String result;
	
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public static NodeCollectDataService service = new NodeCollectDataService();
	public static EntityManageService entityservice = new EntityManageService();
//	public static SensorNodeManageService sensorNodeservice = new SensorNodeManageService();
	private Entity entity ;
	public Entity getEntity() {
		return entity;
	}
	public void setEntity(Entity entity) {
		this.entity = entity;
	}
	
	private String entityId;
	private String entityType;
	public String getEntityId() {
		return entityId;
	}
	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}
	public void setEntityType(String entityType) {
		this.entityType = entityType;
	}
	public String queryAllNodeCollectDataInfo(){
		
		nodeCollectDataList = service.queryAllNodeCollectDataRecord(nodeCollectData);
		
		JSONArray jsonArray = JSONArray.fromObject(nodeCollectDataList);
		
		
		result = jsonArray.toString();
		
		log.info("从后台取出的数据为"+result);
		return "success";
	
		
		
	}
	
	
	
	public String queryHistoryDataCount(){
		
		if(nodeCollectData==null){
			
			nodeCollectData = new NodeCollectData();
		}
		nodeCollectData.setCondition(condition);
	
		service.queryHistoryDataCount(nodeCollectData);
		
		return "success";
	}

		public String queryNodeCollectDataCount(){
			
			if(nodeCollectData==null){
			
			nodeCollectData = new NodeCollectData();
		}
		if(condition==null){
			condition = new Condition();
			String startTime = df.format(new Date())+" 00:00:00";
			String endTime = df.format(new Date())+" 23:59:59";
			condition.setStartTime(startTime);
			condition.setEndTime(endTime);
		}
		nodeCollectData.setCondition(condition);
		int[][] count = new int[6][3];
		String[] areaCount = {"岳麓","天心","雨花","开福","芙蓉","望城"};
		String[] statusCount ={"正常","预警","报警"};
		entity = new Entity();
//		entityType = entityType.replaceAll("%(?![0-9a-fA-F]{2})", "%25");  
//		try {
//			String str = URLDecoder.decode(entityType, "UTF-8");
//		  log.info("search entity type is:"+ str);
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		counter = new Counter();
//		counterList = new ArrayList<Counter>();
		
		//区域计数
		for(int i=0;i<areaCount.length;i++){
		
			//状态计数
			for(int j =0 ;j<statusCount.length;j++){
				
				entity.setArea(areaCount[i]);
				nodeCollectData.setEntityId(entityId);
				nodeCollectData.setEntityType(entityType);
				nodeCollectData.setStatus(statusCount[j]);
				nodeCollectData.setArea(areaCount[i]);
				nodeCollectData.setEntity(entity);
				log.info("历史数据查询条件:"+nodeCollectData.toString());
				count[i][j] = service.queryNodeCollectDataCount(nodeCollectData);
			}
		}

		JSONArray jsonArray = JSONArray.fromObject(count);
		
		
		result = jsonArray.toString();
		
		log.info("取出的data collect数据为:"+result);
		
		return "success";
		
	}
		
		
		public String queryNodeCollectData(){
			if(nodeCollectData==null){
				
				nodeCollectData = new NodeCollectData();
			}
			
			nodeCollectData.setCondition(condition);
			nodeCollectData.setEntityId(entityId);
			
			nodeCollectDataList = service.queryNodeCollectData(nodeCollectData);
			JSONArray jsonArray = JSONArray.fromObject(nodeCollectDataList);
			
			
			result = jsonArray.toString();
			
			log.info("从后台取出的数据为"+result);
			return "success";
			
		}
		
		public Condition getCondition() {
			return condition;
		}
		public void setCondition(Condition condition) {
			this.condition = condition;
		}
		public String queryRecentNodeCollectData(){
			if(nodeCollectData==null){
				
				nodeCollectData = new NodeCollectData();
			}
			nodeCollectData.setEntityId(entityId);
			
			log.info("保留查询条件:"+nodeCollectData.toString());
			nodeCollectDataList = service.queryRecentNodeCollectData(nodeCollectData);
			JSONArray jsonArray = JSONArray.fromObject(nodeCollectDataList);
			

			result = jsonArray.toString();
			
			log.info("从后台取出的数据为"+result);
			return "success";
			
		}
		
		public String queryNodeCollectDataDesc(){
			if(nodeCollectData==null){
				
				nodeCollectData = new NodeCollectData();
			}
			nodeCollectData.setEntityId(entityId);
			
			log.info("保留查询条件:"+nodeCollectData.toString());
			nodeCollectDataList = service.queryNodeCollectDataDesc(nodeCollectData);
			JSONArray jsonArray = JSONArray.fromObject(nodeCollectDataList);
			

			result = jsonArray.toString();
			
			log.info("从后台取出的数据为"+result);
			return "success";
			
		}
}

