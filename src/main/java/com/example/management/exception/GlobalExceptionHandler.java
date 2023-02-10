package com.example.management.exception;

import com.example.management.common.MessageConstant;
import com.example.management.common.Result;
import com.example.management.common.StatusCode;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Auth: yz
 * @Desc: Handle global exception
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * catch exception and show message
     * @param exception
     * @return : com.heima.estatemanagement.common.Result
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Result error(Exception exception){
        exception.printStackTrace();
        return new Result(false, StatusCode.ERROR, MessageConstant.SYSTEM_BUSY);
    }
}
