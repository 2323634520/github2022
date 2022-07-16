package com.xm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xm.baidu.FaceSearch;
import com.xm.pojo.Room;
import com.xm.pojo.Student;
import com.xm.service.StudentService;
import com.xm.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Student")
@CrossOrigin
public class StudentController {

    @Autowired
    private StudentService studentService;


    //登录界面
    @RequestMapping(value = "/loginPage")
    public String loginPage() {
        return "login";
    }

    //注册界面
    @RequestMapping(value = "/register")
    public String resister() {
        return "register";
    }

    @RequestMapping(value = "/stuInfo")
    public String stuInfo() {
        return "stuInfo";
    }

    @RequestMapping(value = "/stuUpdate")
    public String stuUpdate() {
        return "stuUpdate";
    }

    //人脸识别界面
    @RequestMapping(value = "/faceLoginPage")
    public String faceLoginPage() {
        return "face";
    }

    //主界面
    @RequestMapping(value = "/mainPage")
    public String mainPage() {
        return "admin";
    }

    //修改学生信息界面
    @RequestMapping(value = "/updatePage")
    public String updatePage(){
        return "updateStu";
    }

    //添加学生信息界面
    @RequestMapping(value = "/addPage")
    public String addPage(){
        return "addStu";
    }

    @RequestMapping(value = "/getAllData")
    public String getAllData(HttpServletRequest request){
        request.getSession().removeAttribute("searchName");
        return "redirect:getPageStudent";
    }

  //学生登录界面
    @RequestMapping(value = "/studentLogin")
    public String studentLogin(HttpServletRequest request,HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Integer state = 1;
        Student student = studentService.findStudent(username,password,state);
        System.out.println(student);
        if (student !=null){
            if(request.getSession().getAttribute("student")==null) {
                request.getSession().setAttribute("student",student);
            }
            return "stuIndex";
        }else {
            return "login";
        }
    }

    //人脸识别
    @RequestMapping(value = "/faceLogin",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String faceLogin(HttpServletRequest request,HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Map<String,Object> map = new HashMap();
        String img = request.getParameter("img");
        String base64 = img.split(",")[1];
        String rs = FaceSearch.faceSearch(base64);
        JSONObject jsonObject = JSON.parseObject(rs);
        int code = jsonObject.getInteger("error_code");
        try {
            JSONObject jo2 = jsonObject.getJSONObject("result");
            JSONArray jsa = jo2.getJSONArray("user_list");
            JSONObject us = jsa.getJSONObject(0);
            String userNo = us.getString("user_id");
            double score = us.getDoubleValue("score");
            if(code==0) {
                if(score>=85) {
                    System.out.println(userNo);
                    Student student = studentService.findUserByNo(userNo);
                    System.out.println(student);
                    if(student!=null) {
                        map.put("code", code);
                        if(request.getSession().getAttribute("student")==null) {
                            request.getSession().setAttribute("student",student);
                        }
                        return JSON.toJSONString(map);
                    }
                    map.put("code", 2);
                    return JSON.toJSONString(map);
                }
                map.put("code", 1);
                return JSON.toJSONString(map);
            }
        }catch(NullPointerException e) {
            map.put("code", code);
            return JSON.toJSONString(map);
        }
        return JSON.toJSONString(map);
    }

    //注销
    @RequestMapping(value = "/exit")
    public String exit(HttpServletRequest request,HttpServletResponse response){
        Student student = (Student) request.getSession().getAttribute("student");
        if (student != null){
            request.getSession().removeAttribute("student");
        }
        return "login";
    }

    //获取所有学生
    @RequestMapping(value = "/getAllStudent")
    public String getAllStudent(HttpServletRequest request,HttpServletResponse response){
        List<Student> studentList = studentService.findAllStudent();
        request.setAttribute("studentList",studentList);
        return "main";
    }

    //通过id删除学生
    @RequestMapping(value="/deleteStu",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deleteStu(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        return JSON.toJSONString(studentService.deleteStudent(id));
    }

    //查询学生分页
    @RequestMapping(value="/getPageStudent",produces = "application/json;charset=UTF-8")
    public String getPageData(@RequestParam(value="currentPage",defaultValue = "1") Integer currentPage, @RequestParam(value="pageSize",defaultValue = "5") Integer pageSize,@RequestParam(value="searchName",defaultValue = "") String searchName,@RequestParam(value="type",defaultValue = "1") Integer type ,HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("application/json; charset=UTF-8");
        System.out.println(searchName+"--"+type);
        String name = searchName;
        if(type==0){
            request.getSession().setAttribute("searchName",searchName);
        }else {
            name = (String)request.getSession().getAttribute("searchName");
        }
        Page page = studentService.findStudentByPage(currentPage,pageSize,name);
        request.setAttribute("page",page);
        return "main";
    }

    //添加学生
    @RequestMapping(value = "/addStudent",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addStudent(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String realname = request.getParameter("realname");
        String classinfo = request.getParameter("classinfo");
        String phonenum = request.getParameter("phonenum");
        Integer roomid = Integer.parseInt(request.getParameter("roomid"));
        System.out.println(username+"---"+password+"----"+realname+""+roomid);
        Student student = new Student();
        student.setUsername(username);
        student.setPassword(password);
        student.setRealname(realname);
        student.setClassinfo(classinfo);
        student.setPhonenum(phonenum);
        student.setRoomid(roomid);
        String rs = studentService.addStudent(student);
        return JSON.toJSONString(rs);
    }

    //更新学生信息
    @RequestMapping(value="/updateStu",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateStu(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String realname = request.getParameter("realname");
        String classinfo = request.getParameter("classinfo");
        String phonenum = request.getParameter("phonenum");
        Student student = new Student();
        student.setId(id);
        student.setUsername(username);
        student.setPassword(password);
        student.setRealname(realname);
        student.setClassinfo(classinfo);
        student.setPhonenum(phonenum);
        String rs = studentService.updateStudent(student);
        request.getSession().setAttribute("student",student);
        return JSON.toJSONString(rs);
    }

    //通过id查找学生
    @RequestMapping(value = "/findStuById")
    public String findStuById(@RequestParam(value="id") Integer id,HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        System.out.println(id);
        Student student = studentService.findStudentById(id);
        request.setAttribute("student",student);
        return "updateStu";
    }

    @RequestMapping(value = "/updateState")
    public String updateState(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        Student student = new Student();
        student.setId(id);
        studentService.updateState(student);
        return "redirect:getPageStudent";
    }


}
