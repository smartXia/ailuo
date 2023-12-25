package com.workflow.pro.modules.apitable.param;

import com.workflow.pro.common.web.base.page.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
/**
 * 格组件Request参数请求接口
 *
 * @author some
 * @date 2023-05-22
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class ApitableComponentRequest  extends PageRequest  {

        /** Primary key */
            private String id;

            /** 名称 */
                                            private String name;

            /** 英文名 */
                                            private String nameEn;

            /** 组件内容 */
                                            private String content;

            /** 工作空间 */
                                            private String spaceId;

            /** 版本号 */
                                            private Long revision;

            /** 排序 */
                                            private Long sort;

            /** 删除表示(0:No,1:Yes) */
                                            private Integer deleted;

                                /** 租户编号 */
                                            private String tenantId;

    }