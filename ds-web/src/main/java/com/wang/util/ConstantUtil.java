package com.wang.util;

/**
 * Created by wxl on 2016/2/26.
 */
public class ConstantUtil {
    public static final byte requireType = 0;
    public static final byte questionType = 1;
    public static final byte serviceType = 2;

    public static final byte delete_status = 0;
    public static final byte normal_status = 1;
    public static final byte hot_status=3;


    //一页数据大小
    public static final int PAGE_SIZE =10;
    //1
    public static final int FIRST =1;

    //学生登录标志
    public  static final String STUDENT_LOGIN_FLAG="loginStudent";

    //上传的文件的标识
    public static final String STUDENT_HOMEWORK_PATH="upload\\studentHomework";//学生作业
    public static final String TASK_PATH="upload\\task";//教学任务
    public static final String LEAVE_PATH="upload\\leave";//学生请假
    public static final String TEACH_PLAN_PATH="upload\\teachPlan";//教学计划
    //数据结构
    public static final String DS = "数据结构";
}
