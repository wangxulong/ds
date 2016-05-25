package com.wang.service;

import com.wang.dao.StudentDao;
import com.wang.dao.StudentTopicDao;
import com.wang.dto.StudentTopicDto;
import com.wang.entity.RStudentTopic;
import com.wang.entity.TSeminar;
import com.wang.entity.TSeminarTopic;
import com.wang.entity.TStudent;
import com.wang.dao.*;
import com.wang.dto.MyJoinedTopicDto;
import com.wang.dto.TeacherCourseDto;
import com.wang.entity.*;
import com.wang.entity.enums.StudentTopicState;
import com.wang.form.CourseFormBean;
import com.wang.util.ConstantUtil;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/5/12 0012.
 */
@Service
@Transactional
public class StudentTopicService {
    @Resource
    private SeminarTopicDao seminarTopicDao;
    @Resource
    private SeminarDao seminarDao;
    @Resource
    private StudentTopicDao studentTopicDao;
    @Resource
    private  TAttachmentDao attachmentDao;

    @Resource
    private EntityManagerFactory managerFactory;
    public RStudentTopic findByTopicId(Integer studentId,Integer topicId){
        return studentTopicDao.findByStudentIdAndTopicId(studentId,topicId);
    }
    public void save(RStudentTopic studentTopic){
        studentTopicDao.save(studentTopic);
    }

    public RStudentTopic findOne(int id){
        return studentTopicDao.findOne(id);
    }

    public List<TStudent> getStudentsById(int stid){
        EntityManager em = managerFactory.createEntityManager();
        String sql = "SELECT * FROM r_student_topic as st WHERE st.topic_id="+stid;
        Query query =  em.createNativeQuery(sql,RStudentTopic.class);
        List<RStudentTopic>  studentTopics = query.getResultList();
        List<TStudent>  students= new ArrayList<TStudent>();
        if(studentTopics.size()==0){
            return students;
        }
        String idset="(";
        for(RStudentTopic st:studentTopics){
            idset+=st.getStudentId()+",";
        }
        if(studentTopics.size()!=0){
            idset = idset.substring(0,idset.length()-1);
        }
        idset+=")";

        sql = "SELECT * FROM t_student as s WHERE s.id in "+idset;
        query =  em.createNativeQuery(sql,TStudent.class);
        students= query.getResultList();
        em.close();
        return students;
    }

    public void score(int stid ,int sid,int score,int type){
        EntityManager em = managerFactory.createEntityManager();
        String sql = "SELECT * FROM r_student_topic as st WHERE st.student_id="+sid+" AND st.topic_id="+stid;
        Query query =  em.createNativeQuery(sql,RStudentTopic.class);
        List<RStudentTopic>  studentTopics = query.getResultList();
        RStudentTopic studentTopic = studentTopics.get(0);
        studentTopic.setScore(score);
        studentTopic.setType(type);
        studentTopicDao.save(studentTopic);
        em.close();
    }

    public void score(int stid ,int sid,String level,int type){
        EntityManager em = managerFactory.createEntityManager();
        String sql = "SELECT * FROM r_student_topic as st WHERE st.student_id="+sid+" AND st.topic_id="+stid;
        Query query =  em.createNativeQuery(sql,RStudentTopic.class);
        List<RStudentTopic>  studentTopics = query.getResultList();
        RStudentTopic studentTopic = studentTopics.get(0);
        studentTopic.setLevel(level);
        studentTopic.setType(type);
        studentTopicDao.save(studentTopic);
        em.close();
    }
    public void joinTopic(Integer studentId,Integer topicId){
        TSeminarTopic seminarTopic = seminarTopicDao.findOne(topicId);
        TSeminar seminar = seminarDao.findOne(seminarTopic.getSeminarId());
        if(seminar.getEndTime().getTime()<new Date().getTime()){
            throw new RuntimeException("研讨课已结束，禁止报名");
        }
        //是否重复报名
        RStudentTopic dbStudentTopic = studentTopicDao.findByStudentIdAndTopicId(studentId,topicId);
        if(null != dbStudentTopic){
            throw new RuntimeException("不允许重复报名");
        }

        RStudentTopic studentTopic = new RStudentTopic();
        studentTopic.setCreateTime(new Date());
        studentTopic.setState(StudentTopicState.Submit);
        studentTopic.setStudentId(studentId);
        studentTopic.setTopicId(topicId);
        studentTopicDao.save(studentTopic);
    }

    //获取我参与的研讨课

    public List getMyJoinedTopic(Integer studentId){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = " select a.id  studentTopicId,a.create_time joinTime,a.state state,a.attach_id attachId, " +
                "b.name topicName,b.id topicId ,b.end_time  endTime ,c.name seminarName " +
                "from r_student_topic a " +
                "left join t_seminar_topic b " +
                "on a.topic_id = b.id " +
                " left join t_seminar c on b.seminar_id = c.id " +
                " where a.student_id =  "+studentId+"" +
                " order by a.create_time DESC ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(MyJoinedTopicDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }

    public void deleteMyTopic(Integer id){
        studentTopicDao.delete(id);
    }


    public List getJoinedTopic(Integer topicId){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "  select a.id id,a.student_id studentId,a.topic_id topicId,a.create_time createTime,   " +
                " (select count(b.id) FROM r_student_topic b where b.state ="+StudentTopicState.Selected.getType()+" and b.student_id = a.student_id) selectedCount   " +
                " from r_student_topic a   " +
                " where a.topic_id ="+topicId +
                " order by a.create_time DESC " ;
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(StudentTopicDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }

    //上传研讨课作业

    public void add(MultipartFile file, Integer studentTopicId,String path) {

        if(!file.isEmpty()){
            RStudentTopic studentTopic = studentTopicDao.findOne(studentTopicId);
            String fileName =  UpFilesUtils.saveUploadFile(file, path);
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(ConstantUtil.STUDENT_TOPIC_PATH + "\\" + fileName);
            attachment.setCreateTime(new Date());
            attachmentDao.save(attachment);
            studentTopic.setAttachId(attachment.getId());
            studentTopicDao.save(studentTopic);
        }else{
            throw new RuntimeException("文件不存在");
        }



    }

}
