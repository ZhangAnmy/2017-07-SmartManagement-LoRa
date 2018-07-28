package edu.hnu.csee.luo.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.hnu.csee.luo.dao.ObjectDaoInterface;

public class BaseUtil {
	public static ObjectDaoInterface getBeanAppContext(String beanName){
		ApplicationContext ctx = null;
		ctx = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		ObjectDaoInterface objectDao = (ObjectDaoInterface)ctx.getBean(beanName);
		return objectDao;
	}
	
	public static boolean isNull(){
		return false;
	}
}
