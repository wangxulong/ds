package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.dto.HomeworkStudentDto;
import com.wang.entity.THomework;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
@Repository
public interface THomeworkDao extends BaseDao<THomework,Integer> {

    //根据学生ID和任务ID获取提交的作业

    public List<THomework> findByStudentIdAndTaskId(Integer studentId,Integer taskId);

    //根据taskId获取学生提交的作业
    @Query(value = " select a.create_time as finishTime,a.score homeworkScore,b.id studentId,b.name studentName " +
            " from t_homework a  " +
            "left join t_student b " +
            "on a.student_id = b.id " +
            "where a.task_id=?1",nativeQuery = true)
    public List<HomeworkStudentDto> getByTaskId(Integer taskId);

    @Query("FROM THomework a WHERE  a.taskId=?1")
    public List<THomework> findByTaskId(Integer taskId);


    @Query("From THomework t WHERE t.studentId=?1")
    public List<THomework> getAllStudentHomeWork(int studentId);

}
