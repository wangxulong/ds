package com.wang.service;

import com.wang.dao.TExamDao;
import com.wang.dao.TExamItemDao;
import com.wang.entity.TAttachment;
import com.wang.entity.TExam;
import com.wang.entity.TExamItem;
import com.wang.form.ExamFormBean;
import com.wang.util.UpFilesUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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
    //上传试卷
    public void uploadExam(ExamFormBean form) {
        TExam examTemp = new TExam();
        TExamItem texamItem=new TExamItem();
        examTemp.setDescription(form.getDescription());
        examTemp.setTitle(form.getTitle());
        examTemp.setStartTime(form.getStartTime());
        examTemp.setEndTime(form.getEndTime());
        examTemp.setYear(form.getYear());
        examTemp.setTerm(form.getTerm());
        tExamDao.save(examTemp);
        texamItem.setExamId(examTemp.getId());
        texamItem.setType(form.getExamTypeId());
        if (!form.getPic().isEmpty()){  //有附件
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
            texamItem.setAttachmentId(attachment.getId());
        }
        tExamItemDao.save(texamItem);

    }
    //查找试卷
    public boolean searchExist(int year,int term,int type){
        boolean flag=false;
        List<TExam> exams=tExamDao.isExamExist(year,term);
        if(exams.size()!=0) {
            int examsId = exams.get(0).getId();
            TExamItem tExamItem = tExamItemDao.getItemByExamIdAndType(examsId, type);
            if (tExamItem != null)
                flag = true;
        }
        return flag;
    }
    //查找该门课程该老师所有布置的试卷
    public List<ExamFormBean> getAllExams(){
        List<ExamFormBean> examFormBeans = new ArrayList<ExamFormBean>();
        List<TExam> exams;
        exams=tExamDao.findAll();
        if(exams.size()!=0) {
            for (int i = 0; i < exams.size(); i++) {
                TExam exam=exams.get(i);
                List<TExamItem> listTypeItem=tExamItemDao.getItemByExamId(exams.get(i).getId());
                int len=listTypeItem.size();
                for(int j=0;j<len;j++){
                    ExamFormBean temp=new ExamFormBean();
                    BeanUtils.copyProperties(exam,temp);
                    temp.setExamTypeId(listTypeItem.get(j).getType());
                    examFormBeans.add(temp);
                }
            }
        }
        return examFormBeans;
    }

}
