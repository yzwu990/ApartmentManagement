package com.example.management.common;

import java.io.Serializable;

/**
 * @Auth: yz
 * @Desc: stand return result
 */
public class Result implements Serializable {

    private static final long serialVersionUID = -2435089504958177374L;

    private boolean flag;//status
    private Integer code;//status code
    private String message;//return message
    private Object data;
    /**
     * non-argument constructor
     */
    public Result() {
    }

    /**
     * constructor: no Object data
     * @param flag  status
     * @param code  status code
     * @param message   status message
     */
    public Result(boolean flag, Integer code, String message) {
        this.flag = flag;
        this.code = code;
        this.message = message;
    }
    /**
     * constructor: with Object data
     * @param flag  status
     * @param code  status code
     * @param message   status message
     * @param data  data on page
     */
    public Result(boolean flag, Integer code, String message, Object data) {
        this.flag = flag;
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Result{" +
                "flag=" + flag +
                ", code=" + code +
                ", message='" + message + '\'' +
                '}';
    }
}
