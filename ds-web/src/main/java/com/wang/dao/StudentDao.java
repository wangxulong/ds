package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TStudent;
import com.wang.entity.TTeacher;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by wxl on 2016/5/8.
 */
@Repository
public interface StudentDao  extends BaseDao<TStudent,Integer> {

    TStudent findByStudentNumberAndPassword(String name,String password);

    @Query("FROM TStudent t where t.id in (?1) order by t.id desc")
    List<TStudent> findAllStudentInCourse(Integer[] ids);
}
