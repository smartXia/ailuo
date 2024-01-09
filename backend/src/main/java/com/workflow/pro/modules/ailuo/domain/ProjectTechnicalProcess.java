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
 * 审批状态流对象 project_technical_process
 *
 * @author some
 * @date 2024-01-09
 */


@Alias("ProjectTechnicalProcess")
@TableName("project_technical_process")
@EqualsAndHashCode(callSuper = true)
@Data
public class ProjectTechnicalProcess extends BaseDomain    {
private static final long serialVersionUID=1L;

        /** $column.columnComment */
        
                /**  @TableId(value = "id", type = IdType.AUTO)*/
        @TableField(value = "id")
                        private Long id;
        
            /** 名称 */
                                        
                        private String name;
        
            /** 分析结果 */
                                        
                        private String result;
        
            /** 选型分析 */
                                        
                        private String selectionAnalysis;
        
            /** 生产分析 */
                                        
                        private String productionAnalysis;
        
            /** 附件 */
                                        
                        private String attach;
        
            /** 其他评论 */
                                        
                        private String commitMsg;
        
            /** 关联报价 */
                                        
                        private String linkSale;
        
            /** 删除表示(0:No,1:Yes) */
                                        
                        
                                }
