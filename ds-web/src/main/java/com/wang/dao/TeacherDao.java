package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TTeacher;
import com.wang.entity.TbService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by wxl on 2016/5/8.
 */
@Repository
public interface TeacherDao extends BaseDao<TTeacher,Integer> {

    TTeacher findByJobNumber(String jobNumber);

    List<TTeacher> findByState(Integer state);
}
