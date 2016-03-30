package com.wang.dto;

/**
 * Created by wxl on 2015/10/20.
 */
public class ResultMessage {
    public static final String SUCCESS="success";
    public static final String ERROR="error";

    private String status;
    private String message;
    private Object data;

    public ResultMessage() {
    }

    public ResultMessage(String status, String message) {
        this.status = status;
        this.message = message;
    }

    public ResultMessage(String status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
