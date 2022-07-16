package com.xm.baidu;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;


public class FaceSearch {

	 public static String faceSearch(String base64img) {
	        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";
	        try {
	            Map<String, Object> map = new HashMap<>();
	            map.put("image", base64img);
	            map.put("image_type", "BASE64");
	            map.put("group_id_list", "xm");
	            String param =JSON.toJSONString(map);
	            String accessToken = AuthService.getAuth();
	            String result = HttpUtil.post(url, accessToken, "application/json", param);
	            return result;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
}
