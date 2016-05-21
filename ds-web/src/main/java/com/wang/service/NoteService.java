package com.wang.service;


import com.wang.dao.GroupDao;
import com.wang.dao.NoteDao;
import com.wang.entity.TGroup;
import com.wang.entity.TMaterial;
import com.wang.entity.TNote;
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
public class NoteService {
    @Resource
    private NoteDao noteDao;

    @Resource
    private EntityManagerFactory managerFactory;

    public List<TNote> findAll(){
        return noteDao.findAll();
    }

    public TNote getOne(Integer id){
        return noteDao.findOne(id);
    }

    public int appoveNote(int id){
        TNote note = noteDao.findOne(id);
        if(note.getStatus()==0){
            note.setStatus(1);
            noteDao.save(note);
            return 1;
        }
        return 0;
    }

    public List<TNote> findByType(int type){
        if(type==-1)
            return noteDao.findAll();
        else{
            EntityManager em = managerFactory.createEntityManager();
            String sql = "SELECT * FROM t_note AS n WHERE n.status ="+type;
            Query query =  em.createNativeQuery(sql,TNote.class);
            List<TNote>  resultList = query.getResultList();
            em.close();
            return resultList;
        }
    }

    public List<TNote> findByType(int type,int cid){
        if(type==-1){
            EntityManager em = managerFactory.createEntityManager();
            String sql = "SELECT * FROM t_note AS n WHERE n.course_id ="+cid;
            Query query =  em.createNativeQuery(sql,TNote.class);
            List<TNote>  resultList = query.getResultList();
            em.close();
            return resultList;
        }

        else{
            EntityManager em = managerFactory.createEntityManager();
            String sql = "SELECT * FROM t_note AS n WHERE n.status ="+type+" and n.course_id="+cid;
            Query query =  em.createNativeQuery(sql,TNote.class);
            List<TNote>  resultList = query.getResultList();
            em.close();
            return resultList;
        }
    }
    public int dismissNote(int id){
        TNote note = noteDao.findOne(id);
        if(note.getStatus()==0){
            note.setStatus(2);
            noteDao.save(note);
            return 1;
        }
        return 0;
    }

    public TNote findOne(int id){
        return noteDao.findOne(id);
    }
}

