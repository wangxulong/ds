package com.wang.service;

import com.wang.dao.MaterialDao;
import com.wang.dto.QuestionDto;
import com.wang.entity.TAttachment;
import com.wang.entity.TExam;
import com.wang.entity.TExamItem;
import com.wang.entity.TMaterial;
import com.wang.form.ExamFormBean;
import com.wang.form.MaterialFormBean;
import com.wang.util.ConstantUtil;
import com.wang.util.UpFilesUtils;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * Created by jichao on 2016/5/16.
 */
@Service
@Transactional
public class MaterialService {

    @Resource
    private MaterialDao materialDao;

    @Resource
    private TAttachmentService tAttachmentService;

    @Resource
    private EntityManagerFactory managerFactory;

    public List<TMaterial> findAll(){
        /*TMaterial material = new TMaterial();
        material.setCourseId(courseId);*/
        return materialDao.findAll();
    }

    public int save(TMaterial material){
        return materialDao.save(material).getId();
    }


    public List<TMaterial> getAllByCourse(int cid){
        EntityManager em = managerFactory.createEntityManager();
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT * FROM t_material AS m WHERE m.course_id ="+cid;
        Query query =  em.createNativeQuery(sql,TMaterial.class);
        List<TMaterial>  resultList = query.getResultList();
        em.close();
        return resultList;
    }

    public TMaterial findOne(int id){
        return materialDao.findOne(id);
    }

    public void delete(int id){

        materialDao.delete(id);
    }
}
