package com.xm.service;

import com.xm.pojo.Scores;
import com.xm.util.Page;

import java.util.List;

public interface ScoresService {

    String insertScores(Scores scores);

    String deleteScores(Integer id);

    String updateScores(Scores scores);

    List<Scores> showAllScores();

    Scores findScoresById(Integer id);

    Integer findAllStuCount();

    Page findStudentByPage(Integer start, Integer row);
}
