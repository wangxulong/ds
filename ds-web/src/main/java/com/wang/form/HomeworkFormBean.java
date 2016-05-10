package com.wang.form;

import com.wang.entity.THomework;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
public class HomeworkFormBean extends THomework {
    //文件
    private MultipartFile pic;

    public MultipartFile getPic() {
        return pic;
    }

    public void setPic(MultipartFile pic) {
        this.pic = pic;
    }
}
