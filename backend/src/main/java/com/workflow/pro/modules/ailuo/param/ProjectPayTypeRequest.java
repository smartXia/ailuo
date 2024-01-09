package com.workflow.pro.modules.ailuo.param;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.workflow.pro.common.web.base.page.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
/**
 * 付款方式Request参数请求接口
 *
 * @author some
 * @date 2024-01-09
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class ProjectPayTypeRequest  extends PageRequest  {

    private int id;


    /** 名称 */
                                            private String name;

            /** 类型 */
                                            private String type;

            /** 删除表示(0:No,1:Yes) */
                                            private Integer deleted;

                        }