package com.wang.form;

import com.wang.entity.TCourse;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2016/5/12 0012.
 */
public class CourseFormBean extends TCourse {
    //文件
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
