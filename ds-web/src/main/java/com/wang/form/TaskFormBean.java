package com.wang.form;

import com.wang.entity.TTask;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2016/5/12 0012.
 */
public class TaskFormBean extends TTask {
    //文件
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile pic) {
        this.file = pic;
    }
}
