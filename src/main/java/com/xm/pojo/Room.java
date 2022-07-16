package com.xm.pojo;

public class Room{

    private Integer roomid;

    private String category;

    private Integer num;

    private String address;

    private String person;

    private String email;

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomid=" + roomid +
                ", category='" + category + '\'' +
                ", num=" + num +
                ", address='" + address + '\'' +
                ", person='" + person + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}