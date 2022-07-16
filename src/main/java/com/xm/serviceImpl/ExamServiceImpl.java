package com.xm.serviceImpl;

import com.xm.dao.ExamMapper;
import com.xm.dao.ScoresMapper;
import com.xm.dao.StudentMapper;
import com.xm.pojo.Exam;
import com.xm.pojo.Scores;
import com.xm.pojo.vo.MessageModel;
import com.xm.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ExamServiceImpl implements ExamService {

    @Autowired
    private ExamMapper examMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ScoresMapper scoresMapper;

    @Override
    public String insertExam(Exam exam) {
        Integer rs = examMapper.insertExam(exam);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String deleteExam(Integer id) {
        Integer rs = examMapper.deleteExam(id);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String updateExam(Exam exam) {
        Integer rs = examMapper.updateExam(exam);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;

    }

    @Override
    public List<Exam> showAllExam() {
        return examMapper.showAllExam();
    }

    @Override
    public Exam findExamById(Integer id) {
        return examMapper.findExamById(id);
    }

    @Override
    public String arrangExam(Integer eid) {
        Scores s = new Scores();
        s.setEid(eid);
        List<Scores> ls = scoresMapper.selectByEid(s);
        if(ls.size() > 0){
            return "该次考试已被安排";
        }
        List<Integer> listId = studentMapper.selectAllStudentId();
        List<Scores> list = new ArrayList<>();
        Scores scores = null;
        int i ;
        for(i=0;i<listId.size();i++){
            scores = new Scores();
            scores.setSid(listId.get(i));
            scores.setEid(eid);
            list.add(scores);
        }
        Integer rs = examMapper.insertExamInfo(list);
        if(rs > 0){
            return MessageModel.s_msg;
        }else {
            return MessageModel.f_msg;
        }
    }
}
