package com.xm.controller;

import com.xm.pojo.Admin;
import com.xm.pojo.vo.FileBean;
import com.xm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Admin")
@CrossOrigin
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/file")
    public String file() {
        return "file";
    }

    @RequestMapping(value = "/fail")
    public String fail() {
        return "fail";
    }

    @RequestMapping(value = "/first")
    public String first() {
        return "first";
    }


    @RequestMapping(value="/fileInfo" ,produces = {"application/json;charset=UTF-8"})
    public String fileInfo(HttpServletRequest res) {
        List<FileBean> filelist = new ArrayList<>();
        String path = res.getSession().getServletContext().getRealPath("/WEB-INF/files/");
        File file = new File(path);
        FileBean fb = null;
        for(String s : file.list()) {
            fb = new FileBean();
            fb.setFilename(s);
            filelist.add(fb);
        }
        res.setAttribute("filelist", filelist);
        return "fail";
    }
    @RequestMapping("/saveUpload")
    public String saveUpload(MultipartFile file, HttpServletRequest request) {
        InputStream is = null;
        OutputStream os = null;
        try {
            String path = file.getOriginalFilename();
            if("".equals(path)) {
                return "file";
            }
            String uploadPath = request.getSession().getServletContext().getRealPath("/WEB-INF/files/");
            System.out.println(uploadPath);
            File f = new File(uploadPath);
            if(!f.exists()) {
                f.mkdirs();
            }
            is =file.getInputStream();
            os = new FileOutputStream(new File(f.getAbsolutePath()+"/"+path));
            int rs;
            while((rs = is.read())!=-1) {
                os.write(rs);
            }
            os.close();
            is.close();
        }catch(NullPointerException e) {
            return "file";
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "file";
    }

    @RequestMapping("/download")
    public String download(@RequestParam(value = "filename")String filename, HttpServletRequest res, HttpServletResponse rep) {
//        String filename = res.getParameter("filename");
        System.out.println(filename);
        String path = res.getSession().getServletContext().getRealPath("/WEB-INF/files/")+filename;
        try {
            InputStream is = new BufferedInputStream(new FileInputStream(new File(path)));
            String newfile = filename;
            newfile = URLEncoder.encode(newfile, "UTF-8");//转码
            rep.addHeader("Content-Disposition","attachment;filename="+newfile);//设置文件下载头
            rep.setContentType("multipart/form-data");//自动判断文件类型
            OutputStream os = new BufferedOutputStream(rep.getOutputStream());
            int rs = 0;
            while((rs=is.read())!=-1) {
                os.write(rs);
            }
            os.close();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "fail";
    }

    @RequestMapping(value = "/adminLogin")
    public String adminLogin(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = adminService.adminLogin(username,password);
        System.out.println(admin);
        if (admin !=null){
            if(request.getSession().getAttribute("admin")==null) {
                request.getSession().setAttribute("admin",admin);
            }
            return "admin";
        }else {
            return "adminLogin";
        }
    }


}
