package com.workflow.pro.modules.ailuo.param;

import com.workflow.pro.common.web.base.page.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
/**
 * 审批状态流Request参数请求接口
 *
 * @author some
 * @date 2024-01-09
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class ProjectTechnicalProcessRequest  extends PageRequest  {

        /** $column.columnComment */
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
                                            private Integer deleted;

                        }