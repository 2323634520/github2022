package com.xm.serviceImpl;

import com.xm.dao.StudentMapper;
import com.xm.pojo.Student;
import com.xm.pojo.vo.MessageModel;
import com.xm.service.StudentService;
import com.xm.util.Page;
import com.xm.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public Student findStudent(String username,String password,Integer state) {
        Student student = new Student();
        student.setUsername(username);
        student.setPassword(password);
        student.setState(state);
        Student stu = studentMapper.findStudent(student);
        return stu;
    }

    @Override
    public Student findUserByNo(String userNo) {

        return studentMapper.findUserByUserNo(userNo);
    }

    @Override
    public List<Student> findAllStudent() {

        return studentMapper.findAllStudent();
    }

    @Override
    public Student findStudentByName(String username) {

        return studentMapper.findStudentByName(username);
    }

    @Override
    public Student findStudentById(Integer id) {
        return studentMapper.findStudentById(id);
    }

    @Override
    public String addStudent(Student student) {
        student.setUserno(UUIDUtil.getOneUUID());
        int rs = studentMapper.addStudent(student);
        System.out.println(rs);
        if(rs > 0){
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String updateStudent(Student student) {
        int rs = studentMapper.updateStudent(student);
        if(rs>0){
            return MessageModel.s_msg;
        }else {
            return MessageModel.f_msg;
        }
    }

    @Override
    public String updateState(Student student) {
        int rs = studentMapper.updateState(student);
        if(rs>0){
            return MessageModel.s_msg;
        }else {
            return MessageModel.f_msg;
        }
    }

    @Override
    public String deleteStudent(Integer id) {
        int rs = studentMapper.deleteStudent(id);
        if(rs > 0){
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public Integer findAllStuCount(String realname) {
        Page page = new Page();
        page.setRealname(realname);
        return studentMapper.findAllStuCount(page);
    }

    @Override
    public Page findStudentByPage(Integer start, Integer row,String searchName) {
        List<Student> list = null;
        Page page = new Page();
        page.setRealname(searchName);
        page.setCurrentPage(start);
        page.setPageSize(row);
        page.setStartPage((start-1)*row);
        page.setTotalCount(findAllStuCount(searchName));
        page.setTotalPage(page.getTotalCount()%row==0?page.getTotalCount()/row:page.getTotalCount()/row+1);
        list = studentMapper.findStudentByPage(page);
        page.setsList(list);
        return page;
    }

    @Override
    public Integer selectPerson(Integer id) {
        return studentMapper.selectPerson(id);
    }

    @Override
    public Integer findCountByRoom(Integer roomid) {
        return studentMapper.findCountByRoom(roomid);
    }

}
