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
    //TODO 刘建军（完善设计）
    @Query("FROM TExam a WHERE  a.year=?1 and a.term=?2 and a.teacherId=?3")
    public List<TExam> isExamExist(int year, int term,int teacherId);
    @Query("FROM TExam a WHERE a.teacherId=?1 order by a.year desc")
    public List<TExam> findTeacherExam(Integer teacherID);
}
