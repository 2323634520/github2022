package com.xm.dao;

import com.xm.pojo.News;
import com.xm.util.Page;

import java.util.List;

public interface NewsMapper {

    News findNewsById(Integer id);

    List<News> showNewsAll(Page page);
    //添加news
    Integer insertNews(News news);

    Integer updateNews(News news);

    Integer deleteNewsById(Integer id);

    Integer findAllNewsCount(Page page);

}
