package edu.hnu.csee.luo.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;

import edu.hnu.csee.luo.dao.MaintainDao;
import edu.hnu.csee.luo.model.Condition;
import edu.hnu.csee.luo.model.Maintain;
import edu.hnu.csee.luo.model.Pagination;
import edu.hnu.csee.luo.service.MaintainManageService;
import edu.hnu.csee.luo.util.BaseUtil;

public class MaintainManageAction {
	
	private Condition maintainCondition;
	public static Logger log= Logger.getLogger(DepartmentManageAction.class);
	private Pagination paging;
	
	public void setCondition(Condition maintainCondition) {
		this.maintainCondition = maintainCondition;
	}
	
	public Condition getCondition() {
		return maintainCondition;
	}
	
	public Maintain getMaintain() {
		return maintain;
	}
	public List<Maintain> getMaintainList() {
		return maintainList;
	}
	public void setMaintain(Maintain maintain) {
		this.maintain = maintain;
	}
	public void setMaintainList(List<Maintain> maintainList) {
		this.maintainList = maintainList;
	}
	private Maintain maintain;
	private List<Maintain> maintainList;
	
	public Pagination getPaging() {
		return paging;
	}
	
	public void setPaging(Pagination paging) {
		this.paging = paging;
	}
	
	public static MaintainManageService service = new MaintainManageService();
	
	Map<String,Object> session =  ActionContext.getContext().getSession();
	
	public void init(){
		 if(maintain==null){
			 log.info("本地maintain没有传入数值，初始化maintain");
			 maintain = new Maintain();
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
	public String queryAllMaintain(){
		log.info("查询所有节点信息开始");
		Map request = (Map)ActionContext.getContext().get("request");
		maintain.setCondition(maintainCondition);
		log.info("查找已保存的条件");
		maintainList = service.queryAllMaintainInfo(maintain);

		Map<String, Object> dataMap1 = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(Maintain mainInfoTemp:maintainList){
			Map m =  new HashMap<String, Object>();
			m.put("maintain", mainInfoTemp);
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
	
	public String queryMaintainInfo(){
		log.info("带条件的节点查询开始");
	
		pageHandle();
		 if(maintain==null || maintain.equals("")){
			 log.info("本地maintain没有传入数值，初始化maintain");
			 maintain = new Maintain();
			/*if(session.get("Condition")!=null){
				maintain=(Maintain) session.get("Condition");
			}*/
		}
		paging.setRows(service.queryMainInfoCount(maintain));
		maintain.setPaging(paging);
		this.setMaintainList(service.queryAllMaintainInfo(maintain));
		log.info("保留查询条件:"+maintain.toString());
		log.info("entity id is:"+maintain.getEntityid());
		session.put("Condition", maintain);
		setPaging(paging);
		return "success";
	}
	
	public String editMaintainInfo(){
		service.updateMaintainInfo(maintain);
		return "success";
	}
	 
	public String deleteMaintain(){
		log.info("delete entityid is:"+maintain.getEntityid());
		service.deleteMaintainById(maintain);
		return "success";
	}
	
	public String addMaintain(){
		init();
		log.info("add entityid is:"+maintain.getEntityid());
		service.insertOneMaintain(maintain);
		return "success";
	}
}
