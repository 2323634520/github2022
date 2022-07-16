package com.xm.baidu;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;

public class FaceAdd {

	 public static String add(String base64img,String uid,String name) {
	        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
	        try {
	            Map<String, Object> map = new HashMap<>();
	            map.put("image", base64img);
	            map.put("image_type", "BASE64");
	            map.put("group_id", "xm");
	            map.put("user_id", uid);
	            map.put("user_info",name);

	            String param = JSON.toJSONString(map);

	            String accessToken = AuthService.getAuth();

	            String result = HttpUtil.post(url, accessToken, "application/json", param);
	            System.out.println(result);
	            return result;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
}
