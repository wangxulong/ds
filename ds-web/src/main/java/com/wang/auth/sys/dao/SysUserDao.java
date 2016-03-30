package com.wang.auth.sys.dao;

import com.wang.auth.sys.entity.SysUser;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Created by wxl on 2015/10/1.
 */
@Repository
public interface SysUserDao extends BaseDao<SysUser,Long> {

    @Query("FROM SysUser s WHERE s.userName=?1")
    public SysUser getByUserName(String name);

    @Query("FROM SysUser s WHERE s.userName=?1 and s.password=?2")
    public SysUser getByUserNameAndPassword(String name, String password);

}
