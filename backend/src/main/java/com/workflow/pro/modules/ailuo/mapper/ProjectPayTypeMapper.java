package com.workflow.pro.modules.ailuo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.workflow.pro.modules.ailuo.param.ProjectPayTypeRequest;
import com.workflow.pro.modules.ailuo.domain.ProjectPayType;
import org.apache.ibatis.annotations.Param;

import java.util.List;



/**
 * 付款方式Mapper接口
 *
 * @author some
 * @date 2024-01-09
 */
@Mapper
public interface ProjectPayTypeMapper extends BaseMapper<ProjectPayType> {
    /**
     * 查询付款方式
     *
     * @param id 付款方式ID
     * @return 付款方式
     */
        ProjectPayType selectProjectPayTypeById(Long id);

    /**
     * 查询付款方式列表
     *

     * @return 付款方式集合
     */
    List<ProjectPayType> list(@Param("request") ProjectPayTypeRequest request);

    /**
     * 查询付款方式分頁列表
     *

     * @return 付款方式集合
     */
    List<ProjectPayType> selectProjectPayTypeList(@Param("request") ProjectPayTypeRequest request);


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
     * 删除付款方式
     *
     * @param id 付款方式ID
     * @return 结果
     */
    int deleteProjectPayTypeById(Long id);

    /**
     * 批量删除付款方式
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteProjectPayTypeByIds(String[] ids);

}
