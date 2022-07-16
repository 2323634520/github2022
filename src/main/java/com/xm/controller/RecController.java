package com.xm.controller;

import com.alibaba.fastjson.JSON;
import com.xm.pojo.Rec;
import com.xm.pojo.Room;
import com.xm.pojo.Scores;
import com.xm.service.RecService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/Rec")
@CrossOrigin
public class RecController {

    @Autowired
    private RecService recService;

    @RequestMapping(value = "/addRec")
    public String addRec() {
        return "addRec";
    }

    @RequestMapping(value = "/sucess")
    public String sucess() {
        return "sucess";
    }


    @RequestMapping(value = "/addRecs",produces = "application/json;charset=UTF-8")
    public String addRecs(Rec rec, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        System.out.println(rec);
        recService.insertRec(rec);
        return "sucess";
    }

    @RequestMapping(value = "/showAllRec",produces = "application/json;charset=UTF-8")
    public String showAllRec(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        List<Rec> recList = recService.showAllRec();
        request.setAttribute("recList",recList);
        return "rec";
    }

    @RequestMapping(value = "/delRec",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delRec(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id:"+id);
        String rs = recService.deleteRec(id);
        return JSON.toJSONString(rs);
    }

}
