package com.wang.entity.enums;

public enum NoteState {
    Wait(0, "待审核"),
    Auth(1, "已批准"),
    UnAuth(2, "未批准");

    private int type;
    private String description;

    private NoteState(int type, String description) {
        this.type = type;
        this.description = description;
    }

    public int getType() {
        return this.type;
    }
}
