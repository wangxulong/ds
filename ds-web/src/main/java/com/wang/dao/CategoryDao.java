package com.wang.dao;

import com.wang.auth.sys.dao.BaseDao;
import com.wang.entity.TbCategory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by wxl on 2016/2/26.
 */
@Repository
public interface CategoryDao extends BaseDao<TbCategory,Long>{

    @Query("FROM TbCategory a WHERE  a.status=?1 ")
    public List<TbCategory> getAllCategory(Byte status);

    @Query("FROM TbCategory a WHERE  a.status=?1 and a.parentId =?2 ")
    public List<TbCategory> getCategoryByParentId(Byte status, Long parentId);
}
