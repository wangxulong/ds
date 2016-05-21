package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TExamItem;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by liu on 2016/5/11.
 */
@Repository
public interface TExamItemDao extends BaseDao<TExamItem,Integer> {
    @Query("From TExamItem a where a.examId=?1 and a.type=?2")
    public TExamItem getItemByExamIdAndType(int examid,int type);

    @Query("From TExamItem a where a.examId=?1")
    public List<TExamItem> getItemByExamId(int examid);
}
