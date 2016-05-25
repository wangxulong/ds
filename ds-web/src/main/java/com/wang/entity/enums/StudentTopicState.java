package com.wang.entity.enums;

public enum StudentTopicState {
    Submit(0, "已提交"),
    Selected(1, "已选择"),
    UnSelected(2, "选择失败");

    private int type;
    private String description;

    private StudentTopicState(int type, String description) {
        this.type = type;
        this.description = description;
    }
    public StudentTopicState getByType(int type){
        for(StudentTopicState joinTopicState : StudentTopicState.values()){
            if(joinTopicState.getType()== type){
                return joinTopicState;
            }
        }
        return null;
    }
    public String getDescription(){
        return this.description;
    }
    public int getType() {
        return this.type;
    }
}
