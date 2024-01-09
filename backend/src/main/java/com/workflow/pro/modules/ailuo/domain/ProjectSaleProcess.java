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
 * 销售报价流程对象 project_sale_process
 *
 * @author some
 * @date 2024-01-09
 */


@Alias("ProjectSaleProcess")
@TableName("project_sale_process")
@EqualsAndHashCode(callSuper = true)
@Data
public class ProjectSaleProcess extends BaseDomain    {
private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    @TableField(value = "id")
    private int id;
        
            /** 名称 */
                                        
                        private String name;
        
            /** 单位联系方式 */
                                        
                        private String phone;
        
            /** 类型 */
                                        
                        private String type;
        
            /** 描述 */
                                        
                        private String desc;
        
            /** 单位 */
                                        
                        private String company;
        
            /** 状态1:未开始 2：处理中 3：技术审核中 4：报价终审中 5：审核完成 6：审核通过 -1：审核不通过 */
                                        
                        private Long status;
        
            /** 图标 */
                                        
                        private String img;
        
            /** 销售经理 */
                                        
                        private String salesManager;
        
            /** 阀门参数 */
                                        
                        private String valveDetail;
        
            /** 产品规格书 */
                                        
                        private String specificationDetail;
        
            /** 其他技术文件 */
                                        
                        private String otherFile;
        
            /** 扭矩/推力 */
                                        
                        private String torqueThrust;
        
            /** 其他技术需求 */
                                        
                        private String otherTechnicalRequirements;
        
            /** 执行机构形式 */
                                        
                        private String mechanismForm;
        
            /** 选型型号 */
                                        
                        private String typeSelection;
        
            /** 货币 */
                                        
                        private String currency;
        
            /** 报价开始时间 */
                                        
                        private String quotationBegin;
        
            /** 报价交期 */
                                        
                        private String quotationEnd;
        
            /** 质保 */
                                        
                        private String qualityTime;
        
            /** 出口项目 */
                                        
                        private String exportItem;
        
            /** 贸易方式 */
                                        
                        private String modeTrade;
        
            /** 关联评审 */
                                        
                        private String relationReview;
        
            /** 关联报价 */
                                        
                        private String relationSale;
        
            /** 支付方式 */
                                        
                        private String payType;
        
            /** 删除表示(0:No,1:Yes) */
                                        
                        
                                }
