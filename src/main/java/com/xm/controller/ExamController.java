package com.xm.controller;

import com.alibaba.fastjson.JSON;
import com.xm.pojo.Exam;
import com.xm.pojo.Room;
import com.xm.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.print.DocFlavor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/Exam")
@CrossOrigin
public class ExamController {
    @Autowired
    private ExamService examService;

    @RequestMapping(value = "/exam")
    public String exam() {
        return "exam";
    }

    @RequestMapping(value = "/addExam")
    public String addExam() {
        return "addExam";
    }

    @RequestMapping(value = "/updateExam")
    public String updateExam() {
        return "updateExam";
    }

    @RequestMapping(value = "/arrangeExam",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String arrangeExam(HttpServletRequest request,HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer eid = Integer.parseInt(request.getParameter("eid"));
        String rs = examService.arrangExam(eid);
        return JSON.toJSONString(rs);
    }


    @RequestMapping(value="/updateExams",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateExams(Exam exam, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        return JSON.toJSONString(examService.updateExam(exam));
    }


    @RequestMapping(value = "/showAllExam",produces = "application/json;charset=UTF-8")
    public String showAllExam(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        List<Exam> examList = examService.showAllExam();
        System.out.println(examList);
        request.setAttribute("examList",examList);
        return "arrangeexam";
    }

    @RequestMapping(value = "/showAllExams",produces = "application/json;charset=UTF-8")
    public String showAllExams(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        List<Exam> examList = examService.showAllExam();
        System.out.println(examList);
        request.setAttribute("examList",examList);
        return "exam";
    }

    @RequestMapping(value = "/showAllExamss",produces = "application/json;charset=UTF-8")
    public String showAllExamss(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        List<Exam> examList = examService.showAllExam();
        System.out.println(examList);
        request.setAttribute("examList",examList);
        return "stuExam";
    }


    @RequestMapping(value = "/findExamById")
    public String findExamById(@RequestParam(value="eid") Integer eid, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Exam exam= examService.findExamById(eid);
        System.out.println(eid);
        request.setAttribute("exam",exam);
        return "updateExam";
    }

    @RequestMapping(value = "/addExams",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addExams(Exam exam, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        System.out.println(exam);
        return JSON.toJSONString(examService.insertExam(exam));
    }

    @RequestMapping(value = "/delExams",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delExams(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer eid = Integer.parseInt(request.getParameter("eid"));
        System.out.println(eid);
        String rs = examService.deleteExam(eid);
        return JSON.toJSONString(rs);
    }
}
