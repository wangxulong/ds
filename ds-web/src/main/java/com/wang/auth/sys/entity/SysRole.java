package com.wang.auth.sys.entity;

import javax.persistence.*;

/**
 * Created by wxl on 2015/10/12.
 */
@Entity
@Table(name = "sys_role")
public class SysRole extends BaseEntity {

    @Column(name = "role_name")
    private String roleName;
    @Column(name = "role_code")
    private String roleCode;
    @Column(name = "role_desc")
    private String roleDesc;
    @Column(name = "available")
    private Boolean available;
    @Column(name = "resource_ids")
    private String resourceIds;


    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public String getResourceIds() {
        return resourceIds;
    }

    public void setResourceIds(String resourceIds) {
        this.resourceIds = resourceIds;
    }
}
