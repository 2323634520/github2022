package com.xm.serviceImpl;

import com.xm.dao.AdminMapper;
import com.xm.pojo.Admin;
import com.xm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin adminLogin(String username,String password) {
        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        Admin adm = adminMapper.adminLogin(admin);
        return adm;
    }
}
