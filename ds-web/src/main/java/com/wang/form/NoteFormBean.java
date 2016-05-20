package com.wang.form;

import com.wang.entity.TCourse;
import com.wang.entity.TNote;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Jichao on 2016/5/20 0012.
 */
public class NoteFormBean extends TNote {
    //文件
    private String statusName;

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}
