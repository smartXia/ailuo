package com.workflow.pro.modules.ailuo.domain;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;

import lombok.Data;
import com.workflow.pro.common.web.base.domain.BaseDomain;
import com.baomidou.mybatisplus.annotation.TableName;
import org.apache.ibatis.type.Alias;
import lombok.EqualsAndHashCode;
import java.util.Date;

/**
 * 付款方式对象 project_trade_mode
 *
 * @author some
 * @date 2024-01-09
 */


@Alias("ProjectTradeMode")
@TableName("project_trade_mode")
@EqualsAndHashCode(callSuper = true)
@Data
public class ProjectTradeMode extends BaseDomain    {
private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    @TableField(value = "id")
    private int id;


    /** 名称 */
                                        
                        private String name;
        
            /** 类型 */
                                        
                        private String type;
        
            /** 删除表示(0:No,1:Yes) */
                                        
                        
                                }
