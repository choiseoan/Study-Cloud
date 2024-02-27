package study.cloud.stc;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class WebUtil {
	public static String getProperty(String id ){
		
		String resource = "properties/studycloud.properties";
		Properties properties = new Properties();
	    
	    try {
	        Reader reader = Resources.getResourceAsReader(resource);
	        properties.load(reader);
	        return properties.getProperty(id);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return "";
	 }
}
