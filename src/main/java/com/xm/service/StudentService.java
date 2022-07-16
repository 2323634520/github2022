package com.xm.service;

import com.xm.pojo.Student;
import com.xm.pojo.vo.MessageModel;
import com.xm.util.Page;

import java.util.List;
import java.util.Map;

public interface StudentService {

    Student findStudent(String username,String password,Integer state);

    Student findUserByNo(String userNo);

    List<Student> findAllStudent();
    //根据名字查找学生
    Student findStudentByName(String username);
    //根据id查找学生
    Student findStudentById(Integer id);
    //add
    String addStudent(Student student);
    //update
    String updateStudent(Student student);

    String updateState(Student student);
    //delete
    String deleteStudent(Integer id);

    Integer findAllStuCount(String realname);

    Page findStudentByPage(Integer start, Integer row,String searchName);

    Integer selectPerson(Integer id);

    Integer findCountByRoom(Integer roomid);


}
