package cn.bdqn.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class GlobalExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request,
            HttpServletResponse response, Object handler, Exception ex) {
        
        ModelAndView modelAndView = new ModelAndView("404");
        
        System.out.println(ex.getMessage());

        if (ex instanceof ControllerException) {
            modelAndView.addObject("message", ex.getMessage());
        } else {
            modelAndView.addObject("message", "系统异常，请与管理员联系！");
        }

        return modelAndView;
    }

}
