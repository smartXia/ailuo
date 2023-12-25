package com.workflow.pro.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.workflow.pro.modules.sys.domain.SysDept;
import me.chanjar.weixin.cp.bean.WxCpDepart;

import java.util.List;

public interface SysDeptService extends IService<SysDept> {

    /**
     * 查询部门列表
     * */
    List<SysDept> tree();

    /**
     * 根据 parent 查询部门列表
     *
     * @param parent 父级编号
     * */
    List<SysDept> treeAndChildren(String parent);

    void syncDepartInfo(List<WxCpDepart> Departs);

}
