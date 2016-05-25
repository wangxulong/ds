package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.RCourseStudent;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by liu on 2016/5/25.
 */
public interface TCourseStudentDao extends BaseDao<RCourseStudent,Integer> {

    @Query("FROM RCourseStudent a WHERE  a.courseId=?1")
    public List<RCourseStudent> getCourseStudentBycourseId(int courseId);

    @Query("From RCourseStudent a WHERE a.studentId=?1")
    public RCourseStudent getCourseStudent(int studentId);
}
