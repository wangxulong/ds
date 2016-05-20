package com.wang.service;


import com.wang.dao.GroupDao;
import com.wang.dao.NoteDao;
import com.wang.entity.TGroup;
import com.wang.entity.TNote;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
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

