package com.workflow.pro.modules.ailuo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.workflow.pro.modules.ailuo.param.ProjectSaleProcessRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectSaleProcess;
import org.apache.ibatis.annotations.Param;

import java.util.List;



/**
 * 销售报价流程Mapper接口
 *
 * @author some
 * @date 2024-01-09
 */
@Mapper
public interface ProjectSaleProcessMapper extends BaseMapper<ProjectSaleProcess> {
    /**
     * 查询销售报价流程
     *
     * @param id 销售报价流程ID
     * @return 销售报价流程
     */
        ProjectSaleProcess selectProjectSaleProcessById(Long id);

    /**
     * 查询销售报价流程列表
     *

     * @return 销售报价流程集合
     */
    List<ProjectSaleProcess> list(@Param("request") ProjectSaleProcessRequest request);

    /**
     * 查询销售报价流程分頁列表
     *

     * @return 销售报价流程集合
     */
    List<ProjectSaleProcess> selectProjectSaleProcessList(@Param("request") ProjectSaleProcessRequest request);


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
     * 删除销售报价流程
     *
     * @param id 销售报价流程ID
     * @return 结果
     */
    int deleteProjectSaleProcessById(Long id);

    /**
     * 批量删除销售报价流程
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteProjectSaleProcessByIds(String[] ids);

}
