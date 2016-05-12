package com.wang.service;

import com.wang.dao.TExamDao;
import com.wang.dao.TExamItemDao;
import com.wang.entity.TAttachment;
import com.wang.entity.TExam;
import com.wang.entity.TExamItem;
import com.wang.form.ExamFormBean;
import com.wang.util.UpFilesUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * Created by liu on 2016/5/11.
 */
@Service
@Transactional
public class TExamService {
    @Resource
    private TExamDao tExamDao;
    @Resource
    private TExamItemDao tExamItemDao;
    @Resource
    private TAttachmentService tAttachmentService;

    public void uploadExam(ExamFormBean form) {
        TExam examTemp = new TExam();
        examTemp.setDescription(form.getDescription());
        examTemp.setTitle(form.getTitle());
        examTemp.setStartTime(form.getStartTime());
        examTemp.setEndTime(form.getEndTime());
        examTemp.setYear(form.getYear());
        examTemp.setTerm(form.getTerm());
        if (form.getPic().isEmpty()){  //没有附件
            tExamDao.save(examTemp);
        }else {                         //有附件
            //获取上传的文件
            MultipartFile file = form.getPic();
            //存储文件到指定的位置
            UpFilesUtils.saveFile(file);

            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(UpFilesUtils.savePath);
            tAttachmentService.addAttachment(attachment);
            tExamDao.save(examTemp);
            TExamItem texamItem=new TExamItem();
            texamItem.setExamId(examTemp.getId());
            texamItem.setAttachmentId(attachment.getId());
            texamItem.setType(form.getExamTypeId());
            tExamItemDao.save(texamItem);
        }

    }
}
