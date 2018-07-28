package edu.hnu.csee.luo.action;

import java.util.List;

import edu.hnu.csee.luo.model.Tree;
import edu.hnu.csee.luo.service.TreeService;

public class TreeManageAction {

	private Tree tree;
	private List<Tree> treeList;
	public static TreeService service = new TreeService();
	



	public Tree getTree() {
		return tree;
	}



	public List<Tree> getTreeList() {
		return treeList;
	}



	public void setTree(Tree tree) {
		this.tree = tree;
	}



	public void setTreeList(List<Tree> treeList) {
		this.treeList = treeList;
	}



	public String queryAllTree(){

	setTreeList(service.queryAllTreeInfo(tree));
	return "success";
	
	
	
}



	public String queryTreeInfo(){
	setTreeList(service.queryAllTreeInfo(tree));
	return "success";
	
}


	public String addTree(){

	service.insertOneTree(tree);
	return "success";

}


	public String editTreeInfo(){
	
	service.updateTreeInfo(tree);
	return "success";

}



	public String deleteTree(){
	
	service.deleteTreeById(tree);
	return "success";

}
}
