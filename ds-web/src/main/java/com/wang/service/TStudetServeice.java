package com.wang.service;

import com.wang.dao.StudentDao;
import com.wang.entity.TStudent;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liu on 2016/5/12.
 */
@Service
@Transactional
public class TStudetServeice {
    @Resource
    private StudentDao studentDao;

    public List<TStudent> getAllStudent(){
        List<TStudent> students;
        students=studentDao.findAll();
        return students;
    }
}
