package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TLeave;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface LeaveDao extends BaseDao<TLeave, Integer> {
    @Query("FROM TLeave t where t.studentId=?1 order by t.createTime desc")
    List<TLeave> findByStudentId(Integer var1);
}