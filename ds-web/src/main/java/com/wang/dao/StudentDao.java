package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TStudent;
import com.wang.entity.TTeacher;
import org.springframework.stereotype.Repository;

/**
 * Created by wxl on 2016/5/8.
 */
@Repository
public interface StudentDao  extends BaseDao<TStudent,Integer> {
}
