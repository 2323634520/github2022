package com.xm.dao;

import com.xm.pojo.Rec;
import com.xm.util.Page;
import java.util.List;

public interface RecMapper {

    Integer insertRec(Rec rec);

    Integer deleteRec(Integer id);

    Integer updateRec(Rec Rec);

    List<Rec> showAllRec();

    Rec findRecById(Integer id);

    Integer findAllRecCount();

    List<Rec> findRecByPage(Page page);

}
