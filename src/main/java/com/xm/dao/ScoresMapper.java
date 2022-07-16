package com.xm.dao;

import com.xm.pojo.Room;
import com.xm.pojo.Scores;
import com.xm.pojo.Student;
import com.xm.util.Page;

import java.util.List;

public interface ScoresMapper {

    Integer insertScores(Scores scores);

    Integer deleteScores(Integer id);

    Integer updateScores(Scores scores);

    List<Scores> showAllScores();

    Scores findScoresById(Integer id);

    Scores findScoresByXid(Integer eid,Integer rid);

    List<Scores> selectByEid(Scores scores);

    Integer findAllStuCount();

    List<Scores> findStudentByPage(Page page);
}
