package com.xm.service;

import com.xm.pojo.Rec;
import com.xm.util.Page;

import java.util.List;

public interface RecService {

    String insertRec(Rec rec);

    String deleteRec(Integer id);

    String updateRec(Rec rec);

    List<Rec> showAllRec();

    Rec findRecById(Integer id);

    Integer findAllRecCount();

    Page findRecByPage(Integer start, Integer row);

}
