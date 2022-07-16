package com.xm.dao;


import com.xm.pojo.Admin;

public interface AdminMapper {

    //账号密码登录判断
    Admin adminLogin(Admin admin);
}
