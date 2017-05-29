package util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Properties;

/**
 * 
 * <p>Title: PropertiesUtil</p>
 * <p>Description: Property的工具类</p>
 * <p>author:舒莉</p> 
 * <P>date:2017年2月12日下午3:28:44</p>
 */
public class PropertiesUtil {

	private static final String propertyFileName="/global.properties";
	
	private static Properties prop = new Properties(); 
	
	private PropertiesUtil(){};
	
	static{
		 try {
			 
			//InputStream in = new BufferedInputStream (new FileInputStream(propertyFileName));
			InputStream in=PropertiesUtil.class.getResourceAsStream(propertyFileName);
		    prop.load(in);
		    System.out.println("初始化prop");
		 } catch (FileNotFoundException e) {
			e.printStackTrace();
		 }catch(IOException e){
			e.printStackTrace();
		 }
	}
	
	public static String getValueByName(String name){
		Iterator<String> it=prop.stringPropertyNames().iterator();
		 while(it.hasNext()){
			 String key=it.next();
			 if(key.equals(name))  return prop.getProperty(key);
		 }
		return null;
	}
}
