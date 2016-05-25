package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TSeminar;
import com.wang.entity.TSeminarTopic;
import com.wang.task.SeminarTopicTask;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/5/8.
 */
@Repository
public interface SeminarTopicDao extends BaseDao<TSeminarTopic,Integer> {

    @Query("FROM TSeminarTopic s where s.status = ?1 and s.endTime < ?2 ")
    List<TSeminarTopic> findByStatusAndEndTime(Integer status,Date endTime);
}
