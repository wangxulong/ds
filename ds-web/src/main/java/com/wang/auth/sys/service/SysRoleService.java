package com.wang.auth.sys.service;

import com.wang.auth.DbRealm;
import com.wang.auth.sys.dao.SysResourceDao;
import com.wang.auth.sys.dao.SysRoleDao;
import com.wang.auth.sys.entity.SysResource;
import com.wang.auth.sys.entity.SysRole;
import com.wang.util.CommonUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2015/10/12.
 */
@Service
@Transactional
public class SysRoleService {
    @Resource
    private SysRoleDao sysRoleDao;
    @Resource
    private SysResourceDao sysResourceDao;



    public void addRole(String roleName,String roleCode,String roleDesc,boolean available,String resourceIds){
        SysRole role = new SysRole();
        role.setAvailable(available);
        role.setRoleName(roleName);
        role.setResourceIds(resourceIds);
        role.setRoleCode(roleCode);
        role.setRoleDesc(roleDesc);
        sysRoleDao.save(role);

    }
    public void addRole(String roleName,String roleCode,String roleDesc,boolean available){
        addRole(roleName, roleCode, roleDesc, available, null);
    }
    public List<SysRole> getAllRoles(){
        return sysRoleDao.findAll();
    }

    public void deleteRole(Long... ids){
        for(Long id:ids){
            sysRoleDao.delete(id);
        }
    }

    public void addRoleRes(Long id,String resourceIds){
        SysRole role = sysRoleDao.findOne(id);
        role.setResourceIds(resourceIds);
        sysRoleDao.save(role);
        //清除缓存
        RealmSecurityManager securityManager =(RealmSecurityManager)SecurityUtils.getSecurityManager();
        DbRealm dbRealm = (DbRealm) securityManager.getRealms().iterator().next();
        dbRealm.getAuthorizationCache().clear();

    }

    public List<SysResource> getRoleResource(Long roleId){
        SysRole role = sysRoleDao.findOne(roleId);
         List<Long> resIds = CommonUtil.convertStringToLongArray(role.getResourceIds());
         if(null!=resIds){
             return sysResourceDao.findByIdIn(resIds);
         }
        return null;
    }




}
