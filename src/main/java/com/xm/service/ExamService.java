package com.xm.service;

import com.xm.pojo.Exam;
import com.xm.pojo.Room;

import java.util.List;

public interface ExamService {

    String insertExam(Exam exam);

    String deleteExam(Integer id);

    String updateExam(Exam exam);

    List<Exam> showAllExam();

    Exam findExamById(Integer id);

    String arrangExam(Integer eid);
}
