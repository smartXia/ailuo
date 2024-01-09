package com.workflow.pro.modules.ailuo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.common.web.base.page.Pageable;


import com.workflow.pro.modules.ailuo.mapper.ProjectTradeModeMapper;
import com.workflow.pro.modules.ailuo.domain.ProjectTradeMode;
import com.workflow.pro.modules.ailuo.param.ProjectTradeModeRequest;
import com.workflow.pro.modules.ailuo.service.IProjectTradeModeService;


import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;


/**
 * 付款方式ServiceImpl业务层处理
 *
 * @author some
 * @date 2024-01-09
 */
@Service
public class ProjectTradeModeServiceImpl extends ServiceImpl<ProjectTradeModeMapper, ProjectTradeMode> implements IProjectTradeModeService {

    @Resource
    ProjectTradeModeMapper projectTradeModeMapper;

    /**
     * 查询付款方式
     *
     * @param id 付款方式ID
     * @return 付款方式
     */
    @Override
    public ProjectTradeMode selectProjectTradeModeById(Long id) {
        return projectTradeModeMapper.selectProjectTradeModeById(id);
    }

    /**
     * 查询付款方式列表
     * @return 付款方式
     */
    @Override
    public List<ProjectTradeMode> list (ProjectTradeModeRequest request){
        return projectTradeModeMapper.list(request);
    }

    /**
     * 查询付款方式
     * @return 付款方式 分页集合
     * */
    @Override
    public PageResponse<ProjectTradeMode> page(ProjectTradeModeRequest request) {
        return Pageable.of(request, (() -> projectTradeModeMapper.selectProjectTradeModeList(request)));
    }

    /**
     * 新增付款方式
     *
     * @param projectTradeMode 付款方式
     * @return 结果
     */

    @Override
    public int insertProjectTradeMode(ProjectTradeMode projectTradeMode) {
        return projectTradeModeMapper.insertProjectTradeMode(projectTradeMode);
    }

    /**
     * 修改付款方式
     *
     * @param projectTradeMode 付款方式
     * @return 结果
     */
    @Override
    public int updateProjectTradeMode(ProjectTradeMode projectTradeMode) {
        return projectTradeModeMapper.updateProjectTradeMode(projectTradeMode);
    }

    /**
     * 删除付款方式对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteProjectTradeModeByIds(String[] ids) {
        return projectTradeModeMapper.deleteProjectTradeModeByIds(ids);
    }

    /**
     * 删除付款方式信息
     *
     * @param id 付款方式ID
     * @return 结果
     */
    @Override
    public int deleteProjectTradeModeById(Long id) {
        return projectTradeModeMapper.deleteProjectTradeModeById(id);
    }
}
