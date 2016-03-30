package com.wang.auth;

import com.google.common.base.Strings;
import com.wang.auth.sys.entity.SysResource;
import com.wang.auth.sys.entity.SysRole;
import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SecurityService;
import com.wang.auth.sys.service.SysResourceService;
import com.wang.auth.sys.service.SysUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2015/10/1.
 */
public class DbRealm extends AuthorizingRealm {
    private Logger logger = LoggerFactory.getLogger(DbRealm.class);
    @Resource
    private SysUserService sysUserService;
    @Resource
    private SecurityService securityService;
    @Resource
    private SysResourceService sysResourceService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection p) {
        SysUser user = securityService.getLoginUser();
        if (user != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            //获取角色
            List<SysRole> myRoles = sysUserService.getMyRole(user.getId());
            for(SysRole myRole:myRoles){
                info.addRole(myRole.getRoleCode());
            }
            List<SysResource> myResources = sysResourceService.getMyResourcesByRoles(myRoles);
            if(!myResources.isEmpty()){
                for(SysResource myResource:myResources){
                    if(!Strings.isNullOrEmpty(myResource.getResourceCode()))
                        info.addStringPermission(myResource.getResourceCode());
                }
            }

/*//          for (Role role : user.getRoles()) {
//              //基于Role的权限信息
//              info.addRole(role.getName());
//          }
//          info.addStringPermissions(user.getPermissions());
            info.addRole("admin");*/
            return info;
        } else {
            return null;
        }


    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        SysUser user  = sysUserService.getByName(token.getUsername());
        if (user != null) {
           SimpleAuthenticationInfo info= new SimpleAuthenticationInfo(user.getUserName(),
                    user.getPassword(),ByteSource.Util.bytes(user.getUserName()+user.getSalt()), user.getUserName());

            return info;
        }
        return null;
    }
}
