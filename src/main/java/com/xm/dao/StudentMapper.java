package com.xm.dao;

import com.xm.pojo.Student;
import com.xm.util.Page;

import java.util.InputMismatchException;
import java.util.List;

public interface StudentMapper {

    //账号密码登录判断
    Student findStudent(Student student);
    //人脸识别 userno为百度Al人脸编号
    Student findUserByUserNo(String userNo);
    //查找所有学生
    List<Student> findAllStudent();
    //根据名字查找学生
    Student findStudentByName(String username);
    //根据id查找学生
    Student findStudentById(Integer id);
    //add
    Integer addStudent(Student student);
    //update
    Integer updateStudent(Student student);

    Integer updateState(Student student);
    //delete
    Integer deleteStudent(Integer id);

    Integer findAllStuCount(Page page);

    List<Student> findStudentByPage(Page page);

    Integer selectPerson(Integer id);

    List<Integer> selectAllStudentId();

    Integer findCountByRoom(Integer roomid);

}
