package com.wang.service;

import com.wang.dao.RcourseStudentDao;
import com.wang.dao.TCourseDao;
import com.wang.dao.THomeworkDao;
import com.wang.dao.TTaskDao;
import com.wang.entity.*;
import com.wang.form.HomeworkFormBean;
import com.wang.util.UpFilesUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
@Service
@Transactional
public class THomeworkService {
    @Resource
    private THomeworkDao tHomeworkDao;
    @Resource
    private TAttachmentService tAttachmentService;

    @Resource
    private RcourseStudentDao rcourseStudentDao;
    @Resource
    private TCourseDao tCourseDao;
    @Resource
    private TTaskDao tTaskDao;

    /*获取所有的作业*/
    public List<THomework> getAllTHomeWork(){
        List<THomework> list = new ArrayList<THomework>();
        list = tHomeworkDao.findAll();
        return list;
    }

    /*获取某一次作业*/
    public THomework getOneTHomeWork(int id){
       THomework homework = new THomework();
        homework = tHomeworkDao.findOne(id);
        return homework;
    }
    /*获取作业的附件*/
    public TAttachment getAttachment(int id){
        THomework homework = tHomeworkDao.findOne(id);
        if(homework.getAttachmentId()!=null){
           TAttachment tAttachment = tAttachmentService.getOneAttachment(homework.getAttachmentId());
            return tAttachment;
        }else{
            return null;
        }
    }
    /*删除某一次作业*/
    public  void deleteOneHomeWork(int id){
        tHomeworkDao.delete(id);
    }
    /*删除多次作业*/
    public void deleteSomeHomeWork(int[] arrayId){
        for (int i=0;i<arrayId.length;i++){
            deleteOneHomeWork(arrayId[i]);
        }

    }
    /*保存并更新*/
    public void updateOneHomeWork(HomeworkFormBean homework){
        THomework  homeworkTemp = new THomework();
        homeworkTemp.setId(homework.getId());
        homeworkTemp.setTopic(homework.getTopic());
        homeworkTemp.setFinshTime(homework.getFinshTime());
        homeworkTemp.setDescription(homework.getDescription());

        if (homework.getPic().isEmpty()){  //没有附件
            tHomeworkDao.saveAndFlush(homeworkTemp);
        }else {
            //获取上传的文件
            MultipartFile file = homework.getPic();
            //存储文件到指定的位置
            UpFilesUtils.saveFile(file);

            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(UpFilesUtils.savePath);
            tAttachmentService.addAttachment(attachment);

            homeworkTemp.setAttachmentId(attachment.getId());
            tHomeworkDao.save(homeworkTemp);
        }

    }

    /*添加作业*/
    public void addOneHomeWork(HomeworkFormBean homework){

        THomework  homeworkTemp = new THomework();
        homeworkTemp.setTopic(homework.getTopic());
        homeworkTemp.setFinshTime(homework.getFinshTime());
        homeworkTemp.setDescription(homework.getDescription());

        if (homework.getPic().isEmpty()){  //没有附件

            tHomeworkDao.save(homeworkTemp);

        }else {                         //有附件
            //获取上传的文件
            MultipartFile file = homework.getPic();
            //存储文件到指定的位置
            UpFilesUtils.saveFile(file);

            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(UpFilesUtils.savePath);
            tAttachmentService.addAttachment(attachment);

            homeworkTemp.setAttachmentId(attachment.getId());
            tHomeworkDao.save(homeworkTemp);

        }

    }

    /*THomework 和 HomeworkFormBean转换*/
    public HomeworkFormBean  homeworkToFormBean(int id){
        THomework  homeworkTemp = getOneTHomeWork(id);
        MultipartFile file=null;
        HomeworkFormBean homeWork = new HomeworkFormBean ();
        homeWork.setId(homeworkTemp.getId());
        homeWork.setTopic(homeworkTemp.getTopic());
        homeWork.setDescription(homeworkTemp.getDescription());
        homeWork.setFinshTime(homeworkTemp.getFinshTime());
        homeWork.setPic(file);
        return  homeWork;
    }

    /*根据学生Id获取学生要做的作业有哪些*/
    public THomework getTodoHomeWork(int id){
        RCourseStudent rCourseStudent = rcourseStudentDao.findOne(id);
        if (rCourseStudent!=null){
            TCourse tCourse = tCourseDao.getOne(rCourseStudent.getCourseId());
            if (tCourse!=null){
                TTask tTask = tTaskDao.findOne(tCourse.getId());
                if (tTask!=null){
                    THomework homwork = tHomeworkDao.findOne(tTask.getId());
                    if(homwork!=null){
                        return homwork;
                    }else{
                        return null;
                    }
                }else {
                    return null;
                }
            }else {
                return null;
            }
        }else {
            return null;
        }
    }

}
