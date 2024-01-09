package com.workflow.pro.modules.ailuo.service;

import java.util.List;


import com.baomidou.mybatisplus.extension.service.IService;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.common.web.base.page.Pageable;


import com.workflow.pro.modules.ailuo.param.ProjectSaleProcessRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectSaleProcess;

/**
 * 销售报价流程IService接口
 *
 * @author some
 * @date 2024-01-09
 */
public interface IProjectSaleProcessService  extends IService <ProjectSaleProcess>{
    /**
     * 查询销售报价流程
     *
     * @param id 销售报价流程ID
     * @return 销售报价流程
     */
        ProjectSaleProcess selectProjectSaleProcessById(Long id);


    /**
     * 查询销售报价流程
     * @param  request pageSize pageNum
     * @return 销售报价流程 分页集合
     * */
    PageResponse<ProjectSaleProcess> page(ProjectSaleProcessRequest request);

    /**
     * 查询销售报价流程列表
     * @return 销售报价流程集合
     */
    List<ProjectSaleProcess> list(ProjectSaleProcessRequest request);

    /**
     * 新增销售报价流程
     *
     * @param projectSaleProcess 销售报价流程
     * @return 结果
     */
    int insertProjectSaleProcess(ProjectSaleProcess projectSaleProcess);

    /**
     * 修改销售报价流程
     *
     * @param projectSaleProcess 销售报价流程
     * @return 结果
     */
    int updateProjectSaleProcess(ProjectSaleProcess projectSaleProcess);

    /**
     * 批量删除销售报价流程
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteProjectSaleProcessByIds(String[] ids);

    /**
     * 删除销售报价流程信息
     *
     * @param id 销售报价流程ID
     * @return 结果
     */
    int deleteProjectSaleProcessById(Long id);

}
