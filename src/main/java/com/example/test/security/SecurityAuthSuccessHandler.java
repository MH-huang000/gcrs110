package com.example.test.security;

import java.io.IOException;
import java.util.Collection;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class SecurityAuthSuccessHandler implements AuthenticationSuccessHandler {

    protected Log log = LogFactory.getLog(this.getClass());
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        String tragetUrl = getTareUrl(authentication);
        if (response.isCommitted()) {
            log.debug("Response has already been committed. Unable to redirect to " + tragetUrl);
            return;
        }
        redirectStrategy.sendRedirect(request, response, tragetUrl);

    }

    protected String getTareUrl(Authentication authentication) {
        boolean isStaff = false;
        boolean isStudent = false;
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("student")) {
                isStudent = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("staff")) {
                isStaff = true;
                break;
            }
        }
        if (isStudent) {
            return "/versions";
        } else if (isStaff) {
            return "/admins/index";
        } else {
            throw new IllegalStateException();
        }
    }

}
