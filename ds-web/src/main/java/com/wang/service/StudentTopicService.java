package com.wang.service;

import com.wang.dao.TAttachmentDao;
import com.wang.dao.TCourseDao;
import com.wang.dto.TeacherCourseDto;
import com.wang.entity.TAttachment;
import com.wang.entity.TCourse;
import com.wang.form.CourseFormBean;
import com.wang.util.UpFilesUtils;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Administrator on 2016/5/12 0012.
 */
@Service
@Transactional
public class StudentTopicService {

}
