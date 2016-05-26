package com.wang.task;

import com.wang.dao.StudentTopicDao;
import com.wang.dto.StudentTopicDto;
import com.wang.entity.RStudentTopic;
import com.wang.entity.TSeminarTopic;
import com.wang.entity.enums.StudentTopicState;
import com.wang.service.SeminarTopicService;
import com.wang.service.StudentTopicService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.*;

/**
 * Created by wxl on 2016/5/25.
 */
@Service
@Transactional
public class SeminarTopicTask {

    @Resource
    private SeminarTopicService topicService;
    @Resource
    private StudentTopicDao studentTopicDao;
    @Resource
    private StudentTopicService studentTopicService;
    @Scheduled(fixedRate = 1000*2*60*60)
    public void studentJoin(){
        List<TSeminarTopic> topics = topicService.getClosedTopic();
        if(topics.size()>0){
            for(TSeminarTopic topic:topics){
                List<StudentTopicDto> studentTopics = studentTopicService.getJoinedTopic(topic.getId());
                if(null!=studentTopics && studentTopics.size()>0 && null != studentTopics.get(0).getId()){
                    studentTopics.sort(new Comparator<StudentTopicDto>() {
                        public int compare(StudentTopicDto o1, StudentTopicDto o2) {
                            return o1.getSelectedCount().intValue()>o2.getSelectedCount().intValue()?1:-1;
                        }
                    });
                    if(studentTopics.size() <= topic.getPnum()){
                        for(StudentTopicDto studentTopicDto : studentTopics){
                            studentTopicDao.updateStateById(studentTopicDto.getId(), StudentTopicState.Selected);
                        }
                    }else{
                        for(int i=0;i<topic.getPnum();i++){
                            studentTopicDao.updateStateById(studentTopics.get(i).getId(), StudentTopicState.Selected);
                        }
                        for(int j=topic.getPnum();j<studentTopics.size();j++){
                            studentTopicDao.updateStateById(studentTopics.get(j).getId(), StudentTopicState.UnSelected);
                        }
                    }
                }
                //更改topic状态,设置为已经完成
                topic.setStatus(2);
                topicService.save(topic);
                System.out.println("更新了====="+topic.getId());

            }
        }

        System.out.println("更新操作" + new Date());
    }


}
