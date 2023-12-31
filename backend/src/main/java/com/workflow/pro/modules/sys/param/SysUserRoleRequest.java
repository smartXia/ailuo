package com.workflow.pro.modules.sys.param;

import lombok.Data;

import java.util.List;

/**
 * 用户角色 -- 参数实体
 *
 * Author: SOME
 * CreateTime: 2022/04/01
 */
@Data
public class SysUserRoleRequest {

    /**
     * 用户编号
     * */
    private String userId;

    /**
     * 角色集合
     * */
    private List<String> roleIds;

}
