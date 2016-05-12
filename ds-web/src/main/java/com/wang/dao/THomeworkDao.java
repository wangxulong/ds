package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.THomework;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
@Repository
public interface THomeworkDao extends BaseDao<THomework,Integer> {

    //根据学生ID和任务ID获取提交的作业

    public List<THomework> findByStudentIdAndTaskId(Integer studentId,Integer taskId);
}
