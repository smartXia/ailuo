-- Adminer 4.8.1 MySQL 5.7.38 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `project_approve`;
CREATE TABLE `project_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `relation_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '关联审批人',
  `carbon_user_id` int(11) NOT NULL COMMENT '抄送人',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `project_approve_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project_sale_process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='审批表';


DROP TABLE IF EXISTS `project_return_reason`;
CREATE TABLE `project_return_reason` (
  `id` char(20)  COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `name` varchar(100) DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='审批打回原因表';


DROP TABLE IF EXISTS `project_sale`;
CREATE TABLE `project_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '评审名',
  `trun_tiem` int(11) NOT NULL COMMENT '报价轮数',
  `sale_user` int(11) NOT NULL COMMENT '报价人',
  `project_id` int(11) NOT NULL COMMENT '项目id',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `project_sale_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project_sale_process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='项目报价';


DROP TABLE IF EXISTS `project_sale_process`;
CREATE TABLE `project_sale_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位联系方式',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位',
  `status` int(11) NOT NULL COMMENT '状态1:未开始 2：处理中 3：技术审核中 4：报价终审中 5：审核完成 6：审核通过 -1：审核不通过',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `sales_manager` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '销售经理',
  `valve_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阀门参数',
  `specification_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品规格书',
  `other_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他技术文件',
  `torque_thrust` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扭矩/推力',
  `other_technical_requirements` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他技术需求',
  `mechanism_form` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行机构形式',
  `type_selection` text COLLATE utf8mb4_unicode_ci COMMENT '选型型号',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '货币',
  `quotation_begin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报价开始时间',
  `quotation_end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报价交期',
  `quality_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '质保',
  `export_item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出口项目',
  `mode_trade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '贸易方式',
  `relation_review` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联评审',
  `relation_sale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联报价',
  `pay_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售报价流程';


DROP TABLE IF EXISTS `project_technical_process`;
CREATE TABLE `project_technical_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `result` varchar(255) NOT NULL COMMENT '分析结果',
  `selection_analysis` varchar(255) NOT NULL COMMENT '选型分析',
  `production_analysis` varchar(255) NOT NULL COMMENT '生产分析',
  `attach` varchar(255) NOT NULL COMMENT '附件',
  `commit_msg` varchar(255) NOT NULL COMMENT '其他评论',
  `link_sale` varchar(255) NOT NULL COMMENT '关联报价',
  `deleted` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审批状态流';





DROP TABLE IF EXISTS `project_pay_type`;
CREATE TABLE `project_pay_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `type` varchar(255) NOT NULL COMMENT '类型',


  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='付款方式';

DROP TABLE IF EXISTS `project_trade_mode`;
CREATE TABLE `project_trade_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `type` varchar(255) NOT NULL COMMENT '类型',


  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255)  COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='贸易方式';



-- 2023-12-25 08:17:26