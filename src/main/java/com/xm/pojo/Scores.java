package com.xm.pojo;

public class Scores{

    private Integer id;

    private Integer sid;

    private Integer eid;

    private Integer score;

    private String realname;

    private String classinfo;

    private String username;

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    private String ename;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getClassinfo() {
        return classinfo;
    }

    public void setClassinfo(String classinfo) {
        this.classinfo = classinfo;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Scores{" +
                "id=" + id +
                ", sid=" + sid +
                ", eid=" + eid +
                ", score=" + score +
                ", realname='" + realname + '\'' +
                ", classinfo='" + classinfo + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}
