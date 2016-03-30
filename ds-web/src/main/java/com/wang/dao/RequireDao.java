package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TbRequire;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by wxl on 2016/2/26.
 */
@Repository
public interface RequireDao extends BaseDao<TbRequire,Long>{

    //获取所有的问答
    @Query("FROM TbRequire r WHERE r.type=?1 and r.status=?2")
    public List<TbRequire> getAllQuestion(byte questionType, byte status);
}
