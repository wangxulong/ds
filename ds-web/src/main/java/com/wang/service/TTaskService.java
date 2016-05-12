package com.wang.service;

import com.wang.dao.RcourseStudentDao;
import com.wang.dao.TAttachmentDao;
import com.wang.dao.TCourseDao;
import com.wang.dao.TTaskDao;
import com.wang.entity.*;
import com.wang.form.TaskFormBean;
import com.wang.util.UpFilesUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/5/12 0012.
 */
@Service
@Transactional
public class TTaskService {
    @Resource
    private TTaskDao tTaskDao;
    @Resource
    private TAttachmentDao tAttachmentDao;
    @Resource
    private RcourseStudentDao rcourseStudentDao;
    @Resource
    private TCourseDao tCourseDao;
    /*获取所有的任务*/
    public List<TTask> getAllTask(){
        List<TTask> list = new ArrayList<TTask>();
        list = tTaskDao.findAll();
        return list;
    }
    /*获取某一次任务*/
    public TTask getOnetask(int id){
        TTask task = new TTask();
        task = tTaskDao.findOne(id);
        return task;
    }

    /*获取任务的附件*/
    public TAttachment getAttachmentOfTask(int id){
        TTask task = tTaskDao.findOne(id);

        if(task.getAttachmentId()!=null){
            TAttachment tAttachment = tAttachmentDao.getOne(task.getAttachmentId());
            return tAttachment;
        }else{
            return null;
        }
    }

    /*删除某一次任务*/
    public  void deleteOneTask(int id){
        tTaskDao.delete(id);
    }
    /*添加任务*/
    public void addOneTask(TaskFormBean taskFormBean){

        TTask task = new TTask();
        task.setTopic(taskFormBean.getTopic());
        task.setEndTime(taskFormBean.getEndTime());
        task.setContent(taskFormBean.getContent());

        if (taskFormBean.getFile().isEmpty()){  //没有附件

            tTaskDao.save(task);

        }else {                         //有附件
            //获取上传的文件
            MultipartFile file = taskFormBean.getFile();
            //存储文件到指定的位置
            UpFilesUtils.saveFile(file);

            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(UpFilesUtils.savePath);
            tAttachmentDao.save(attachment);

            task.setAttachmentId(attachment.getId());
            tTaskDao.save(task);

        }

    }
    /*更新任务*/
    public void updateOneTask(TaskFormBean taskFormBean){

        TTask task = new TTask();
        task.setId(taskFormBean.getId());
        task.setTopic(taskFormBean.getTopic());
        task.setEndTime(taskFormBean.getEndTime());
        task.setContent(taskFormBean.getContent());


        if (taskFormBean.getFile().isEmpty()){  //没有附件
            tTaskDao.saveAndFlush(task);
        }else {
            //获取上传的文件
            MultipartFile file = taskFormBean.getFile();
            //存储文件到指定的位置
            UpFilesUtils.saveFile(file);

            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(UpFilesUtils.savePath);
            tAttachmentDao.save(attachment);

            task.setAttachmentId(attachment.getId());
            tTaskDao.save(task);
        }

    }

    /*TTask 转换为 TaskFormBean */
    public TaskFormBean taskToFormBean(int id){
        TTask taskTemp = getOnetask(id) ;
        MultipartFile file=null;
        TaskFormBean taskFormBean = new TaskFormBean();

        taskFormBean.setId(taskTemp.getId());
        taskFormBean.setTopic(taskTemp.getTopic());
        taskFormBean.setContent(taskTemp.getContent());
        taskFormBean.setEndTime(taskTemp.getEndTime());
        taskFormBean.setFile(file);
        return  taskFormBean;
    }

    /*根据学生Id获取学生要做的任务有哪些*/
    public TTask getTodoTask(int id){
        RCourseStudent rCourseStudent = rcourseStudentDao.findOne(id);
        if (rCourseStudent!=null){
            TCourse tCourse = tCourseDao.getOne(rCourseStudent.getCourseId());
            if (tCourse!=null){
                TTask tTask = tTaskDao.findOne(tCourse.getId());
                if (tTask!=null){
                   return  tTask;
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
