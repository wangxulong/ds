package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TbService;
import org.springframework.stereotype.Repository;

/**
 * Created by wxl on 2015/10/1.
 */
@Repository
public interface ServiceDao extends BaseDao<TbService,Long> {
}

