package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TExam;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by liu on 2016/5/11.
 */
@Repository
public interface TExamDao extends BaseDao<TExam,Integer> {
    @Query("FROM TExam a WHERE  a.year=?1 and a.term=?2")
    public List<TExam> isExamExist(int year, int term);
}
