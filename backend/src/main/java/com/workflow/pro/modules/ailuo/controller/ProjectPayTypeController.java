package com.workflow.pro.modules.ailuo.controller;


import com.workflow.pro.common.constant.ControllerConstant;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

import com.workflow.pro.modules.ailuo.service.IProjectPayTypeService;

import com.workflow.pro.modules.ailuo.param.ProjectPayTypeRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectPayType;

import javax.annotation.Resource;
import java.util.List;

import io.swagger.annotations.ApiOperation;
import com.workflow.pro.common.web.base.BaseController;
import com.workflow.pro.common.aop.annotation.Log;
import com.workflow.pro.common.web.domain.Result;

/**
 * 付款方式Controller
 *
 * @author some
 * @date 2024-01-09
 */
@Api(tags = {"付款方式"})
@RestController
@RequestMapping(ControllerConstant.PREFIX_SYS + "projectPayType")
public class ProjectPayTypeController extends BaseController {

    @Resource
    private IProjectPayTypeService projectPayTypeService;

    /**
     * 查询付款方式列表
     * @param request 查询参数
     */
    @GetMapping("/list")
    @Log(title = "付款方式")
    @ApiOperation(value = "付款方式")
    public Result list(ProjectPayTypeRequest request) {
     return success(projectPayTypeService.list(request));
    }

    /**
     * 查询付款方式分页列表
     * @param request 查询参数
     */
    @GetMapping("/page")
    @Log(title = "付款方式列表")
    @ApiOperation(value = "付款方式列表")
    public Result page(ProjectPayTypeRequest request) {
     return success(projectPayTypeService.page(request));
    }


    /**
     * 新增付款方式类型
     *
     * @param projectPayType projectPayType 实体
     */
    @PostMapping("save")
    @Log(title = "新增付款方式")
    @ApiOperation(value = "付款方式")
    public Result save(@RequestBody ProjectPayType projectPayType) {
        return auto(projectPayTypeService.save(projectPayType));
    }

    /**
     * 修改付款方式
     * @param projectPayType projectPayType 实体
     */
    @PutMapping("edit")
    @Log(title = "修改付款方式")
    @ApiOperation(value = "修改付款方式")
    public Result edit(@RequestBody ProjectPayType projectPayType) {
        return auto(projectPayTypeService.updateById(projectPayType));
    }

    /**
     * 删除付款方式类型
     *
     * @param id projectPayType编号
     */
    @DeleteMapping("remove")
    @Log(title = "删除付款方式")
    @ApiOperation(value = "删除付款方式")
    public Result remove(@RequestParam String id) {
        return auto(projectPayTypeService.removeById(id));
    }

    /**
     * 删除付款方式类型
     *
     * @param ids projectPayType 实体
     */
    @DeleteMapping("removeBatch")
    @Log(title = "批量删除")
    @ApiOperation(value = "批量删除")
    public Result removeBatch(@RequestParam List<String> ids) {
        return auto(projectPayTypeService.removeByIds(ids));
    }
}
