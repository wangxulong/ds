package com.wang.service;

import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SecurityService;
import com.wang.dao.*;
import com.wang.dto.StudentTaskDto;
import com.wang.entity.*;
import com.wang.form.TaskFormBean;
import com.wang.util.UpFilesUtils;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/5/12 0012.
 */
@Service
@Transactional
public class TTaskService {
    @Resource
    private EntityManagerFactory managerFactory;
    @Resource
    private SecurityService securityService;
    @Qualifier("TTaskDao")
    @Resource
    private TTaskDao tTaskDao;
    @Qualifier("TAttachmentDao")
    @Resource
    private TAttachmentDao tAttachmentDao;
    @Resource
    private RcourseStudentDao rcourseStudentDao;
    @Qualifier("TCourseDao")
    @Resource
    private TCourseDao tCourseDao;


    @Resource
    private TeacherDao teacherDao;


    /*获取所有的任务*/
    public List<TTask> getAllTask(){
        return tTaskDao.findAll();
    }
    /*获取某一次任务*/
    public TTask getOnetask(int id){
        TTask task = tTaskDao.findOne(id);
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
        task.setCreateTime(new Date());
        task.setEndTime(taskFormBean.getEndTime());
        task.setContent(taskFormBean.getContent());
        SysUser sysUser = securityService.getLoginUser();
        String jobNumber = sysUser.getUserName();
        TTeacher tTeacher = teacherDao.findByJobNumber(jobNumber);
        //task.setTeacherId(tTeacher.getId());
        //TODO 李昌亚
        task.setCourseId(1);//设置课程ID
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
    /**
     * 根据学生的ID获取关于课程的任务
     * 1.通过学生的ID，在r_course_student中找到课程的ID
     * 2.根据课程的ID找到任务的内容
     * 1.作业ID
     * 2.作业名称
     * 3.描述
     * 3.开始时间
     * 4.结束时间
     * 5.是否有附件
     SELECT  c.id,c.topic,c.content,c.create_time as createTime,c.end_time as endTime,c.attachment_id attachId from r_course_student a 
     left join t_course b on b.id = a.course_id
     left JOIN  t_task c on c.course_id = a.course_id
     where a.student_id = 2
     ORDER BY c.create_time desc
     */

    public List<StudentTaskDto> getTaskByStudentId(Integer studentId){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT  c.id,c.topic,c.content,c.create_time as createTime,c.end_time as endTime," +
                "c.attachment_id attachId from r_course_student a " +
                " left join t_course b on b.id = a.course_id " +
                " left JOIN  t_task c on c.course_id = a.course_id " +
                " where a.student_id ="+studentId.intValue() +
                " ORDER BY c.create_time desc";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(StudentTaskDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }


}
