package com.xm.baidu;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.http.converter.json.GsonBuilderUtils;

import java.util.HashMap;
import java.util.Map;

public class LangTech {
    public static String langTech(String text_1,String text_2){
        String url = "https://aip.baidubce.com/rpc/2.0/nlp/v2/simnet";
        String accessToken = AuthService.getAuth();
        Map<String,String> map = new HashMap<>();
        map.put("text_1",text_1);
        map.put("text_2",text_2);
        String params = JSON.toJSONString(map);
        String result = null;
        try {
            result = HttpUtil.post(url, accessToken, "application/json", params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public static String result(String res){
        JSONObject json= JSON.parseObject(res);
        String score=json.getString("score");
        return score;
    }

    public static void main(String[] args){
        System.out.println(result(langTech("柴磊是柴犬吗","是柴犬")));
    }
}
