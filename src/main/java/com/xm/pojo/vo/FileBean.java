package com.xm.pojo.vo;

public class FileBean {

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    private String filename;

    @Override
    public String toString() {
        return "FileBean{" +
                "filename='" + filename + '\'' +
                '}';
    }
}
