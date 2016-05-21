package com.wang.entity.enums;

public enum LeaveState {
    Submit(0, "已提交"),
    Auth(1, "已批准"),
    UnAuth(2, "未批准");

    private int type;
    private String description;

    private LeaveState(int type, String description) {
        this.type = type;
        this.description = description;
    }

    public String getDescription(){
        return this.description;
    }
    public int getType() {
        return this.type;
    }
}
