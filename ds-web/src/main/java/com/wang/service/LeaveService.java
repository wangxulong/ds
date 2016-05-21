package com.wang.service;

import com.wang.dao.LeaveDao;
import com.wang.dao.TAttachmentDao;
import com.wang.entity.TAttachment;
import com.wang.entity.TLeave;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;

import com.wang.entity.enums.LeaveState;
import com.wang.util.ConstantUtil;
import com.wang.util.UpFilesUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class LeaveService {
    @Resource
    private LeaveDao leaveDao;
    @Qualifier("TAttachmentDao")
    @Resource
    private TAttachmentDao attachmentDao;

    public LeaveService() {
    }

    public List<TLeave> getMyLeaves(Integer studentId) {
        return this.leaveDao.findByStudentId(studentId);
    }

    /**
     * 添加请假信息
     *
     */
    public void add(MultipartFile file, TLeave leave,Integer studentId,String path) {
        Integer attachId = 0;
        if(!file.isEmpty()){
            String fileName =  UpFilesUtils.saveUploadFile(file, path);
            TAttachment attachment = new TAttachment();
            attachment.setName(UpFilesUtils.realName);
            attachment.setFormat(UpFilesUtils.prefix);
            attachment.setPath(ConstantUtil.LEAVE_PATH+"\\"+fileName);
            attachmentDao.save(attachment);
            attachId = attachment.getId();
        }
        if(attachId>0){
            leave.setAttachId(attachId);
        }
        leave.setCreateTime(new Date());
        //设置课程ID
        leave.setStudentId(studentId);
        leave.setState(LeaveState.Submit);
        this.leaveDao.save(leave);
    }
}
