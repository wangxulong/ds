package com.wang.service;


import com.wang.auth.sys.dao.SysRoleDao;
import com.wang.auth.sys.dao.SysUserDao;
import com.wang.auth.sys.entity.SysRole;
import com.wang.auth.sys.entity.SysUser;
import com.wang.dao.*;
import com.wang.dto.EchartDto;
import com.wang.entity.*;
import com.wang.util.ConstantUtil;
import com.wang.util.PasswordHelper;
import com.wang.util.UpFilesUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by wxl on 2016/3/1.
 */
@Service
@Transactional
public class TeacherService {
    //老师角色
    private static String TEACHER_DODE="teacher";
    @Resource
    private TeacherDao teacherDao;
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysRoleDao sysRoleDao;
    @Resource
    private GroupService groupService;
    @Qualifier("TCourseDao")
    @Resource
    private TCourseDao courseDao;
    @Resource
    private TAttachmentDao attachmentDao;
    @Resource
    private RcourseStudentDao rcourseStudentDao;
    @Resource
    private StudentDao studentDao;

    public List<TTeacher> findAllTeacher(){
        List<TTeacher> teachers = teacherDao.findAll();
        for(TTeacher teacher:teachers){
            TCourse course =   courseDao.findByTeacherId(teacher.getId());
            if(null != course){
                teacher.setTeacherPlan(course.getAttachmentId());
            }

         }
       return teachers;
    }
    public TTeacher findById(Integer id){
       return teacherDao.findOne(id);
    }
    public void deleteByIds(Integer[] ids){
        for(Integer id:ids){
            teacherDao.delete(id);
        }
    }

    //添加或修改教师信息
    public void addOrUpdate(TTeacher teacher){
        if(null == teacher.getId()){
            //新添加
            teacher.setCreateTime(new Date());
            //添加账号信息
            addSysUser(teacher);

            teacherDao.save(teacher);
            //添加课程信息
            TGroup group = groupService.getDsGroup();
            TCourse course = new TCourse();
            course.setAvailable(true);
            course.setName(ConstantUtil.DS);
            course.setTeacherId(teacher.getId());
            course.setGroupId(group.getId());
            courseDao.save(course);
            return;

        }else{
            TTeacher dbTeacher = teacherDao.findOne(teacher.getId());
            if(null ==  dbTeacher){
                throw  new RuntimeException("修改信息不存在");
            }
            teacher.setCreateTime(dbTeacher.getCreateTime());
        }
        teacherDao.save(teacher);
    }
    //新增教师信息的同时自动创建账号信息,自动绑定教师角色
    public void addSysUser(TTeacher teacher){
        //username : idcard password:idcard
        String userName = teacher.getJobNumber();
        String password = teacher.getIdcard();
        SysUser sysUser = PasswordHelper.md5Password(userName,password);
        sysUser.setNickName(teacher.getName());
        //获取角色信息
        SysRole sysRole = sysRoleDao.findByRoleCode(TEACHER_DODE);
        if(null == sysRole){
            throw new RuntimeException("教师角色不存在");
        }
        sysUser.setRoleIds(sysRole.getId()+"");
        sysUserDao.save(sysUser);
    }
    public EchartDto teacherLeave(){
        List<String> legendData = new ArrayList<String>();
        legendData.add("教授");
        legendData.add("副教授");
        legendData.add("讲师");
        legendData.add("助教");
        List<Map<String,Object>> seriesData = new ArrayList<Map<String, Object>>();
        List<TTeacher> list = teacherDao.findAll();
        int sumTotal=0,preNum=0,vPreNum=0,lecNum=0,taNum=0;
        sumTotal = list.size();
        for(int i=0;i<sumTotal;i++){
            if(list.get(i).getLevel().equals("教授")){
                preNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("副教授")){
                vPreNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("讲师")){
                lecNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("助教")){
                taNum++;
                continue;
            }
        }
        for(String title :legendData ){
            Map<String,Object> m = new HashMap<String, Object>();
            m.put("name",title);
            if(title.equals("教授")){
                m.put("value",preNum);
            }else if(title.equals("副教授")){
                m.put("value",vPreNum);
            }else if(title.equals("讲师")){
                m.put("value",lecNum);
            }else if(title.equals("助教")){
                m.put("value",taNum);
            }
            seriesData.add(m);

        }

        EchartDto dto = new EchartDto(legendData,seriesData);
        return dto;
    }
    public EchartDto teachState(){
        List<String> legendData = new ArrayList<String>();
        legendData.add("教课中");
        legendData.add("未教课");

        List<Map<String,Object>> seriesData = new ArrayList<Map<String, Object>>();
        List<TTeacher> list = teacherDao.findAll();
        int sumTotal=0,inTech=0,outTeach=0;
        sumTotal = list.size();
        for(int i=0;i<sumTotal;i++){
            if(list.get(i).getState()==1){
                inTech++;
            }else{
                outTeach++;
            }
        }
        for(String title :legendData ){
            Map<String,Object> m = new HashMap<String, Object>();
            m.put("name",title);
            if(title.equals("教课中")){
                m.put("value",inTech);
            }else if(title.equals("未教课")){
                m.put("value",outTeach);
            }
            seriesData.add(m);
        }

        EchartDto dto = new EchartDto(legendData,seriesData);
        return dto;
    }
    //获取各种职称的人数
    public Map<String,Integer> getNumOfLevels(){
        Map<String,Integer> map = new LinkedHashMap<String, Integer>();
        List<TTeacher> list = teacherDao.findAll();
        int sumTotal=0,preNum=0,vPreNum=0,lecNum=0,taNum=0;
        sumTotal = list.size();
        for(int i=0;i<sumTotal;i++){
            if(list.get(i).getLevel().equals("教授")){
                preNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("副教授")){
                vPreNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("讲师")){
                lecNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("助教")){
                taNum++;
                continue;
            }
        }
        map.put("总人数:", sumTotal);
        map.put("教授:",preNum);
        map.put("副教授:",vPreNum);
        map.put("讲师:", lecNum);
        map.put("助教:", taNum);
        return map;
    }

