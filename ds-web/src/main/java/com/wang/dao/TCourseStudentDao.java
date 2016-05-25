package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TCourseStudent;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by liu on 2016/5/25.
 */
public interface TCourseStudentDao extends BaseDao<TCourseStudent,Integer> {

    @Query("FROM TCourseStudent a WHERE  a.courseId=?1")
    public List<TCourseStudent> getCourseStudentBycourseId(int courseId);
}
