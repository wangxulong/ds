package com.wang.service;


import com.wang.dao.NoteDao;
import com.wang.dao.RcourseStudentDao;
import com.wang.dao.SeminarDao;
import com.wang.entity.RCourseStudent;
import com.wang.entity.TNote;
import com.wang.entity.TSeminar;
import com.wang.entity.TSeminarTopic;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/3/1.
 */
@Service
@Transactional
public class SeminarService {
    @Resource
    private SeminarDao seminarDao;

    @Resource
    private EntityManagerFactory managerFactory;

    @Resource
    private RcourseStudentDao rcourseStudentDao;

    public List<TSeminar> findByCourse(int cid){
        EntityManager em = managerFactory.createEntityManager();
        String sql = "SELECT * FROM t_seminar AS s WHERE s.course_id ="+cid;
        Query query =  em.createNativeQuery(sql,TSeminar.class);
        List<TSeminar>  resultList = query.getResultList();
        em.close();
        return resultList;
    }


    /**
     * front 获取可用的研讨课信息及话题
     *
     * //判断话题是否可用
     */

    public List<TSeminar> getAvailableSeminar(Integer studentId){
        RCourseStudent courseStudent = rcourseStudentDao.findByStudentId(studentId);
        if(null == courseStudent){
            return null;
        }

        List<TSeminar> seminars =seminarDao.getBeforeEndTime(new Date(), courseStudent.getCourseId());
        for(TSeminar seminar : seminars){
            List<TSeminarTopic> topics = seminar.getSeminarTopics();
            for(TSeminarTopic topic:topics){
                //判断人数，并设置是否可用 TODO
                topic.setAvailable(true);
            }
        }
        return seminars;
    }

    public TSeminar findById(int id){
        return seminarDao.findOne(id);
    }

    public void save(TSeminar seminar){
        seminarDao.save(seminar);
    }

    public void delete(int id){
        seminarDao.delete(id);
    }

}

