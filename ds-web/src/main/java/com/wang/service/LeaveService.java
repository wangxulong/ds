package com.wang.service;

import com.wang.dao.LeaveDao;
import com.wang.entity.TLeave;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LeaveService {
    @Resource
    private LeaveDao leaveDao;

    public LeaveService() {
    }

    public List<TLeave> getMyLeaves(Integer studentId) {
        return this.leaveDao.findByStudentId(studentId);
    }

    public void add(TLeave leave) {
        this.leaveDao.save(leave);
    }
}
