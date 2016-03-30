package com.wang.service;

import com.wang.dao.CategoryDao;
import com.wang.entity.TbCategory;
import com.wang.util.ConstantUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2016/3/1.
 */
@Service
@Transactional
public class CategoryService {
    @Resource
    private CategoryDao categoryDao;

    //查询所有的类别
    public List<TbCategory> getAllCategory(){
        return categoryDao.getAllCategory(ConstantUtil.normal_status);
    }

    //获取第一级菜单
    public List<TbCategory> getFirstLevelCategory(){
        return categoryDao.getCategoryByParentId(ConstantUtil.normal_status,1l);
    }


}

