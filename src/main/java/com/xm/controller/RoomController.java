package com.xm.controller;

import com.alibaba.fastjson.JSON;
import com.xm.pojo.News;
import com.xm.pojo.Room;
import com.xm.pojo.Student;
import com.xm.service.RoomService;
import com.xm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Room")
@CrossOrigin
public class RoomController {

    @Autowired
    private RoomService roomService;
    private StudentService studentService;

    @RequestMapping(value = "/roominfo")
    public String roominfo() {
        return "roominfo";
    }

    @RequestMapping(value = "/updateRoom")
    public String updateRoom() {
        return "updateRoom";
    }

    @RequestMapping(value = "/addRoom")
    public String addRoom() {
        return "addRoom";
    }

    @RequestMapping(value = "/echarts")
    public String echarts() {
        return "echarts";
    }

    @RequestMapping(value="/echartsNum",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<Integer> echartsNum(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        ArrayList<Integer> countlist = new ArrayList<>();
        Integer num1 = studentService.findCountByRoom(1);
        Integer num2 = studentService.findCountByRoom(2);
        Integer num3 = studentService.findCountByRoom(3);
        countlist.add(num1);
        countlist.add(num2);
        countlist.add(num3);
        request.setAttribute("countList",countlist);
        System.out.println("asdasd"+countlist);
        return countlist;
    }

    @RequestMapping(value = "/addRooms",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addRooms(Room room, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        System.out.println(room);
        return JSON.toJSONString(roomService.insertRoom(room));
    }

    @RequestMapping(value = "/delRooms",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delRooms(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer roomid = Integer.parseInt(request.getParameter("roomid"));
        System.out.println(roomid);
        String rs = roomService.deleteRoom(roomid);
        return JSON.toJSONString(rs);
    }


    @RequestMapping(value="/updateRooms",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateRooms(Room room,HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        System.out.println(room);
        return JSON.toJSONString(roomService.updateRoom(room));
    }


    @RequestMapping(value="/selectRoom",produces = "application/json;charset=UTF-8")
    public String selectPerson(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        List<Room> rooms = roomService.showAllRoom();
        request.setAttribute("rooms",rooms);
        return "register";
    }


    @RequestMapping(value = "/showAllRoom",produces = "application/json;charset=UTF-8")
    public String showAllRoom(Room room, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        List<Room> roomList = roomService.showAllRoom();
        request.setAttribute("roomList",roomList);
        return "roominfo";
    }

    @RequestMapping(value = "/showAllRooms",produces = "application/json;charset=UTF-8")
    public String showAllRooms(Room room, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        List<Room> roomList = roomService.showAllRoom();
        request.setAttribute("roomList",roomList);
        return "stuRoomInfo";
    }


    @RequestMapping(value = "/findRoomById")
    public String findRoomById(@RequestParam(value="roomid") Integer roomid, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Room room = roomService.findRoomById(roomid);
        System.out.println(roomid);
        request.setAttribute("room",room);
        return "updateRoom";
    }

}
