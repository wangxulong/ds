package com.wang.service;

import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SecurityService;
import com.wang.dao.TExamDao;
import com.wang.dao.TExamItemDao;
import com.wang.dao.TeacherDao;
import com.wang.entity.TAttachment;
import com.wang.entity.TExam;
import com.wang.entity.TExamItem;
import com.wang.entity.TTeacher;
import com.wang.form.ExamFormBean;
import com.wang.util.UpFilesUtils;
import org.hibernate.type.IntegerType;
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
    private TeacherDao teacherDao;
    @Resource
    private TAttachmentService tAttachmentService;
    @Resource
    private SecurityService securityService;
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
        //绑定老师以及课程的id
        TTeacher tTeacher=securityService.getLoginTeacher();
        if(tTeacher!=null)
            examTemp.setTeacherId(tTeacher.getId());
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
    //查找试卷是否存在
    public boolean searchExist(int year,int term,int type){
        boolean flag=false;
        TTeacher tTeacher=securityService.getLoginTeacher();
        List<TExam> exams=tExamDao.isExamExist(year,term,tTeacher.getId());
        int len=exams.size();
        if(len!=0) {
            for(int i=0;i<len;i++) {
                int examsId = exams.get(i).getId();
                TExamItem tExamItem = tExamItemDao.getItemByExamIdAndType(examsId, type);
                if (tExamItem != null)
                    flag = true;
            }
        }
        return flag;
    }
    //查找该老师所有布置的试卷
    public List<ExamFormBean> getAllExams(){
        List<ExamFormBean> examFormBeans = new ArrayList<ExamFormBean>();
        List<TExam> exams;
        TTeacher tTeacher=securityService.getLoginTeacher();
        exams=tExamDao.findTeacherExam(tTeacher.getId());
        if(exams.size()!=0) {
            for (int i = 0; i < exams.size(); i++) {
                TExam exam=exams.get(i);
                List<TExamItem> listTypeItem=tExamItemDao.getItemByExamId(exams.get(i).getId());
                int len=listTypeItem.size();
                if(len!=0) {
                    for (int j = 0; j < len; j++) {
                        ExamFormBean temp = new ExamFormBean();
                        BeanUtils.copyProperties(exam, temp);
                        temp.setExamTypeId(listTypeItem.get(j).getType());
                        examFormBeans.add(temp);
                    }
                }else{
                    ExamFormBean temp = new ExamFormBean();
                    BeanUtils.copyProperties(exam, temp);
                    examFormBeans.add(temp);
                }
            }
        }
        return examFormBeans;
    }
    //查找考试试卷
    public TExam getExamById(Integer id){
        TExam tExam=tExamDao.findOne(id);
        return tExam;
    }
    //更新考试试卷
    public void updateExam(ExamFormBean form) {
        TExam examTemp = new TExam();
        examTemp.setId(form.getId());
        examTemp.setDescription(form.getDescription());
        examTemp.setTitle(form.getTitle());
        examTemp.setStartTime(form.getStartTime());
        examTemp.setEndTime(form.getEndTime());
        examTemp.setYear(form.getYear());
        examTemp.setTerm(form.getTerm());
        //绑定老师以及课程的id
        SysUser sysUser = securityService.getLoginUser();
        String jobNumber =  sysUser.getUserName();
        TTeacher tTeacher = teacherDao.findByJobNumber(jobNumber);
        if(tTeacher!=null)
            examTemp.setTeacherId(tTeacher.getId());
        /*一个老师对应一门课程
        examTemp.setCourseId(1);
        */
        tExamDao.saveAndFlush(examTemp);
        if (!form.getPic().isEmpty()){  //有附件
            TExamItem texamItem=tExamItemDao.getItemByExamIdAndType(form.getId(),form.getExamTypeId());
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
            tExamItemDao.saveAndFlush(texamItem);
        }
    }
    //根据考试的id和学期的类型删除考试记录以及考试和item的记录
    public void deletExam(Integer id, Integer type) {
        TExamItem texamItem=tExamItemDao.getItemByExamIdAndType(id,type);
        tExamItemDao.delete(texamItem);
        tExamDao.delete(id);
    }

}
