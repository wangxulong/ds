package com.wang.service;

import com.wang.dao.StudentDao;
import com.wang.dao.StudentTopicDao;
import com.wang.entity.RStudentTopic;
import com.wang.entity.TSeminar;
import com.wang.entity.TSeminarTopic;
import com.wang.entity.TStudent;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liu on 2016/5/12.
 */
@Service
@Transactional
public class StudentTopicService {
    @Resource
    private StudentTopicDao studentTopicDao;

    @Resource
    private EntityManagerFactory managerFactory;

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
}
