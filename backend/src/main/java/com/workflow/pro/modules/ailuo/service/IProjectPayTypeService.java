package com.workflow.pro.modules.ailuo.service;

import java.util.List;


import com.baomidou.mybatisplus.extension.service.IService;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.common.web.base.page.Pageable;


import com.workflow.pro.modules.ailuo.param.ProjectPayTypeRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectPayType;

/**
 * 付款方式IService接口
 *
 * @author some
 * @date 2024-01-09
 */
public interface IProjectPayTypeService  extends IService <ProjectPayType>{
    /**
     * 查询付款方式
     *
     * @param id 付款方式ID
     * @return 付款方式
     */
        ProjectPayType selectProjectPayTypeById(Long id);


    /**
     * 查询付款方式
     * @param  request pageSize pageNum
     * @return 付款方式 分页集合
     * */
    PageResponse<ProjectPayType> page(ProjectPayTypeRequest request);

    /**
     * 查询付款方式列表
     * @return 付款方式集合
     */
    List<ProjectPayType> list(ProjectPayTypeRequest request);

    /**
     * 新增付款方式
     *
     * @param projectPayType 付款方式
     * @return 结果
     */
    int insertProjectPayType(ProjectPayType projectPayType);

    /**
     * 修改付款方式
     *
     * @param projectPayType 付款方式
     * @return 结果
     */
    int updateProjectPayType(ProjectPayType projectPayType);

    /**
     * 批量删除付款方式
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteProjectPayTypeByIds(String[] ids);

    /**
     * 删除付款方式信息
     *
     * @param id 付款方式ID
     * @return 结果
     */
    int deleteProjectPayTypeById(Long id);

}
