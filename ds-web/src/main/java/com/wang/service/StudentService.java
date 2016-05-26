package com.wang.service;

import com.wang.auth.sys.dao.SysUserDao;
import com.wang.auth.sys.entity.SysRole;
import com.wang.auth.sys.entity.SysUser;
import com.wang.dao.RcourseStudentDao;
import com.wang.dao.StudentDao;
import com.wang.dao.TCourseDao;
import com.wang.dto.Pager;
import com.wang.dto.QuestionDto;
import com.wang.dto.ResultMessage;
import com.wang.dto.StudentDto;
import com.wang.entity.RCourseStudent;
import com.wang.entity.TCourse;
import com.wang.entity.TStudent;
import com.wang.entity.TTeacher;
import com.wang.util.PasswordHelper;
import org.hibernate.SQLQuery;
import org.hibernate.param.ParameterSpecification;
import org.hibernate.transform.Transformers;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.xml.transform.Result;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by wxl on 2016/5/10.
 */
@Service
@Transactional
public class StudentService {

    @Resource
    private StudentDao studentDao;
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private RcourseStudentDao courseStudentDao;
    @Resource
    private TCourseDao courseDao;

    @Resource
    private EntityManagerFactory managerFactory;
    //动态分页查询
    public Pager dynamicSearch(Map<String,Object> params){
        Integer currentPage = (Integer) params.get("currentPage");
        Integer pageSize = (Integer) params.get("pageSize");
        EntityManager entityManager = managerFactory.createEntityManager();
        String sql = "SELECT a.id,a.name,a.sex,a.birth_date as birthDate,a.student_number as studentNumber,a.leave_date as leaveDate,a.create_time as createTime " +
                ",a.join_date as joinDate " +
                " FROM t_student a  ";
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.aliasToBean(StudentDto.class));
        query.setFirstResult(currentPage-1);
        query.setMaxResults(pageSize);
        List rows = query.getResultList();
        String countSql = "SELECT count(*) FROM t_student";
        query = entityManager.createNativeQuery(countSql);
        BigInteger totalCount = (BigInteger) query.getSingleResult();
        entityManager.close();
        Pager pager = new Pager(currentPage,pageSize);
        pager.setTotalCount(totalCount);
        pager.setResults(rows);
        return pager;
    }
    //添加或修改
    public void addOrUpdate(TStudent student,Integer courseId){
        if(null == student.getId()){
            //新添加
            student.setCreateTime(new Date());
            student.setPassword(PasswordHelper.encrytBase64(student.getStudentNumber()));
            studentDao.save(student);
            //添加学生课程信息
            RCourseStudent courseStudent = new RCourseStudent();
            courseStudent.setStudentId(student.getId());
            courseStudent.setCourseId(courseId);
            courseStudentDao.save(courseStudent);
            return;
        }else{
            TStudent dbStudent = studentDao.findOne(student.getId());
            if(null ==  dbStudent){
                throw  new RuntimeException("修改信息不存在");
            }
            student.setCreateTime(dbStudent.getCreateTime());
            student.setPassword(dbStudent.getPassword());
            student.setSeminarTopicId(dbStudent.getSeminarTopicId());
        }
        //修改课程
        studentDao.save(student);
    }


    public TStudent findById(Integer id) {
        return studentDao.findOne(id);
    }

    public void deleteByIds(Integer[] ids) {
        for(Integer id:ids){
            studentDao.delete(id);
        }
    }

    //学生登录
    public TStudent login(String name,String password){
        password =  PasswordHelper.encrytBase64(password);
        TStudent student = studentDao.findByStudentNumberAndPassword(name, password);
        return student;
    }
    //修改密码
    public ResultMessage changePassword(String password, String newPassword, TStudent student) {
        ResultMessage resultMessage = new ResultMessage(ResultMessage.SUCCESS,"密码修改成功");
        student = studentDao.getOne(student.getId());
        password = PasswordHelper.encrytBase64(password);
        if(!password.equals(student.getPassword())){
            //密码不一致
            resultMessage.setStatus(ResultMessage.ERROR);
            resultMessage.setMessage("原始密码有误");
        }

        student.setPassword(PasswordHelper.encrytBase64(newPassword));
        studentDao.save(student);
        return resultMessage;
    }

    //获取我参与的课程
    public TCourse getMyCourse(Integer studentId){
        RCourseStudent courseStudent = courseStudentDao.findByStudentId(studentId);
        if(null != courseStudent){
            return courseDao.findOne(courseStudent.getCourseId());
        }
        return  null;
    }
}
