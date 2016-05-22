package com.wang.service;


import com.wang.dao.NoteDao;
import com.wang.dao.SeminarDao;
import com.wang.entity.TNote;
import com.wang.entity.TSeminar;
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
public class SeminarService {
    @Resource
    private SeminarDao seminarDao;

    @Resource
    private EntityManagerFactory managerFactory;

    public List<TSeminar> findByCourse(int cid){
        EntityManager em = managerFactory.createEntityManager();
        String sql = "SELECT * FROM t_seminar AS s WHERE s.course_id ="+cid;
        Query query =  em.createNativeQuery(sql,TSeminar.class);
        List<TSeminar>  resultList = query.getResultList();
        em.close();
        return resultList;
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

