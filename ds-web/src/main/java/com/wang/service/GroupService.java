package com.wang.service;


import com.wang.dao.GroupDao;
import com.wang.entity.TGroup;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/3/1.
 */
@Service
@Transactional
public class GroupService {
    @Resource
    private GroupDao groupDao;

    //现在课程组只存储一份
    public TGroup getDsGroup(){
        List<TGroup> groups = groupDao.findAll();
        if(groups.size()>0){
            return groups.get(0);
        }
        return new TGroup();
    }

    //保存
    public void saveOrUpdate(TGroup group){
        if(group.getId() == null){
            group.setCreateTime(new Date());
        }else{
            TGroup dbGroup = groupDao.findOne(group.getId());
            group.setCreateTime(dbGroup.getCreateTime());
        }
        groupDao.save(group);
    }
    //获取第一条课程组id
    public int getFirstGroup(){
        List<TGroup> groups = groupDao.findAll();
        if(groups.size()>0){
            return groups.get(0).getId();
        }
        return 0;
    }

}

