package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TAttachment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
@Repository
public interface TAttachmentDao extends BaseDao<TAttachment,Integer> {

    @Query("FROM TAttachment t where t.id in (?1) order by t.id desc")
    List<TAttachment> findByIds(Integer[] ids);
}
