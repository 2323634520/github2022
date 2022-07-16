package com.xm.util;

import com.xm.pojo.News;
import com.xm.pojo.Rec;
import com.xm.pojo.Scores;
import com.xm.pojo.Student;

import java.util.List;

public class Page {

	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	private String realname;
	private int currentPage;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	private int totalCount;
	private int totalPage;
	private int startPage;
	private int pageSize;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	private List<Student> sList;

	public List<Scores> getScoreList() {
		return scoreList;
	}

	public void setScoreList(List<Scores> scoreList) {
		this.scoreList = scoreList;
	}

	private List<Scores> scoreList;


	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public List<Student> getsList() {
		return sList;
	}
	public void setsList(List<Student> sList) {
		this.sList = sList;
	}

	private List<News> newsList;

	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

}
