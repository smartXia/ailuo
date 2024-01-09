package com.workflow.pro.modules.ailuo.controller;


import com.workflow.pro.common.constant.ControllerConstant;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

import com.workflow.pro.modules.ailuo.service.IProjectTechnicalProcessService;

import com.workflow.pro.modules.ailuo.param.ProjectTechnicalProcessRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectTechnicalProcess;

import javax.annotation.Resource;
import java.util.List;

import io.swagger.annotations.ApiOperation;
import com.workflow.pro.common.web.base.BaseController;
import com.workflow.pro.common.aop.annotation.Log;
import com.workflow.pro.common.web.domain.Result;

/**
 * 审批状态流Controller
 *
 * @author some
 * @date 2024-01-09
 */
@Api(tags = {"审批状态流"})
@RestController
@RequestMapping(ControllerConstant.PREFIX_SYS + "projectTechnicalProcess")
public class ProjectTechnicalProcessController extends BaseController {

    @Resource
    private IProjectTechnicalProcessService projectTechnicalProcessService;

    /**
     * 查询审批状态流列表
     * @param request 查询参数
     */
    @GetMapping("/list")
    @Log(title = "审批状态流")
    @ApiOperation(value = "审批状态流")
    public Result list(ProjectTechnicalProcessRequest request) {
     return success(projectTechnicalProcessService.list(request));
    }

    /**
     * 查询审批状态流分页列表
     * @param request 查询参数
     */
    @GetMapping("/page")
    @Log(title = "审批状态流列表")
    @ApiOperation(value = "审批状态流列表")
    public Result page(ProjectTechnicalProcessRequest request) {
     return success(projectTechnicalProcessService.page(request));
    }


    /**
     * 新增审批状态流类型
     *
     * @param projectTechnicalProcess projectTechnicalProcess 实体
     */
    @PostMapping("save")
    @Log(title = "新增审批状态流")
    @ApiOperation(value = "审批状态流")
    public Result save(@RequestBody ProjectTechnicalProcess projectTechnicalProcess) {
        return auto(projectTechnicalProcessService.save(projectTechnicalProcess));
    }

    /**
     * 修改审批状态流
     * @param projectTechnicalProcess projectTechnicalProcess 实体
     */
    @PutMapping("edit")
    @Log(title = "修改审批状态流")
    @ApiOperation(value = "修改审批状态流")
    public Result edit(@RequestBody ProjectTechnicalProcess projectTechnicalProcess) {
        return auto(projectTechnicalProcessService.updateById(projectTechnicalProcess));
    }

    /**
     * 删除审批状态流类型
     *
     * @param id projectTechnicalProcess编号
     */
    @DeleteMapping("remove")
    @Log(title = "删除审批状态流")
    @ApiOperation(value = "删除审批状态流")
    public Result remove(@RequestParam String id) {
        return auto(projectTechnicalProcessService.removeById(id));
    }

    /**
     * 删除审批状态流类型
     *
     * @param ids projectTechnicalProcess 实体
     */
    @DeleteMapping("removeBatch")
    @Log(title = "批量删除")
    @ApiOperation(value = "批量删除")
    public Result removeBatch(@RequestParam List<String> ids) {
        return auto(projectTechnicalProcessService.removeByIds(ids));
    }
}
