package com.wang.dto;

import com.wang.auth.sys.entity.SysResource;

import java.util.List;

/**
 * Created by wxl on 2015/10/22.
 */
public class ResourceDto {
    private SysResource parent;
    private List<SysResource> children;

    public ResourceDto(SysResource parent, List<SysResource> children) {
         this.parent =parent;
         this.children = children;
    }

    public ResourceDto() {

    }

    public SysResource getParent() {
        return parent;
    }

    public void setParent(SysResource parent) {
        this.parent = parent;
    }

    public List<SysResource> getChildren() {
        return children;
    }

    public void setChildren(List<SysResource> children) {
        this.children = children;
    }
}
