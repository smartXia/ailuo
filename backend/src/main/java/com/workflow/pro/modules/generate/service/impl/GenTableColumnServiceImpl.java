package com.workflow.pro.modules.generate.service.impl;

import cn.hutool.core.convert.Convert;
import com.workflow.pro.modules.generate.domain.GenTableColumn;
import com.workflow.pro.modules.generate.repository.GenTableColumnRepository;
import com.workflow.pro.modules.generate.service.IGenTableColumnService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Describe: 业务表字段服务实现
 * Author: 就眠仪式
 * CreateTime: 2019/10/23
 */
@Service
public class GenTableColumnServiceImpl implements IGenTableColumnService {
    @Resource
    private GenTableColumnRepository genTableColumnMapper;

    /**
     * 查询业务字段列表
     *
     * @param genTableColumn 业务字段信息
     * @return 业务字段集合
     */
    @Override
    public List<GenTableColumn> selectGenTableColumnListByTableId(GenTableColumn genTableColumn) {
        return genTableColumnMapper.selectGenTableColumnListByTableId(genTableColumn);
    }

    /**
     * 新增业务字段
     *
     * @param genTableColumn 业务字段信息
     * @return 结果
     */
    @Override
    public int insertGenTableColumn(GenTableColumn genTableColumn) {
        return genTableColumnMapper.insertGenTableColumn(genTableColumn);
    }

    /**
     * 修改业务字段
     *
     * @param genTableColumn 业务字段信息
     * @return 结果
     */
    @Override
    public int updateGenTableColumn(GenTableColumn genTableColumn) {
        return genTableColumnMapper.updateGenTableColumn(genTableColumn);
    }

    /**
     * 删除业务字段对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteGenTableColumnByIds(String ids) {
        return genTableColumnMapper.deleteGenTableColumnByIds(Convert.toStrArray(ids));
    }
}