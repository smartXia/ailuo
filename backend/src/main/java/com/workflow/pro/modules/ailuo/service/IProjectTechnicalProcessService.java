package com.workflow.pro.modules.ailuo.service;

import java.util.List;


import com.baomidou.mybatisplus.extension.service.IService;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.common.web.base.page.Pageable;


import com.workflow.pro.modules.ailuo.param.ProjectTechnicalProcessRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectTechnicalProcess;

/**
 * 审批状态流IService接口
 *
 * @author some
 * @date 2024-01-09
 */
public interface IProjectTechnicalProcessService  extends IService <ProjectTechnicalProcess>{
    /**
     * 查询审批状态流
     *
     * @param id 审批状态流ID
     * @return 审批状态流
     */
        ProjectTechnicalProcess selectProjectTechnicalProcessById(Long id);


    /**
     * 查询审批状态流
     * @param  request pageSize pageNum
     * @return 审批状态流 分页集合
     * */
    PageResponse<ProjectTechnicalProcess> page(ProjectTechnicalProcessRequest request);

    /**
     * 查询审批状态流列表
     * @return 审批状态流集合
     */
    List<ProjectTechnicalProcess> list(ProjectTechnicalProcessRequest request);

    /**
     * 新增审批状态流
     *
     * @param projectTechnicalProcess 审批状态流
     * @return 结果
     */
    int insertProjectTechnicalProcess(ProjectTechnicalProcess projectTechnicalProcess);

    /**
     * 修改审批状态流
     *
     * @param projectTechnicalProcess 审批状态流
     * @return 结果
     */
    int updateProjectTechnicalProcess(ProjectTechnicalProcess projectTechnicalProcess);

    /**
     * 批量删除审批状态流
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteProjectTechnicalProcessByIds(String[] ids);

    /**
     * 删除审批状态流信息
     *
     * @param id 审批状态流ID
     * @return 结果
     */
    int deleteProjectTechnicalProcessById(Long id);

}
