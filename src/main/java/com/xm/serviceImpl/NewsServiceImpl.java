package com.xm.serviceImpl;

import com.xm.dao.NewsMapper;
import com.xm.pojo.News;
import com.xm.pojo.Student;
import com.xm.pojo.vo.MessageModel;
import com.xm.service.NewsService;
import com.xm.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public News findNewsById(Integer id) {
        return newsMapper.findNewsById(id);
    }

    @Override
    public Page showNewsAll(Integer start, Integer row) {
        List<News> list = null;
        Page page = new Page();
        page.setCurrentPage(start);
        page.setPageSize(row);
        page.setStartPage((start-1)*row);
        page.setTotalCount(findAllNewsCount());
        page.setTotalPage(page.getTotalCount()%row==0?page.getTotalCount()/row:page.getTotalCount()/row+1);
        list = newsMapper.showNewsAll(page);
        page.setNewsList(list);
        return page;
    }

    @Override
    public Integer findAllNewsCount() {
        Page page = new Page();
        return newsMapper.findAllNewsCount(page);
    }

    @Override
    public String insertNews(News news) {
        Integer rs = newsMapper.insertNews(news);
        if (rs>0){
            return MessageModel.s_msg;
        }
        return MessageModel.f_msg;
    }

    @Override
    public String updateNews(News news) {
        int rs = newsMapper.updateNews(news);
        if(rs>0){
            return MessageModel.s_msg;
        }else {
            return MessageModel.f_msg;
        }
    }

    @Override
    public String deleteNewsById(Integer id){
        int rs = newsMapper.deleteNewsById(id);
        if(rs > 0){
            return MessageModel.s_msg;
         }
            return MessageModel.f_msg;
    }
}
