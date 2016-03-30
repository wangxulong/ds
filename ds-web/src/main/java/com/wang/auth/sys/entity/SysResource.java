package com.wang.auth.sys.entity;

import com.wang.auth.sys.enumeration.SysResourceType;

import javax.persistence.*;

/**
 * Created by wxl on 2015/10/12.
 */
@Entity
@Table(name = "sys_resource")
public class SysResource extends BaseEntity{

    @Column(name = "name")
    private String name;
    @Column(name = "type")
    private SysResourceType type;
    @Column(name = "order_num")
    private Integer orderNum;
    @Column(name = "parent_id")
    private Long parentId;
    @Column(name = "parent_ids")
    private String parentIds;
    @Column(name = "resource_code")
    private String resourceCode;
    @Column(name = "available")
    private Boolean available;
    @Column(name = "icon")
    private String icon;
    @Column(name = "url")
    private String url;
    @Column(name = "script")
    private String script;

    @Transient
    @Column(name = "childCount")
    private Long childCount;

    public Long getChildCount() {
        return childCount;
    }

    public void setChildCount(Long childCount) {
        this.childCount = childCount;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public SysResourceType getType() {
        return type;
    }

    public void setType(SysResourceType type) {
        this.type = type;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getResourceCode() {
        return resourceCode;
    }

    public void setResourceCode(String resourceCode) {
        this.resourceCode = resourceCode;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getScript() {
        return script;
    }

    public void setScript(String script) {
        this.script = script;
    }
}
