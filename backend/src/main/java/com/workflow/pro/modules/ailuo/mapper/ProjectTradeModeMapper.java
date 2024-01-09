package com.workflow.pro.modules.ailuo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.workflow.pro.modules.ailuo.param.ProjectTradeModeRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectTradeMode;
import org.apache.ibatis.annotations.Param;

import java.util.List;



/**
 * 付款方式Mapper接口
 *
 * @author some
 * @date 2024-01-09
 */
@Mapper
public interface ProjectTradeModeMapper extends BaseMapper<ProjectTradeMode> {
    /**
     * 查询付款方式
     *
     * @param id 付款方式ID
     * @return 付款方式
     */
        ProjectTradeMode selectProjectTradeModeById(Long id);

    /**
     * 查询付款方式列表
     *

     * @return 付款方式集合
     */
    List<ProjectTradeMode> list(@Param("request") ProjectTradeModeRequest request);

    /**
     * 查询付款方式分頁列表
     *

     * @return 付款方式集合
     */
    List<ProjectTradeMode> selectProjectTradeModeList(@Param("request") ProjectTradeModeRequest request);


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
     * 删除付款方式
     *
     * @param id 付款方式ID
     * @return 结果
     */
    int deleteProjectTradeModeById(Long id);

    /**
     * 批量删除付款方式
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteProjectTradeModeByIds(String[] ids);

}
