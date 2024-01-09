package com.workflow.pro.modules.ailuo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.workflow.pro.modules.ailuo.param.ProjectTechnicalProcessRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectTechnicalProcess;
import org.apache.ibatis.annotations.Param;

import java.util.List;



/**
 * 审批状态流Mapper接口
 *
 * @author some
 * @date 2024-01-09
 */
@Mapper
public interface ProjectTechnicalProcessMapper extends BaseMapper<ProjectTechnicalProcess> {
    /**
     * 查询审批状态流
     *
     * @param id 审批状态流ID
     * @return 审批状态流
     */
        ProjectTechnicalProcess selectProjectTechnicalProcessById(Long id);

    /**
     * 查询审批状态流列表
     *

     * @return 审批状态流集合
     */
    List<ProjectTechnicalProcess> list(@Param("request") ProjectTechnicalProcessRequest request);

    /**
     * 查询审批状态流分頁列表
     *

     * @return 审批状态流集合
     */
    List<ProjectTechnicalProcess> selectProjectTechnicalProcessList(@Param("request") ProjectTechnicalProcessRequest request);


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
     * 删除审批状态流
     *
     * @param id 审批状态流ID
     * @return 结果
     */
    int deleteProjectTechnicalProcessById(Long id);

    /**
     * 批量删除审批状态流
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteProjectTechnicalProcessByIds(String[] ids);

}
