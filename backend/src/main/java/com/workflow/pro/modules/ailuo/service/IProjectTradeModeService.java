package com.workflow.pro.modules.ailuo.service;

import java.util.List;


import com.baomidou.mybatisplus.extension.service.IService;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.common.web.base.page.Pageable;


import com.workflow.pro.modules.ailuo.param.ProjectTradeModeRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectTradeMode;

/**
 * 付款方式IService接口
 *
 * @author some
 * @date 2024-01-09
 */
public interface IProjectTradeModeService  extends IService <ProjectTradeMode>{
    /**
     * 查询付款方式
     *
     * @param id 付款方式ID
     * @return 付款方式
     */
        ProjectTradeMode selectProjectTradeModeById(Long id);


    /**
     * 查询付款方式
     * @param  request pageSize pageNum
     * @return 付款方式 分页集合
     * */
    PageResponse<ProjectTradeMode> page(ProjectTradeModeRequest request);

    /**
     * 查询付款方式列表
     * @return 付款方式集合
     */
    List<ProjectTradeMode> list(ProjectTradeModeRequest request);

    /**
     * 新增付款方式
     *
     * @param projectTradeMode 付款方式
     * @return 结果
     */
    int insertProjectTradeMode(ProjectTradeMode projectTradeMode);

    /**
     * 修改付款方式
     *
     * @param projectTradeMode 付款方式
     * @return 结果
     */
    int updateProjectTradeMode(ProjectTradeMode projectTradeMode);

    /**
     * 批量删除付款方式
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteProjectTradeModeByIds(String[] ids);

    /**
     * 删除付款方式信息
     *
     * @param id 付款方式ID
     * @return 结果
     */
    int deleteProjectTradeModeById(Long id);

}
