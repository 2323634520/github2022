package com.xm.dao;

import com.xm.pojo.Exam;
import com.xm.pojo.Scores;

import java.util.List;

public interface ExamMapper {

    Integer insertExam(Exam exam);

    Integer deleteExam(Integer id);

    Integer updateExam(Exam exam);

    List<Exam> showAllExam();

    Exam findExamById(Integer id);

    Integer insertExamInfo(List<Scores> list);
}
