package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TGroup;
import com.wang.entity.TSeminar;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/5/8.
 */
@Repository
public interface SeminarDao extends BaseDao<TSeminar,Integer> {

    @Query("FROM TSeminar t where t.endTime >?1 and t.courseId = ?2")
    public List<TSeminar> getBeforeEndTime(Date endTime,Integer courseId);
}
