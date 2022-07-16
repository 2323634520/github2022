package com.xm.controller;


import com.alibaba.fastjson.JSON;
import com.xm.pojo.Scores;
import com.xm.service.ScoresService;
import com.xm.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/Scores")
@CrossOrigin
public class ScoresController {

    @Autowired
    private ScoresService scoresService;


    @RequestMapping(value = "/score")
    public String score() {
        return "score";
    }

    @RequestMapping(value = "/updateScore")
    public String updateScore() {
        return "updateScore";
    }

    @RequestMapping(value = "/scoresEcharts")
    public String scoresEcharts() {
        return "scoresEcharts";
    }


    @RequestMapping(value = "/addScore")
    public String addScore() {
        return "addScore";
    }

    @RequestMapping(value = "/getAllScores")
    public String getAllData(){
        return "redirect:getPageScores";
    }

    @RequestMapping(value = "/addScores",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addScores(Scores scores, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        System.out.println(scores);
        return JSON.toJSONString(scoresService.insertScores(scores));
    }

    @RequestMapping(value = "/delScores",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delScores(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id:"+id);
        String rs = scoresService.deleteScores(id);
        return JSON.toJSONString(rs);
    }

    @RequestMapping(value="/updateScores",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateScores(Scores scores,HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        System.out.println(scores);
        return JSON.toJSONString(scoresService.updateScores(scores));
    }

    @RequestMapping(value = "/showAllScores",produces = "application/json;charset=UTF-8")
    public String showAllScores(Scores scores,HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        List<Scores> scoresList = scoresService.showAllScores();
        request.setAttribute("scoresList",scoresList);
        return "score";
    }

    @RequestMapping(value = "/findScoresById")
    public String findScoresById(@RequestParam(value="id") Integer id, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Scores score = scoresService.findScoresById(id);
        System.out.println(score);
        request.setAttribute("score",score);
        return "updateScore";
    }

//    @RequestMapping(value = "/findScoresByXid")
//    public String findScoresByXid(@RequestParam(value="eid") Integer eid,@RequestParam(value="rid") Integer rid, HttpServletRequest request, HttpServletResponse response){
//        response.setContentType("application/json; charset=UTF-8");
//        Scores scores = scoresService.findScoresByXId(eid,rid);
//        System.out.println(eid+""+rid);
//        request.setAttribute("scores",scores);
//        return "updateScore";
//    }

    //查询学生分数分页
    @RequestMapping(value="/getPageScores",produces = "application/json;charset=UTF-8")
    public String getPageScores(@RequestParam(value="currentPage",defaultValue = "1") Integer currentPage, @RequestParam(value="pageSize",defaultValue = "5") Integer pageSize,HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("application/json; charset=UTF-8");
        Page page = scoresService.findStudentByPage(currentPage,pageSize);
        request.setAttribute("page",page);
        return "score";
    }

}
