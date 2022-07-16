package com.xm.pojo;

public class Student {

    private int id;
    private String username;
    private String password;
    private String realname;
    private String userno;
    private String classinfo;
    private String phonenum;
    private Integer state;
    private int roomid;
    private String category;

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    private String ename;
    private int score;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Student(){
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getUserno() {
        return userno;
    }

    public void setUserno(String userno) {
        this.userno = userno;
    }

    public String getClassinfo() {
        return classinfo;
    }

    public void setClassinfo(String classinfo) {
        this.classinfo = classinfo;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realname='" + realname + '\'' +
                ", userno='" + userno + '\'' +
                ", classinfo='" + classinfo + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", state=" + state +
                ", roomid=" + roomid +
                ", category='" + category + '\'' +
                '}';
    }
}
