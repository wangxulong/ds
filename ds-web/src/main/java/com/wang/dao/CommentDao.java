package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TbComment;
import org.springframework.stereotype.Repository;

/**
 * Created by wxl on 2016/2/26.
 */
@Repository
public interface CommentDao extends BaseDao<TbComment,Long>{
}
