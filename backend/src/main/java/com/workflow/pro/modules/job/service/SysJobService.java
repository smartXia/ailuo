package com.workflow.pro.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.workflow.pro.common.web.base.page.PageResponse;
import com.workflow.pro.modules.job.domain.SysJob;
import com.workflow.pro.modules.job.param.SysJobRequest;
import java.util.List;

/**
 * 任务服务接口
 *
 * Author: SOME
 * CreateTime: 2022/04/15
 * */
public interface SysJobService extends IService<SysJob> {

    /**
     * 获取任务列表
     *
     * @param request 查询参数
     * */
    List<SysJob> list(SysJobRequest request);

    /**
     * 获取任务列表 (分页)
     *
     * @param request 查询参数
     * */
    PageResponse<SysJob> page(SysJobRequest request);

    /**
     * 立即执行
     *
     * @param id 任务编号
     * */
    Boolean run(String id);

    /**
     * 恢复任务
     *
     * @param id 任务编号
     * */
    Boolean resume(String id);

    /**
     * 暂定任务
     *
     * @param id 任务编号
     * */
    Boolean pause(String id);
}
