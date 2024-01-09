package com.workflow.pro.modules.ailuo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.common.web.base.page.Pageable;


import com.workflow.pro.modules.ailuo.mapper.ProjectTechnicalProcessMapper;
import com.workflow.pro.modules.ailuo.domain.ProjectTechnicalProcess;
import com.workflow.pro.modules.ailuo.param.ProjectTechnicalProcessRequest;
import com.workflow.pro.modules.ailuo.service.IProjectTechnicalProcessService;


import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;


/**
 * 审批状态流ServiceImpl业务层处理
 *
 * @author some
 * @date 2024-01-09
 */
@Service
public class ProjectTechnicalProcessServiceImpl extends ServiceImpl<ProjectTechnicalProcessMapper, ProjectTechnicalProcess> implements IProjectTechnicalProcessService {

    @Resource
    ProjectTechnicalProcessMapper projectTechnicalProcessMapper;

    /**
     * 查询审批状态流
     *
     * @param id 审批状态流ID
     * @return 审批状态流
     */
    @Override
    public ProjectTechnicalProcess selectProjectTechnicalProcessById(Long id) {
        return projectTechnicalProcessMapper.selectProjectTechnicalProcessById(id);
    }

    /**
     * 查询审批状态流列表
     * @return 审批状态流
     */
    @Override
    public List<ProjectTechnicalProcess> list (ProjectTechnicalProcessRequest request){
        return projectTechnicalProcessMapper.list(request);
    }

    /**
     * 查询审批状态流
     * @return 审批状态流 分页集合
     * */
    @Override
    public PageResponse<ProjectTechnicalProcess> page(ProjectTechnicalProcessRequest request) {
        return Pageable.of(request, (() -> projectTechnicalProcessMapper.selectProjectTechnicalProcessList(request)));
    }

    /**
     * 新增审批状态流
     *
     * @param projectTechnicalProcess 审批状态流
     * @return 结果
     */

    @Override
    public int insertProjectTechnicalProcess(ProjectTechnicalProcess projectTechnicalProcess) {
        return projectTechnicalProcessMapper.insertProjectTechnicalProcess(projectTechnicalProcess);
    }

    /**
     * 修改审批状态流
     *
     * @param projectTechnicalProcess 审批状态流
     * @return 结果
     */
    @Override
    public int updateProjectTechnicalProcess(ProjectTechnicalProcess projectTechnicalProcess) {
        return projectTechnicalProcessMapper.updateProjectTechnicalProcess(projectTechnicalProcess);
    }

    /**
     * 删除审批状态流对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteProjectTechnicalProcessByIds(String[] ids) {
        return projectTechnicalProcessMapper.deleteProjectTechnicalProcessByIds(ids);
    }

    /**
     * 删除审批状态流信息
     *
     * @param id 审批状态流ID
     * @return 结果
     */
    @Override
    public int deleteProjectTechnicalProcessById(Long id) {
        return projectTechnicalProcessMapper.deleteProjectTechnicalProcessById(id);
    }
}
