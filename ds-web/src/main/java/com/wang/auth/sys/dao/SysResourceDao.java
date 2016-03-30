package com.wang.auth.sys.dao;

import com.wang.auth.sys.entity.SysResource;
import com.wang.auth.sys.enumeration.SysResourceType;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

/**
 * Created by wxl on 2015/10/12.
 */
@Repository
public interface SysResourceDao extends BaseDao<SysResource,Long> {

    List<SysResource> findByParentId(Long parentId);

    List<SysResource> findByType(SysResourceType type);

    List<SysResource> findByTypeAndParentId(SysResourceType type, Long parentId);

    List<SysResource> findByIdIn(Collection ids);

    List<SysResource> findByTypeAndIdIn(SysResourceType type, Collection ids);

   /* @Query("SELECT s2 , (SELECT COUNT(s1) FROM SysResource s1 WHERE s1.parentId = s2.id) as childCount" +
            "FROM SysResource s2 WHERE s2.parentId = ?1")
    List<SysResource> getAjaxTreeData(Long parentId);*/

}
