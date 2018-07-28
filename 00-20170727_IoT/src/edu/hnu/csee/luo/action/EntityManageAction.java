package edu.hnu.csee.luo.action;


import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;

import com.opensymphony.xwork2.ActionContext;

import edu.hnu.csee.luo.model.Entity;
import edu.hnu.csee.luo.model.Pagination;
import edu.hnu.csee.luo.model.User;
import edu.hnu.csee.luo.model.Tree;
import edu.hnu.csee.luo.service.EntityManageService;
import edu.hnu.csee.luo.service.TreeService;

public class EntityManageAction {
	private User user;
	private List<User> userList;
	
	private String result;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	private Pagination paging;
	public Pagination getPaging() {
		return paging;
	}
	public void setPaging(Pagination paging) {
		this.paging = paging;
	}
	public User getUser() {
		return user;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	
	private String entityId;
	
	public String getEntityId()
	{
		return entityId;
	}
	
	public void setEntityId(String entityId)
	{
		this.entityId=entityId;
	}

	private Tree tree;
	private List<Tree> treeList;
	public Tree getTree() {
		return tree;
	}
	public List<Tree> getTreeList() {
		return treeList;
	}
	public void setTreeList(List<Tree> treeList) {
		this.treeList = treeList;
	}
	
	private Entity entity;
	private List<Entity> entityList;
	public Entity getEntity() {
		return entity;
	}
	public List<Entity> getEntityList() {
		return entityList;
	}
	public void setEntity(Entity entity) {
		this.entity = entity;
	}
	public void setEntityList(List<Entity> entityList) {
		this.entityList = entityList;
	}
	
	public static EntityManageService service = new EntityManageService();
	public static TreeService serviceTree = new TreeService();
	 public static Logger log = Logger.getLogger(EntityManageAction.class);
	public String queryAllEntity(){

		//log.info("地图带条件的节点查询开始");
		 if(entity==null){
		//log.info("本地entity没有传入数值，初始化entity");
			 entity = new Entity();
		 }
		 
		// System.out.println(entity.toString()+"=================================================");
		//log.info("保留地图查询条件:"+entity.toString());
		
		entityList = service.queryAllEntityInfo(entity);

		JSONArray jsonArray = JSONArray.fromObject(entityList);
		result = jsonArray.toString();
		
		//log.info("地图从后台取出的数据为"+result);
		
		return "success";
		
		
	}
	
	
	Map<String,Object> session =  ActionContext.getContext().getSession();
	public String queryEntityInfo(){

		log.info("带条件的节点查询开始");
		 if(entity==null){
			 log.info("本地sensorNode没有传入数值，初始化sensorNode");
			 entity = new Entity();
		 }
		 if(paging==null){
			 paging = new Pagination();
		 }

		 if( paging.getCurrentPage()==null){
			 paging.setCurrentPage(1);
			 session.put("nodeIndex",1);
		 }
		 paging.setRows(service.queryEntityCount(entity));
		
		 System.out.println(entity.getEntityType());
		 System.out.println(entity.getArea());
		 log.info("保留查询条件:"+entity.toString());
		 entity.setPaging(paging);
		setEntityList(service.queryEntityInfo(entity));
		setPaging(paging);
		return "success";
		
		
		
	}
	

	public String queryEntityInfoById(){

		setEntityList(service.queryEntityInfoById(entityId));
		return "success";
	}
	
	public String queryEntityTreeInfoById(){
		setEntityList(service.queryEntityInfoById(entityId));
		setTreeList(serviceTree.queryTreeInfoById(entityId));
		return "success";
		
	}
	
	public String addEntity(){
		log.info("增加内容:"+entity.toString());
		service.insertOneEntity(entity);
		return "success";

	}
	
	
	public String editEntityInfo(){
		
		service.updateEntityInfo(entity);
		return "success";

	}
	
	

	public String deleteEntity(){
		
		service.deleteEntityById(entity);
		return "success";

	}
	
	
}
