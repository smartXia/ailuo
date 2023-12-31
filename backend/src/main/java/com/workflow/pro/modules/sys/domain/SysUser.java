package com.workflow.pro.modules.sys.domain;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.ibatis.type.Alias;
import com.baomidou.mybatisplus.annotation.TableField;
import com.workflow.pro.common.secure.services.SecureUser;

/**
 * 用户领域模型
 *
 * Author: SOME
 * CreateTime: 2022/03/27
 * */
@Data
@Alias("SysUser")
@TableName("sys_user")
@EqualsAndHashCode(callSuper = true)
public class SysUser extends SecureUser {

    /**
     * 昵称
     * */
    @TableField("nickname")
    private String nickname;

    /**
     * 邮箱
     * */
    @TableField("email")
    private String email;

    /**
     * 电话
     * */
    @TableField("phone")
    private String phone;

    /**
     * 头像
     * */
    @TableField("avatar")
    private String avatar;

    /**
     * 性别
     * */
    @TableField("gender")
    private String gender;

    /**
     * 部门
     * */
    @TableField("dept_id")
    private String deptId;

    /**
     * 部门名称 (忽略)
     * */
    @TableField(exist = false)
    private String deptName;

    /**
     * 岗位
     * */
    @TableField("post_id")
    private String postId;

    /**
     * 岗位名称 (忽略)
     * */
    @TableField(exist = false)
    private String postName;

    /**
     * 租户编号
     * */
    @TableField("tenant_id")
    private String tenantId;

    /**
     * 签名
     * */
    @TableField("`sign`")
    private String sign;


    /**
     * 部门名称 (忽略)
     * */
    @TableField(exist = false)
    private String code;


    @TableField("from_agent")
    private String fromAgent;

    @TableField("grade_id")
    private String gradeId;

    @TableField(exist = false)
    private String gradeName;


    @TableField("start_time")
    private LocalDateTime startTime;


    @TableField("`end_time`")
    private LocalDateTime endTime;


    @TableField(exist = false)
    private Integer IsInvite = 0;
}
