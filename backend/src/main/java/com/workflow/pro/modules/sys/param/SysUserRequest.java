package com.workflow.pro.modules.sys.param;

import lombok.Data;
import com.workflow.pro.common.web.base.page.PageRequest;
import org.apache.ibatis.type.Alias;

/**
 * 用户列表 -- 参数实体
 * <p>
 * Author: SOME
 * CreateTime: 2022/04/01
 */
@Data
@Alias("SysUserRequest")
public class SysUserRequest extends PageRequest {

    /**
     * 账户
     */
    private String username;

    /**
     * 昵称
     */
    private String nickname;


    /**
     * 昵称
     */
    private String fromAgent;


    /**
     * 昵称
     */
    private String gradeId;

    private String phone;

    private String dstId;
    //增加部门id筛选
    private String deptId;
}
