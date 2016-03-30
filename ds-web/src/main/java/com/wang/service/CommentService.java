package com.wang.service;

import com.wang.auth.sys.service.SecurityService;
import com.wang.dao.CommentDao;
import com.wang.dao.RequireDao;
import com.wang.dto.CommentDto;
import com.wang.dto.QuestionDto;
import com.wang.entity.TbComment;
import com.wang.util.ConstantUtil;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/2/26.
 */
@Service
@Transactional
public class CommentService {



    @Resource
    private CommentDao commentDao;
    @Resource
    private RequireDao requireDao;
    @Resource
    private SecurityService securityService;
    @Resource
    private EntityManagerFactory managerFactory;

    public void addOrUpdateComment(TbComment comment){
        comment.setCreateTime(new Date());
        if(null == comment.getUserId()){
            comment.setUserId(securityService.getLoginUser().getId());
        }
        if(null!=comment.getId()){
            TbComment dbComment=  commentDao.getOne(comment.getId());
            dbComment.setContent(comment.getContent());
            commentDao.save(dbComment);
            return;
        }
        commentDao.save(comment);
    }

    //获取所有的评论
    public List<CommentDto> getAllQuestionComment(Long contentId){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "select a.id as id,a.content,b.user_name as userName,a.degree,a.create_time as createTime" +
                " from tb_comment a LEFT JOIN sys_user b on a.user_id=b.id LEFT JOIN " +
                "tb_require c on c.id = a.content_id where a.content_type="+ConstantUtil.questionType+" and c.id="+contentId+"" +
                " ORDER BY a.create_time DESC ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(CommentDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }

    /**
     * 获取所有的问答评论
     * @return
     *
     */




    //获取所有的问答
    public List<QuestionDto> getAllQuestion(){
       EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT r.id as id, r.user_id as userId,r.title,r.description,r.good,r.bad,r.type,r.create_time as createTime," +
                "r.begin_time as beginTime,r.end_time as endTime,r.category_id as categoryId,r.tag_id as tagId,r.status " +
                ",u.user_name as userName from tb_require r LEFT JOIN sys_user u on u.id = r.user_id where r.type="+ConstantUtil.questionType+ " " +
                " and r.status <>"+ConstantUtil.delete_status +" order by r.status desc ,r.create_time DESC ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(QuestionDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }



    public TbComment findById(Long id) {
        return commentDao.findOne(id);
    }


    public void deleteComment(Long id){
        commentDao.delete(id);
    }


    public boolean ajaxAddQuestionComment(Long userId,Long contentId,String content){
        TbComment comment = new TbComment();
        comment.setContentType(ConstantUtil.questionType);
        comment.setContent(content);
        comment.setContentId(contentId);
        comment.setCreateTime(new Date());
        comment.setUserId(userId);
        commentDao.save(comment);
        return true;

    }

}
