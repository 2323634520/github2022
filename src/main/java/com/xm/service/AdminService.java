package com.xm.service;

import com.xm.pojo.Admin;

public interface AdminService {

    //账号密码登录判断
    Admin adminLogin(String username,String password);
}
