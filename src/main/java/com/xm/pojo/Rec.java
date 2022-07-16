package com.xm.pojo;


public class Rec {

    private Integer id;

    private String realname;

    private String sex;

    private Integer age;

    private String roomname;

    private String classinfo;

    private String phonenum;

    private String infor;

    private Integer state;

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getInfor() {
        return infor;
    }

    public void setInfor(String infor) {
        this.infor = infor;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
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

    @Override
    public String toString() {
        return "Rec{" +
                "id=" + id +
                ", realname='" + realname + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", roomname='" + roomname + '\'' +
                ", classinfo='" + classinfo + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", infor='" + infor + '\'' +
                ", state=" + state +
                '}';
    }
}