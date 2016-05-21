package com.dao;

import com.wang.dao.NoteDao;
import com.wang.dao.TeacherDao;
import com.wang.entity.TNote;
import com.wang.entity.TTeacher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2016/5/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring-context.xml")
public class TeacherDaoTest extends AbstractJUnit4SpringContextTests {
    @Resource
    private TeacherDao teacherDao;
    @Resource
    private NoteDao noteDao;

    @Test
    public void findMyNote(){
        List<TNote> notes = noteDao.findByStudentId(2);
        System.out.println(notes.size());
    }

    public void save(){
        TTeacher teacher = new TTeacher();
        teacher.setName("wxl");
        teacherDao.save(teacher);
    }
}
