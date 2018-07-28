package edu.hnu.csee.luo.service;

import java.util.List;

import edu.hnu.csee.luo.dao.TreeDao;
import edu.hnu.csee.luo.model.Tree;
import edu.hnu.csee.luo.util.BaseUtil;

public class TreeService {

	public static TreeDao treeDao= (TreeDao) BaseUtil.getBeanAppContext("treeDao");
	
	
	
	 public List<Tree> queryAllTreeInfo(Tree tree){

			return treeDao.queryAllTreeInfo(tree);
		}
	 
	 public List<Tree> queryTreeInfo(Tree tree){

		return treeDao.queryTreeInfo(tree);
	}
	 
	 public List<Tree> queryTreeInfoById(String entityId){
		 return treeDao.queryTreeInfoById(entityId);
	 }

	 public void insertOneTree(Tree tree){
		
		 treeDao.insertOneTree(tree);
	}
	 
	 public void deleteTreeById(Tree tree){

		 treeDao.deleteTreeById(tree);
	}
	 
	 public void updateTreeInfo(Tree tree){

		 treeDao.updateTreeInfo(tree);
	}
	
}
