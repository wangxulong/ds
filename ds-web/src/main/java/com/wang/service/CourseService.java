package com.wang.service;

import com.wang.dao.TAttachmentDao;
import com.wang.dao.TCourseDao;
import com.wang.dto.StudentDto;
import com.wang.dto.TeacherCourseDto;
import com.wang.entity.TAttachment;
import com.wang.entity.TCourse;
import com.wang.form.CourseFormBean;
import com.wang.util.UpFilesUtils;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

/**
 * Created by Administrator on 2016/5/12 0012.
 */
@Service
@Transactional
public class CourseService {
    @Resource
    private TCourseDao tCourseDao;
    @Resource
    private TAttachmentDao tAttachmentDao;
    @Resource
    private GroupService groupService;
    @Resource
    private EntityManagerFactory managerFactory;

    public List<TCourse> getAllCourse(){
        return tCourseDao.findAll();
    }

    public void saveCoures(TCourse course){
        tCourseDao.save(course);
    }

    public TCourse getCourseById(int id){
        return tCourseDao.findOne(id);
    }

    public  void deleteCourseById(int id){
        tCourseDao.delete(id);
    }
    /*获取课程简介*/
    public String getDescriptionOfCourse(){
       List <TCourse> list= tCourseDao.findAll();
        if(list.size()<1){
            return "";
        }else{
            return list.get(0).getOutline();
        }
    }
    /*添加课程*/
    public void addCourse(CourseFormBean courseFormBean){
        TCourse course = new TCourse();

        course.setName(courseFormBean.getName());
        course.setStartTime(courseFormBean.getStartTime());
        course.setGroupId(groupService.getFirstGroup());
        course.setOutline(courseFormBean.getOutline());
        if (courseFormBean.getFile().isEmpty()){  //没有附件

            tCourseDao.save(course);

        }else {                         //有附件
            //获取上传的文件
            MultipartFile file = courseFormBean.getFile();
            //存储文件到指定的位置
            UpFilesUtils.saveFile(file);

            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(UpFilesUtils.savePath);
            tAttachmentDao.save(attachment);

            course.setAttachmentId(attachment.getId());
            tCourseDao.save(course);

        }

    }

    /*更新任务*/
    public void updateCourse(CourseFormBean courseFormBean){

        TCourse course = tCourseDao.findOne(courseFormBean.getId());

        course.setName(courseFormBean.getName());
        course.setOutline(courseFormBean.getOutline());

        if (courseFormBean.getFile().isEmpty()){  //没有附件
            tCourseDao.saveAndFlush(course);
        }else {
            //获取上传的文件
            MultipartFile file = courseFormBean.getFile();
            //存储文件到指定的位置
            UpFilesUtils.saveFile(file);

            //保存附件基本信息到数据库
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(UpFilesUtils.savePath);
            tAttachmentDao.save(attachment);

            course.setAttachmentId(attachment.getId());
            tCourseDao.save(course);
        }
    }

    //获取附件(即教学大纲)
    public TAttachment getAttachment(int id){
        return tAttachmentDao.getOne(tCourseDao.getOne(id).getAttachmentId());
    }

    /*TTask 转换为 TaskFormBean */
    public CourseFormBean courseToFormBean(int id){
        TCourse courseTemp = getCourseById(id) ;
        MultipartFile file=null;
        CourseFormBean courseBean = new CourseFormBean();

        courseBean.setId(courseTemp.getId());
        courseBean.setName(courseTemp.getName());
        courseBean.setStartTime(courseTemp.getStartTime());
        courseBean.setOutline(courseTemp.getOutline());
        courseBean.setFile(file);
        return  courseBean;
    }


    /**
     * 查找所有的教学中的老师的课程
     */
    public List<TeacherCourseDto> getTeachingCourse(){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = " select a.id as courseId,a.name courseName,b.id teacherId,b.name teacherName " +
                " from t_course a  " +
                "left join t_teacher b " +
                "on a.teacher_id = b.id " +
                "where b.state = 1 ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(TeacherCourseDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }
}
