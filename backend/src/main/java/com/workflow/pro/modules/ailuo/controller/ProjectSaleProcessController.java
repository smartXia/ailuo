package com.workflow.pro.modules.ailuo.controller;


import com.workflow.pro.common.constant.ControllerConstant;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

import com.workflow.pro.modules.ailuo.service.IProjectSaleProcessService;

import com.workflow.pro.modules.ailuo.param.ProjectSaleProcessRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectSaleProcess;

import javax.annotation.Resource;
import java.util.List;

import io.swagger.annotations.ApiOperation;
import com.workflow.pro.common.web.base.BaseController;
import com.workflow.pro.common.aop.annotation.Log;
import com.workflow.pro.common.web.domain.Result;

/**
 * 销售报价流程Controller
 *
 * @author some
 * @date 2024-01-09
 */
@Api(tags = {"销售报价流程"})
@RestController
@RequestMapping(ControllerConstant.PREFIX_SYS + "projectSaleProcess")
public class ProjectSaleProcessController extends BaseController {

    @Resource
    private IProjectSaleProcessService projectSaleProcessService;

    /**
     * 查询销售报价流程列表
     * @param request 查询参数
     */
    @GetMapping("/list")
    @Log(title = "销售报价流程")
    @ApiOperation(value = "销售报价流程")
    public Result list(ProjectSaleProcessRequest request) {
     return success(projectSaleProcessService.list(request));
    }

    /**
     * 查询销售报价流程分页列表
     * @param request 查询参数
     */
    @GetMapping("/page")
    @Log(title = "销售报价流程列表")
    @ApiOperation(value = "销售报价流程列表")
    public Result page(ProjectSaleProcessRequest request) {
     return success(projectSaleProcessService.page(request));
    }


    /**
     * 新增销售报价流程类型
     *
     * @param projectSaleProcess projectSaleProcess 实体
     */
    @PostMapping("save")
    @Log(title = "新增销售报价流程")
    @ApiOperation(value = "销售报价流程")
    public Result save(@RequestBody ProjectSaleProcess projectSaleProcess) {
        return auto(projectSaleProcessService.save(projectSaleProcess));
    }

    /**
     * 修改销售报价流程
     * @param projectSaleProcess projectSaleProcess 实体
     */
    @PutMapping("edit")
    @Log(title = "修改销售报价流程")
    @ApiOperation(value = "修改销售报价流程")
    public Result edit(@RequestBody ProjectSaleProcess projectSaleProcess) {
        return auto(projectSaleProcessService.updateById(projectSaleProcess));
    }

    /**
     * 删除销售报价流程类型
     *
     * @param id projectSaleProcess编号
     */
    @DeleteMapping("remove")
    @Log(title = "删除销售报价流程")
    @ApiOperation(value = "删除销售报价流程")
    public Result remove(@RequestParam String id) {
        return auto(projectSaleProcessService.removeById(id));
    }

    /**
     * 删除销售报价流程类型
     *
     * @param ids projectSaleProcess 实体
     */
    @DeleteMapping("removeBatch")
    @Log(title = "批量删除")
    @ApiOperation(value = "批量删除")
    public Result removeBatch(@RequestParam List<String> ids) {
        return auto(projectSaleProcessService.removeByIds(ids));
    }
}
