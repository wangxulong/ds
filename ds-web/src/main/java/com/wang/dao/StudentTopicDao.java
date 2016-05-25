package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.dto.StudentTopicDto;
import com.wang.entity.RStudentTopic;
import com.wang.entity.TbCategory;
import com.wang.entity.enums.StudentTopicState;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/2/26.
 */
@Repository
public interface StudentTopicDao extends BaseDao<RStudentTopic,Integer>{

    RStudentTopic findByStudentIdAndTopicId(Integer studentId,Integer topicId);
    @Modifying
    @Query("update RStudentTopic r set r.state=?2 where r.id=?1")
    void updateStateById(Integer id,StudentTopicState state);

    @Query("From RStudentTopic t where t.studentId=?1")
    List<RStudentTopic> getAllStudentTopic(int studentId);
}
