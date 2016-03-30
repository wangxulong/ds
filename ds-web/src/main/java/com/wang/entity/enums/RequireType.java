package com.wang.entity.enums;

/**
 * Created by wxl on 2016/2/26.
 */
public enum  RequireType {
    Require(0,"有偿需求"),Question(1,"免费问答");
    private int type;
    private String description;
    private  RequireType(int type,String description){
        this.type =type;
        this.description = description;
    };

    public int getType() {
        return type;
    }
}
