package com.workflow.pro.modules.ailuo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.common.web.base.page.Pageable;


import com.workflow.pro.modules.ailuo.mapper.ProjectSaleProcessMapper;
import com.workflow.pro.modules.ailuo.domain.ProjectSaleProcess;
import com.workflow.pro.modules.ailuo.param.ProjectSaleProcessRequest;
import com.workflow.pro.modules.ailuo.service.IProjectSaleProcessService;


import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;


/**
 * 销售报价流程ServiceImpl业务层处理
 *
 * @author some
 * @date 2024-01-09
 */
@Service
public class ProjectSaleProcessServiceImpl extends ServiceImpl<ProjectSaleProcessMapper, ProjectSaleProcess> implements IProjectSaleProcessService {

    @Resource
    ProjectSaleProcessMapper projectSaleProcessMapper;

    /**
     * 查询销售报价流程
     *
     * @param id 销售报价流程ID
     * @return 销售报价流程
     */
    @Override
    public ProjectSaleProcess selectProjectSaleProcessById(Long id) {
        return projectSaleProcessMapper.selectProjectSaleProcessById(id);
    }

    /**
     * 查询销售报价流程列表
     * @return 销售报价流程
     */
    @Override
    public List<ProjectSaleProcess> list (ProjectSaleProcessRequest request){
        return projectSaleProcessMapper.list(request);
    }

    /**
     * 查询销售报价流程
     * @return 销售报价流程 分页集合
     * */
    @Override
    public PageResponse<ProjectSaleProcess> page(ProjectSaleProcessRequest request) {
        return Pageable.of(request, (() -> projectSaleProcessMapper.selectProjectSaleProcessList(request)));
    }

    /**
     * 新增销售报价流程
     *
     * @param projectSaleProcess 销售报价流程
     * @return 结果
     */

    @Override
    public int insertProjectSaleProcess(ProjectSaleProcess projectSaleProcess) {
        return projectSaleProcessMapper.insertProjectSaleProcess(projectSaleProcess);
    }

    /**
     * 修改销售报价流程
     *
     * @param projectSaleProcess 销售报价流程
     * @return 结果
     */
    @Override
    public int updateProjectSaleProcess(ProjectSaleProcess projectSaleProcess) {
        return projectSaleProcessMapper.updateProjectSaleProcess(projectSaleProcess);
    }

    /**
     * 删除销售报价流程对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteProjectSaleProcessByIds(String[] ids) {
        return projectSaleProcessMapper.deleteProjectSaleProcessByIds(ids);
    }

    /**
     * 删除销售报价流程信息
     *
     * @param id 销售报价流程ID
     * @return 结果
     */
    @Override
    public int deleteProjectSaleProcessById(Long id) {
        return projectSaleProcessMapper.deleteProjectSaleProcessById(id);
    }
}
