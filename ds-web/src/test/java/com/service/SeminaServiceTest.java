package com.service;

import com.wang.dao.StudentTopicDao;
import com.wang.service.CourseService;
import com.wang.service.SeminarService;
import com.wang.service.SeminarTopicService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2016/5/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring-context.xml")
public class SeminaServiceTest {
    @Resource
    private SeminarService seminarService;
    @Resource
    private SeminarTopicService topicService;
    @Resource
    private StudentTopicDao studentTopicDao;
    @Test
    public void getAvailableSeminar(){
        List r = topicService.getClosedTopic();
        System.out.println(r.size());
    }
}
