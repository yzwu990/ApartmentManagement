package com.example.management.common;

/**
 * @Auth: yz
 * @Desc: return status code
 */
public class StatusCode {

    public static final int OK=2000;//success
    public static final int ERROR =2001;//fail
    public static final int LOGINERROR =2002;//username or password is wrong
    public static final int ACCESSERROR =2003;//no permission
    public static final int REMOTEERROR =2004;//remote error
    public static final int REPERROR =2005;//repeat error

}
