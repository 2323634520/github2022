package com.xm.controller;

import com.alibaba.fastjson.JSON;
import com.xm.pojo.News;
import com.xm.pojo.Student;
import com.xm.service.NewsService;
import com.xm.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/news")
@CrossOrigin
public class NewsController {

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/addNewsPath")
    public String addNewsPath(){
        return "insertNews";
    }

    @RequestMapping(value = "/updateNewsPath")
    public String updateNewsPath(HttpServletRequest request, HttpServletResponse response){
        Integer id = Integer.parseInt(request.getParameter("id"));
        News news = newsService.findNewsById(id);
        request.setAttribute("news",news);
        return "updatedNews";
    }

    @RequestMapping(value = "/addNews",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addNews(News news,HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        return JSON.toJSONString(newsService.insertNews(news));
    }

    @RequestMapping(value="/updateNews",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateNews(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String showtime = request.getParameter("showtime");
        String author = request.getParameter("author") ;System.out.println(id+""+title);
        News news = new News();
        news.setId(id);
        news.setTitle(title);
        news.setContent(content);
        news.setAuthor(author);
        news.setShowtime(showtime);
        String rs = newsService.updateNews(news);
        return JSON.toJSONString(rs);
    }

    @RequestMapping(value="/deleteNews",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deleteNews(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        String rs = newsService.deleteNewsById(id);
        return JSON.toJSONString(rs);
    }

    @RequestMapping(value = "/showNewsAll")
    public String showNewsAll(@RequestParam(value="currentPage",defaultValue = "1") Integer currentPage, @RequestParam(value="pageSize",defaultValue = "1") Integer pageSize,@RequestParam(value="type",defaultValue = "1") Integer type ,HttpServletRequest request, HttpServletResponse response){
        Page page = newsService.showNewsAll(currentPage,pageSize);
        request.setAttribute("page",page);
        return "news";
    }

    @RequestMapping(value = "/showNews")
    public String showNews(@RequestParam(value="currentPage",defaultValue = "1") Integer currentPage, @RequestParam(value="pageSize",defaultValue = "1") Integer pageSize,@RequestParam(value="type",defaultValue = "1") Integer type ,HttpServletRequest request, HttpServletResponse response){
        Page page = newsService.showNewsAll(currentPage,pageSize);
        request.setAttribute("page",page);
        return "stuNews";
    }



    @RequestMapping(value = "/findNewsById")
    public String findNewsById(@RequestParam(value="id") Integer id, HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json; charset=UTF-8");
        News news = newsService.findNewsById(id);
        request.setAttribute("news",news);
        return "updatedNews";
    }
}
