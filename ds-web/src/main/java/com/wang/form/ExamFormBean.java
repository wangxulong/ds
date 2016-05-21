package com.wang.form;

import com.wang.entity.TExam;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by liu on 2016/5/11.
 */
public class ExamFormBean extends TExam{
    //文件
    private MultipartFile pic;
    //试卷类型
    private Integer examTypeId;
    public MultipartFile getPic() {
        return pic;
    }

    public void setPic(MultipartFile pic) {
        this.pic = pic;
    }

    public Integer getExamTypeId() {
        return examTypeId;
    }

    public void setExamTypeId(Integer examTypeId) {
        this.examTypeId = examTypeId;
    }
}
