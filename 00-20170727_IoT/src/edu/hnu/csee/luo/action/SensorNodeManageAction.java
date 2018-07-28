package edu.hnu.csee.luo.action;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hnu.csee.luo.model.Entity;
import edu.hnu.csee.luo.model.Pagination;
import edu.hnu.csee.luo.model.SensorNode;
import edu.hnu.csee.luo.service.SensorNodeManageService;

public class SensorNodeManageAction extends ActionSupport implements Serializable {
	private List<SensorNode> sensorNodeList;
	private SensorNode sensorNode;
	private Entity entity;
	private List<Entity> entityList;
	private Pagination paging;
	private String jsonString;
	
	public List<Entity> getEntityList() {
		return entityList;
	}

	public Pagination getPaging() {
		return paging;
	}

	public void setEntityList(List<Entity> entityList) {
		this.entityList = entityList;
	}

	public void setPaging(Pagination paging) {
		this.paging = paging;
	}

	public Entity getEntity() {
		return entity;
	}

	public void setEntity(Entity entity) {
		this.entity = entity;
	}


	public static Logger log = Logger.getLogger(SensorNodeManageAction.class);

	public static 	SensorNodeManageService  service= new SensorNodeManageService();
	public SensorNode getSensorNode() {
		return sensorNode;
	}

	public void setSensorNode(SensorNode sensorNode) {
		this.sensorNode = sensorNode;
	}

	public List<SensorNode> getSensorNodeList() {
		return sensorNodeList;
	}

	public void setSensorNodeList(List<SensorNode> sensorNodeList) {
		this.sensorNodeList = sensorNodeList;
	}
	
	
	Map<String,Object> session =  ActionContext.getContext().getSession();
	
	public void init(){
		 if(sensorNode==null){
			 log.info("本地sensorNode没有传入数值，初始化sensorNode");
			 sensorNode = new SensorNode();
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
	private Map<String, Object> dataMap;
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	private String result;
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void pageHandleAfter(){
		
	}
	/*
	 * @desc 查询所有节点信息
	 * @author
	 */
	public String queryAllSensorNode(){
		log.info("查询所有节点信息开始");
		Map request = (Map)ActionContext.getContext().get("request");
		log.info("查找已保存的条件");
		sensorNodeList = service.queryAllSensorNodesInfo(sensorNode);

		Map<String, Object> dataMap1 = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(SensorNode sensorNodeTemp:sensorNodeList){
			Map m =  new HashMap<String, Object>();
			m.put("sensorNode", sensorNodeTemp);
			list.add(m);
		}
		dataMap1.put("list", list);
		this.setDataMap(dataMap1);
		JSONObject jsonOject = JSONObject.fromObject(dataMap1);
		JSONArray jsonArray = JSONArray.fromObject(dataMap1);
		

		dataMap1.put("jsonArray", jsonOject.toString());
		
		log.info(jsonOject.toString());
		result = jsonOject.toString();
		return "success";
	}
	
	public String querySensorNodesInfo(){
		log.info("带条件的节点查询开始");
	
		pageHandle();
		 if(sensorNode==null || sensorNode.equals("")){
			 log.info("本地sensorNode没有传入数值，初始化sensorNode");
			 sensorNode = new SensorNode();
			/*if(session.get("Condition")!=null){
				sensorNode=(SensorNode) session.get("Condition");
			}*/
		}
		paging.setRows(service.querySensorNodeCount(sensorNode));
		sensorNode.setPaging(paging);
		this.setSensorNodeList(service.querySensorNodesInfo(sensorNode));
		log.info("保留查询条件:"+sensorNode.toString());
		session.put("Condition", sensorNode);
		setPaging(paging);
		return "success";
		
		
		
	}
	
	
	
	
	
	public String addSensorNode(){
		init();
		service.insertOneSensorNode(sensorNode);
		return "success";

	}
	
	
	public String editSensorNodeInfo(){
		log.info("remark is:"+sensorNode.getRemark());
		service.updateSensorNodeInfo(sensorNode);
		return "success";

	}
	
	

	public String deleteSensorNode(){
		
		service.deleteSensorNodeById(sensorNode);
	
		return "success";
	}
}
