package com.dienthoaiviet.utils;

import com.dienthoaiviet.model.dto.StaffDto;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*","/account/*"},dispatcherTypes = DispatcherType.REQUEST)
public class AuthorizationFilter implements Filter {
    private ServletContext servletContext;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.servletContext = filterConfig.getServletContext();
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resq = (HttpServletResponse) response;
        StaffDto staffDto = (StaffDto) SessionUtil.getUser( req,"user");
        if(staffDto==null){
            resq.sendRedirect(req.getContextPath()+"/login");
        }else {
          chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}
