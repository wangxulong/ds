package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.RCourseStudent;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/5/11 0011.
 */
@Repository
public interface RcourseStudentDao extends BaseDao<RCourseStudent,Integer> {
    RCourseStudent findByStudentId(Integer studentId);

    List<RCourseStudent> findByCourseId(Integer courseId);
}
