package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TGroup;
import com.wang.entity.TNote;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by wxl on 2016/5/8.
 */
@Repository
public interface NoteDao extends BaseDao<TNote,Integer> {
    @Query("FROM TNote t where t.student.id = ?1 order by t.id desc")
    List<TNote> findByStudentId(Integer studentId);
}
