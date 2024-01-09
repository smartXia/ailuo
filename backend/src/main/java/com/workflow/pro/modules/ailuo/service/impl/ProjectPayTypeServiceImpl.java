package com.workflow.pro.modules.ailuo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.common.web.base.page.Pageable;


import com.workflow.pro.modules.ailuo.mapper.ProjectPayTypeMapper;
import com.workflow.pro.modules.ailuo.domain.ProjectPayType;
import com.workflow.pro.modules.ailuo.param.ProjectPayTypeRequest;
import com.workflow.pro.modules.ailuo.service.IProjectPayTypeService;


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
public class ProjectPayTypeServiceImpl extends ServiceImpl<ProjectPayTypeMapper, ProjectPayType> implements IProjectPayTypeService {

    @Resource
    ProjectPayTypeMapper projectPayTypeMapper;

    /**
     * 查询付款方式
     *
     * @param id 付款方式ID
     * @return 付款方式
     */
    @Override
    public ProjectPayType selectProjectPayTypeById(Long id) {
        return projectPayTypeMapper.selectProjectPayTypeById(id);
    }

    /**
     * 查询付款方式列表
     * @return 付款方式
     */
    @Override
    public List<ProjectPayType> list (ProjectPayTypeRequest request){
        return projectPayTypeMapper.list(request);
    }

    /**
     * 查询付款方式
     * @return 付款方式 分页集合
     * */
    @Override
    public PageResponse<ProjectPayType> page(ProjectPayTypeRequest request) {
        return Pageable.of(request, (() -> projectPayTypeMapper.selectProjectPayTypeList(request)));
    }

    /**
     * 新增付款方式
     *
     * @param projectPayType 付款方式
     * @return 结果
     */

    @Override
    public int insertProjectPayType(ProjectPayType projectPayType) {
        return projectPayTypeMapper.insertProjectPayType(projectPayType);
    }

    /**
     * 修改付款方式
     *
     * @param projectPayType 付款方式
     * @return 结果
     */
    @Override
    public int updateProjectPayType(ProjectPayType projectPayType) {
        return projectPayTypeMapper.updateProjectPayType(projectPayType);
    }

    /**
     * 删除付款方式对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteProjectPayTypeByIds(String[] ids) {
        return projectPayTypeMapper.deleteProjectPayTypeByIds(ids);
    }

    /**
     * 删除付款方式信息
     *
     * @param id 付款方式ID
     * @return 结果
     */
    @Override
    public int deleteProjectPayTypeById(Long id) {
        return projectPayTypeMapper.deleteProjectPayTypeById(id);
    }
}
