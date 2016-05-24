package com.wang.service;


import com.wang.dao.SeminarDao;
import com.wang.dao.SeminarTopicDao;
import com.wang.entity.TSeminar;
import com.wang.entity.TSeminarTopic;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by wxl on 2016/3/1.
 */
@Service
@Transactional
public class SeminarTopicService {
    @Resource
    private SeminarTopicDao seminarTopicDao;

    @Resource
    private EntityManagerFactory managerFactory;

    public List<TSeminarTopic> findByCourse(int cid){
        EntityManager em = managerFactory.createEntityManager();
        String sql = "SELECT * FROM t_seminar AS s WHERE s.course_id ="+cid;
        Query query =  em.createNativeQuery(sql,TSeminarTopic.class);
        List<TSeminarTopic>  resultList = query.getResultList();
        em.close();
        return resultList;
    }

    public TSeminarTopic findById(int id){
        return seminarTopicDao.findOne(id);
    }

    public void save(TSeminarTopic seminarTopic){
        seminarTopicDao.save(seminarTopic);
    }

    public void delete(int id){
        seminarTopicDao.delete(id);
    }



}

