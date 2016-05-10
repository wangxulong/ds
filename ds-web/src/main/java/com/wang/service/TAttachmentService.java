package com.wang.service;

import com.wang.dao.TAttachmentDao;
import com.wang.entity.TAttachment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/5/10 0010.
 */
@Service
@Transactional
public class TAttachmentService {
    @Resource
    private TAttachmentDao tAttachmentDao;

    /*添加附件*/
    public void addAttachment(TAttachment attachment){
        tAttachmentDao.save(attachment);
    }

}
