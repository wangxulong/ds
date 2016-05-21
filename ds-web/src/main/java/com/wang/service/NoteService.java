package com.wang.service;


import com.wang.dao.GroupDao;
import com.wang.dao.NoteDao;
import com.wang.dao.RcourseStudentDao;
import com.wang.dao.TAttachmentDao;
import com.wang.entity.*;
import com.wang.util.ConstantUtil;
import com.wang.util.UpFilesUtils;
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
 * Created by wxl on 2016/3/1.
 */
@Service
@Transactional
public class NoteService {
    @Resource
    private NoteDao noteDao;
    @Resource
    private EntityManagerFactory managerFactory;
    @Resource
    private TAttachmentDao attachmentDao;
    @Resource
    private RcourseStudentDao courseStudentDao;
    public List<TNote> findAll(){
        return noteDao.findAll();
    }

    public TNote getOne(Integer id){
        return noteDao.findOne(id);
    }
    /**
     * 添加请假信息
     *
     */
    public void add(MultipartFile file, TNote note,Integer studentId,String path) {
        Integer attachId = 0;
        if(null !=file &&!file.isEmpty()){
            String fileName =  UpFilesUtils.saveUploadFile(file, path);
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(ConstantUtil.LEAVE_PATH+"\\"+fileName);
            attachmentDao.save(attachment);
            attachId = attachment.getId();
        }
        if(attachId>0){
            note.setAttachId(attachId);
        }
        RCourseStudent cs = courseStudentDao.findByStudentId(studentId);

        TStudent student = new TStudent();
        student.setId(studentId);
        note.setStatus(0);
        note.setStudent(student);
        TCourse course = new TCourse();
        course.setId(cs.getCourseId());
        note.setCourse(course);
        note.setTime(new Date());
        noteDao.save(note);
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


    /**
     * 我的请假
     * @return
     */
    public List<TNote> getByStudentId(Integer studentId){
        return  noteDao.findByStudentId(studentId);
    }
}

