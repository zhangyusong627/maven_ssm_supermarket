package cn.bdqn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginHandlerInterceptor implements HandlerInterceptor {

    // 进入 Handler方法之前执行
    // 用于身份认证、身份授权
    // 比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object obj) throws Exception {
//        String uri = request.getRequestURI();
//        System.out.println("LoginHandlerInterceptor=====preHandle=====uri:"
//                + uri);
//
//        if (uri.matches("^.*login\\.do$")) {
//            return true;
//        }
//        if (uri.matches("^.*loginAction\\.do$")) {
//            return true;
//        }
//
//        HttpSession session = request.getSession();
//        Object user = session.getAttribute("user");
//
//        if (user != null) {
//            // 拦截
//            return true;
//        }
//        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);;
//        return false;
        return true;
    }

    // 执行Handler完成执行此方法
    // 应用场景：统一异常处理，统一日志处理
    @Override
    public void afterCompletion(HttpServletRequest arg0,
            HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {

    }

    // 进入Handler方法之后，返回modelAndView之前执行
    // 应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里传到视图，也可以在这里统一指定视图
    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
            Object arg2, ModelAndView arg3) throws Exception {

    }

}
