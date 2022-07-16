package com.xm.service;

import com.xm.pojo.News;
import com.xm.util.Page;

import java.util.List;

public interface NewsService {

    News findNewsById(Integer id);

    Page showNewsAll(Integer start, Integer row);

    Integer findAllNewsCount();

    String insertNews(News news);

    String updateNews(News news);

    String deleteNewsById(Integer id);

}
