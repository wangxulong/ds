package com.wang.auth.sys.dao;

import com.wang.auth.sys.entity.SysRole;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

/**
 * Created by wxl on 2015/10/12.
 */
@Repository
public interface SysRoleDao extends BaseDao<SysRole,Long> {

    public List<SysRole> findByIdIn(Collection ids);

    SysRole findByRoleCode(String roleCode);
}
