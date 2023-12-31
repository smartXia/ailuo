package com.workflow.pro.common.context;

import com.workflow.pro.modules.sys.domain.SysRole;
import com.workflow.pro.modules.sys.domain.SysUser;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import java.util.List;

/**
 * User Context
 *
 * Author: SOME
 * CreateTime: 2022/04/23
 * */
@Component
public class UserContext {

    /**
     * Authentication 认证对象
     * */
    public Authentication getAuthentication(){
        return SecurityContextHolder.getContext().getAuthentication();
    }

    /**
     * SysUser 当前用户
     * */
    public SysUser getPrincipal(){ return (SysUser) getAuthentication().getPrincipal(); }

    /**
     * Username 当前用户名
     * */
    public String getUsername(){ return getPrincipal().getUsername(); }

    /**
     * nickname 当前用户昵称
     * */
    public String getNickName(){ return getPrincipal().getNickname(); }


    /**
     * nickname 当前用户昵称
     * */
    public String getFromAgent(){ return getPrincipal().getFromAgent(); }

    /**
     * UserId 用户编号
     * */
    public String getUserId(){ return getPrincipal().getId(); }

    /**
     * deptId 当前部门
     * */
    public String getDeptId(){ return getPrincipal().getDeptId(); }

    /**
     * tenantId 当前租户
     * */
    public String getTenantId() { return getPrincipal().getTenantId(); }

    /**
     * roles 角色列表
     * */
    public List<SysRole> getRoles() { return getPrincipal().getRoles(); }

}
