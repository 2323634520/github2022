package com.xm.serviceImpl;

import com.xm.dao.ScoresMapper;
import com.xm.dao.StudentMapper;
import com.xm.pojo.Scores;
import com.xm.pojo.Student;
import com.xm.pojo.vo.MessageModel;
import com.xm.service.ScoresService;
import com.xm.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoresServiceImpl implements ScoresService {

    @Autowired
    private ScoresMapper scoresMapper;
    @Autowired
    private StudentMapper studentMapper;


    @Override
    public String insertScores(Scores scores) {
        Integer rs = scoresMapper.insertScores(scores);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String deleteScores(Integer id) {
        Integer rs = scoresMapper.deleteScores(id);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String updateScores(Scores scores) {
        Integer rs = scoresMapper.updateScores(scores);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public List<Scores> showAllScores() {
        return scoresMapper.showAllScores();
    }

    @Override
    public Scores findScoresById(Integer id) {
        return scoresMapper.findScoresById(id);
    }

    @Override
    public Integer findAllStuCount() {
        return scoresMapper.findAllStuCount();
    }

    @Override
    public Page findStudentByPage(Integer start, Integer row) {
        List<Scores> list = null;
        Page page = new Page();
        page.setCurrentPage(start);
        page.setPageSize(row);
        page.setStartPage((start-1)*row);
        page.setTotalCount(findAllStuCount());
        page.setTotalPage(page.getTotalCount()%row==0?page.getTotalCount()/row:page.getTotalCount()/row+1);
        list = scoresMapper.findStudentByPage(page);
        page.setScoreList(list);
        return page;
    }
}
