package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TGroup;
import com.wang.entity.TSeminar;
import org.springframework.stereotype.Repository;

/**
 * Created by wxl on 2016/5/8.
 */
@Repository
public interface SeminarDao extends BaseDao<TSeminar,Integer> {
}