    //获取老师性别人数,教课中的人数
    public Map<String,Integer> getNumOfSexState(){
        Map<String,Integer> map = new LinkedHashMap<String, Integer>();
        List<TTeacher> list = teacherDao.findAll();
        int manNum=0,womenNum=0,inTech=0,outTeach=0;
        for(int i=0;i<list.size();i++){
            if(list.get(i).getSex()==1){
                manNum++;
            }else{
                womenNum++;
            }
            if(list.get(i).getState()==1){
                inTech++;
            }else{
                outTeach++;
            }

        }
        map.put("男:",manNum);
        map.put("女:",womenNum);
        map.put("教课中:",inTech);
        map.put("未教课:", outTeach);
        return map;
    }

    /**
     * 获取所有的授课老师信息（教学中的）
     * 1 教课中
     */

    public List<TTeacher> getInTeachTeacher(){
        return teacherDao.findByState(1);
    }


    /**
     * 获取上传的教学计划
     */

    public List<TAttachment> getMySchedule(Integer teacherId){
        TCourse course =   courseDao.findByTeacherId(teacherId);
        if(null == course){
            return null;
           // throw new RuntimeException("没有对应的课程信息");
        }
        String schedule = course.getSchedule();
        if(StringUtils.isNotEmpty(schedule)){
            String[] attachIds = schedule.split(",");
            Integer[] ids = new Integer[attachIds.length];
            for(int i=0;i<attachIds.length;i++){
                ids[i] = Integer.parseInt(attachIds[i]);
            }
            return attachmentDao.findByIds(ids);
        }
        return null;
    }
    //添加教学计划
    public void addSchedule(Integer teacherId,String content,MultipartFile file,String path){
        TCourse course =  courseDao.findByTeacherId(teacherId);
        String schedule = course.getSchedule();
        String fileName =  UpFilesUtils.saveUploadFile(file,path);
        TAttachment attachment = new TAttachment();
        attachment.setName(file.getOriginalFilename());
        attachment.setFormat(file.getContentType());
        attachment.setContent(content);
        attachment.setPath(ConstantUtil.TEACH_PLAN_PATH + "\\" + fileName);
        attachment.setCreateTime(new Date());
        attachmentDao.save(attachment);
        if(StringUtils.isNotEmpty(schedule)){
            schedule =  attachment.getId()+","+schedule;
        }else{
            schedule = attachment.getId()+"";
        }

        course.setSchedule(schedule);
        courseDao.save(course);
    }

    public List<TStudent> getMyStudents(Integer teacherId){
        if(null == teacherId){
            return studentDao.findAll();
        }
        TCourse course = courseDao.findByTeacherId(teacherId);
        List<RCourseStudent> courseStudents = rcourseStudentDao.findByCourseId(course.getId());
        List<Integer> studentIds = new ArrayList<Integer>();
        for(RCourseStudent courseStudent : courseStudents){
            studentIds.add(courseStudent.getId());
        }
        List<TStudent> students =studentDao.findAllStudentInCourse((Integer[]) studentIds.toArray());
        return students;
    }

}

