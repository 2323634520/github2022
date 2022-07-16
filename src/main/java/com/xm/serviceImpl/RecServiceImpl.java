package com.xm.serviceImpl;

import com.xm.dao.RecMapper;
import com.xm.pojo.Rec;
import com.xm.pojo.vo.MessageModel;
import com.xm.service.RecService;
import com.xm.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class RecServiceImpl implements RecService {

    @Autowired
    private RecMapper recMapper;
    @Override
    public String insertRec(Rec rec) {
        Integer rs = recMapper.insertRec(rec);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String deleteRec(Integer id) {
        Integer rs =recMapper.deleteRec(id);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String updateRec(Rec rec) {
        Integer rs = recMapper.updateRec(rec);
        if (rs > 0) {
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public List<Rec> showAllRec() {
        return recMapper.showAllRec();
    }

    @Override
    public Rec findRecById(Integer id) {
        return recMapper.findRecById(id);
    }

    @Override
    public Integer findAllRecCount() {
        return recMapper.findAllRecCount();
    }

    @Override
    public Page findRecByPage(Integer start, Integer row) {
        List<Rec> rlist = null;
        Page page = new Page();
        page.setCurrentPage(start);
        page.setPageSize(row);
        page.setStartPage((start-1)*row);
        page.setTotalCount(findAllRecCount());
        page.setTotalPage(page.getTotalCount()%row==0?page.getTotalCount()/row:page.getTotalCount()/row+1);
        rlist = recMapper.findRecByPage(page);
        return page;
    }
}
