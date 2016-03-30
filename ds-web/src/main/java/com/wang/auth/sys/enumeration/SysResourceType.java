package com.wang.auth.sys.enumeration;

/**
 * Created by wxl on 2015/10/12.
 */
public enum SysResourceType {
    FOLDER("folder", "父菜单"),MENU("menu", "菜单"), BUTTON("button", "按钮");
    // 成员变量
    private String code;
    private String name;

    // 构造方法
    private SysResourceType(String code, String name) {
        this.name = name;
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
