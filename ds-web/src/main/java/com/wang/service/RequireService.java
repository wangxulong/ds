package com.wang.service;

import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SecurityService;
import com.wang.dao.RequireDao;
import com.wang.dto.QuestionDto;
import com.wang.dto.RequireDto;
import com.wang.entity.TbRequire;
import com.wang.entity.TbRequireAttach;
import com.wang.util.ConstantUtil;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/2/26.
 */
@Service
@Transactional
public class RequireService {
    public static final String picPath="/upload/require/";
    @Resource
    private RequireDao requireDao;
    @Resource
    private SecurityService securityService;
    @Resource
    private EntityManagerFactory managerFactory;
    @Resource
    private RequireAttachService attachService;

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

    public void addQuestion(TbRequire question) {
        if(null!=question.getId()){
            question =updateQuestion(question);
        }
        SysUser user = securityService.getLoginUser();
        question.setUserId(user.getId());
        question.setCreateTime(new Date());
        question.setType(ConstantUtil.questionType);
        question.setStatus(ConstantUtil.normal_status);
        requireDao.save(question);
    }

    private TbRequire updateQuestion(TbRequire question){
        TbRequire db = requireDao.getOne(question.getId());
        db.setTitle(question.getTitle());
        db.setDescription(question.getDescription());
        return db;
    }

    public TbRequire findById(Long id) {
        return requireDao.findOne(id);
    }

    public void removeQuestion(Long id) {
       TbRequire require = requireDao.findOne(id);
       if(null!=require) {
           require.setStatus(ConstantUtil.delete_status);
           requireDao.save(require);
       }
    }



    public void upToHot(Long id) {
        TbRequire require = requireDao.findOne(id);
        if(null!=require) {
            require.setStatus(ConstantUtil.hot_status);
            requireDao.save(require);
        }
    }

    //异步获取热点问题
    public List<QuestionDto> getHotQuestion(){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT  r.id as id, r.user_id as userId,r.title,r.description,r.good,r.bad,r.type,r.create_time as createTime," +
                "r.begin_time as beginTime,r.end_time as endTime,r.category_id as categoryId,r.tag_id as tagId,r.status " +
                ",u.user_name as userName from tb_require r LEFT JOIN sys_user u on u.id = r.user_id where r.type="+ConstantUtil.questionType+ " " +
                " and r.status ="+ConstantUtil.hot_status +" order by r.create_time DESC limit 3 ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(QuestionDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }

    //通过ID获取问答信息
    public QuestionDto getQuestionById(Long id) {
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT  r.id as id, r.user_id as userId,r.title,r.description,r.good,r.bad,r.type,r.create_time as createTime," +
                "r.begin_time as beginTime,r.end_time as endTime,r.category_id as categoryId,r.tag_id as tagId,r.status " +
                ",u.user_name as userName from tb_require r LEFT JOIN sys_user u on u.id = r.user_id where r.id="+id+ " " +
                " and r.status <>"+ConstantUtil.delete_status ;
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(QuestionDto.class));

        List rows = query.getResultList();

        entityManager.close();
        if(!rows.isEmpty()) return (QuestionDto) rows.get(0);
        return null;
    }

    public void backToNormal(Long id) {
        TbRequire require = requireDao.findOne(id);
        if(null!=require) {
            require.setStatus(ConstantUtil.normal_status);
            requireDao.save(require);
        }
    }

    /**
     * 获取最近更新问答
     */

    public List<QuestionDto> getLaterQuestion(){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT  r.id as id, r.user_id as userId,r.title,r.description,r.good,r.bad,r.type,r.create_time as createTime," +
                "r.begin_time as beginTime,r.end_time as endTime,r.category_id as categoryId,r.tag_id as tagId,r.status " +
                ",u.user_name as userName from tb_require r LEFT JOIN sys_user u on u.id = r.user_id where r.type="+ConstantUtil.questionType+ " " +
                " and r.status ="+ConstantUtil.normal_status +" order by r.create_time DESC limit 10 ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(QuestionDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }


    //添加有偿需求
    public void addRequire(HttpServletRequest request, MultipartFile file,TbRequire require){

        //添加需求
        SysUser user = securityService.getLoginUser();
        require.setCreateTime(new Date());
        require.setStatus(ConstantUtil.normal_status);
        require.setType(ConstantUtil.requireType);
        require.setUserId(user.getId());
        requireDao.save(require);
        //添加附件
        if( null !=file){
            String realName = file.getOriginalFilename();
            String prefix =  realName.substring(realName.lastIndexOf("."));
            Long fileName  = new Date().getTime();
            String filePath = request.getSession().getServletContext().getRealPath("/") +picPath+ fileName+prefix;
            // 转存文件
            try {
                file.transferTo(new File(filePath));
            } catch (IOException e) {
                throw new RuntimeException("保存文件失败");
            }
            //数据库添加附件
            TbRequireAttach attach = new TbRequireAttach();
            attach.setName(realName);
            attach.setPath(fileName + prefix);
            attach.setRequireId(require.getId());
            attach.setRequireId(require.getId());
            attachService.addAttach(attach);
        }
    }


    public List<RequireDto> getAllRequire(){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT r.id as id, r.user_id as userId,r.title,r.description,r.good,r.bad,r.type,r.create_time as createTime," +
                "r.begin_time as beginTime,r.end_time as endTime,r.category_id as categoryId,r.tag_id as tagId,r.status " +
                ",u.user_name as userName from tb_require r LEFT JOIN sys_user u on u.id = r.user_id where r.type="+ConstantUtil.requireType+ " " +
                " and r.status <>"+ConstantUtil.delete_status +" order by r.status desc ,r.create_time DESC ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(RequireDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }


    public void remove(Long id){
        TbRequire require = requireDao.findOne(id);
        if(null!=require) {
            require.setStatus(ConstantUtil.delete_status);
            requireDao.save(require);
        }
    }

    public List<RequireDto> getHotRequire(){
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT a.path as picUrl, r.id as id, r.user_id as userId,r.title,r.description,r.good,r.bad,r.type,r.create_time as createTime," +
                "r.begin_time as beginTime,r.end_time as endTime,r.category_id as categoryId,r.tag_id as tagId,r.status " +
                ",u.user_name as userName from tb_require r LEFT JOIN sys_user u on u.id = r.user_id " +
                " LEFT JOIN tb_require_attach a on a.require_id = r.id " +
                "  where r.type="+ConstantUtil.requireType+ " " +
                " and r.status ="+ConstantUtil.hot_status +"  order by  r.create_time DESC limit 3 ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(RequireDto.class));
        List rows = query.getResultList();
        entityManager.close();
        return rows;
    }
}
