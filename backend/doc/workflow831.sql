-- Adminer 4.8.1 MySQL 5.7.38 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `apitable_audit_invite_record`;
CREATE TABLE `apitable_audit_invite_record` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `space_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '空间id',
  `dst_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表格id',
  `inviter` bigint(20) NOT NULL COMMENT '邀请id',
  `accepter` bigint(20) NOT NULL COMMENT '成员id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0: 邮件邀请; 1: 文件导出; 2: 邀请链接',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邀请同意记录表';


DROP TABLE IF EXISTS `apitable_component`;
CREATE TABLE `apitable_component` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary key',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `name_en` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '英文名',
  `content` json DEFAULT NULL COMMENT '组件内容',
  `space_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工作空间',
  `revision` bigint(20) unsigned DEFAULT '0' COMMENT '版本号',
  `sort` int(11) unsigned DEFAULT NULL COMMENT '排序',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_dst_id` (`name`) USING BTREE,
  KEY `IX_Space_Id` (`space_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='表格组件';


DROP TABLE IF EXISTS `apitable_datasheet`;
CREATE TABLE `apitable_datasheet` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary key',
  `dst_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Custom ID',
  `node_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节点id',
  `dst_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格名',
  `space_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工作空间',
  `revision` bigint(20) unsigned DEFAULT '0' COMMENT '版本号',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '归档(0:No,1:Yes)',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '开启(0:No,1:Yes)',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_dst_id` (`dst_id`) USING BTREE,
  KEY `IX_Space_Id` (`space_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据表格';


DROP TABLE IF EXISTS `apitable_datasheet_changeset`;
CREATE TABLE `apitable_datasheet_changeset` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary key',
  `message_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息id',
  `dst_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '成员id',
  `operations` longtext COLLATE utf8mb4_unicode_ci COMMENT '操作动作集合',
  `revision` bigint(20) unsigned DEFAULT '0' COMMENT '版本号',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_dst_message_id` (`dst_id`,`message_id`) USING BTREE,
  UNIQUE KEY `uk_dst_revision` (`dst_id`,`revision`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='变更集收集表';


DROP TABLE IF EXISTS `apitable_datasheet_meta`;
CREATE TABLE `apitable_datasheet_meta` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary key',
  `dst_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格id',
  `meta_data` json DEFAULT NULL COMMENT '元数据',
  `revision` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `update_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IX_Dst_id` (`dst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据表元数据表';


DROP TABLE IF EXISTS `apitable_datasheet_record`;
CREATE TABLE `apitable_datasheet_record` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary key',
  `record_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作id',
  `dst_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格id',
  `data` json DEFAULT NULL COMMENT '一行记录数据(对应于每个字段)',
  `revision_history` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '版本历史',
  `revision` bigint(20) unsigned DEFAULT '0' COMMENT '版本号',
  `field_updated_info` json DEFAULT NULL COMMENT '字段更新信息',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `update_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_dsId_recordId` (`dst_id`,`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据表单记录';


DROP TABLE IF EXISTS `apitable_datasheet_record_comment`;
CREATE TABLE `apitable_datasheet_record_comment` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pk',
  `dst_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dstID',
  `record_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'RecordID',
  `comment_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'comment_id',
  `comment_msg` json NOT NULL COMMENT 'content',
  `revision` bigint(20) unsigned DEFAULT '0' COMMENT 'revision',
  `is_deleted` tinyint(3) unsigned DEFAULT '0' COMMENT ' (0: No, 1: Yes)',
  `unit_id` bigint(20) DEFAULT NULL COMMENT 'Operation User Unit ID(link#xxxx_unit#id)',
  `created_by` bigint(20) DEFAULT NULL COMMENT 'Creator',
  `updated_by` bigint(20) DEFAULT NULL COMMENT 'Updator',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create Time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_dst_id` (`dst_id`) USING BTREE,
  KEY `idx_record_id` (`record_id`) USING BTREE,
  KEY `idx_comment_id` (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Workbench - Datasheet Record Comment Table';


DROP TABLE IF EXISTS `apitable_developer`;
CREATE TABLE `apitable_developer` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `dst_id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表格id',
  `user_id` char(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `allow_manage` tinyint(3) NOT NULL DEFAULT '0' COMMENT '管理',
  `allow_watch` tinyint(3) DEFAULT '1' COMMENT '查看',
  `allow_edit` tinyint(3) DEFAULT '0' COMMENT '编辑',
  `allow_save` tinyint(3) DEFAULT '0' COMMENT '保存记录',
  `enable` tinyint(3) DEFAULT '0' COMMENT '开启',
  `api_key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开发者平台的唯一令牌',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `update_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_api_key` (`api_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='表格协作者';


DROP TABLE IF EXISTS `apitable_invite_record`;
CREATE TABLE `apitable_invite_record` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `space_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '空间id',
  `dst_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表格id',
  `inviter` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邀请id',
  `accepter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '成员id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0: 邮件邀请; 1: 文件导出; 2: 邀请链接',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `ignore_msg` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否忽略',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更信任',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邀请同意记录表';


DROP TABLE IF EXISTS `apitable_node_share_setting`;
CREATE TABLE `apitable_node_share_setting` (
  `id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `dst_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据id',
  `node_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节点id',
  `view_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视图id',
  `share_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享标识',
  `is_enabled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分享状态 (0: off, 1: on)',
  `allow_save` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '允许保存 (0: No, 1: Yes)',
  `allow_edit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '允许编辑(0: No, 1: Yes)',
  `props` json DEFAULT NULL COMMENT '分享属性',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `update_by` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_node_view_id` (`node_id`,`view_id`) USING BTREE,
  KEY `idx_share_id` (`share_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='表格基础设置表';


DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL COMMENT '应用id',
  `name` varchar(255) NOT NULL COMMENT 'name',
  `secret` varchar(65) NOT NULL COMMENT '应用秘钥',
  `url` varchar(1000) NOT NULL COMMENT '主页url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `app_info` (`id`, `agent_id`, `name`, `secret`, `url`) VALUES
(1,	1000002,	'bageng测试App',	'U2qcsrl-NeYzCgPoyjOEntlGMgBdw71ziTcisVWeZnE',	'http://bageng.art:8081/');

DROP TABLE IF EXISTS `cms_category_user_power`;
CREATE TABLE `cms_category_user_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL COMMENT '用户id',
  `category_id` varchar(50) NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类权限';


DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(100) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `parent_menu_id` varchar(40) DEFAULT NULL COMMENT '父级菜单',
  `parent_menu_name` varchar(255) DEFAULT NULL COMMENT '父级菜单名称',
  `tree_code` varchar(255) DEFAULT NULL COMMENT '树表主键',
  `tree_parent_code` varchar(255) DEFAULT NULL COMMENT '树表父级字段',
  `tree_name` varchar(255) DEFAULT NULL COMMENT '树表父级名称',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `parent_menu_id`, `parent_menu_name`, `tree_code`, `tree_parent_code`, `tree_name`) VALUES
(5,	'apitable_node_share_setting',	'表格基础设置表',	NULL,	NULL,	'ApitableNodeShareSetting',	'crud',	'com.workflow.pro.modules.apitable',	'apitable',	'nodeShareSetting',	'格基础设置',	'some',	'0',	'/',	NULL,	'',	'2023-06-14 14:11:43',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	'cms_category_user_power',	'分类权限',	NULL,	NULL,	'CmsCategoryUserPower',	'crud',	'com.workflow.pro.modules.apitable',	'apitable',	'categoryUserPower',	'分类权限',	'some',	'0',	'/',	NULL,	'',	'2023-07-12 17:33:45',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';


DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `to_user_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `content` longtext,
  `image_url` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_messages_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `product_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_sku_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `product_pic` varchar(1000) DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) DEFAULT '0' COMMENT '是否删除',
  `product_category_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(200) DEFAULT NULL,
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';


DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单id',
  `member_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';


DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单id',
  `order_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `product_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_pic` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(64) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品分类id',
  `promotion_name` varchar(200) DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) DEFAULT '0',
  `gift_growth` int(11) DEFAULT '0',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单中所包含的商品';


DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `order_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单操作历史记录';


DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `order_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单id',
  `company_address_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址表id',
  `product_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单退货申请';


DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `name` varchar(100) DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='退货原因表';


DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary Key',
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单设置表';


DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(190) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(190) DEFAULT NULL,
  `JOB_GROUP` varchar(190) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `qrtz_scheduler_state` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES
('clusteredScheduler',	'DESKTOP-PIR6OQF1620332980122',	1620334804608,	15000);

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`) VALUES
('scheduler',	'1391457610156937218',	'DEFAULT',	'1391457610156937218',	'DEFAULT',	NULL,	1629866750000,	1629866740000,	5,	'ACQUIRED',	'CRON',	1620584320000,	0,	NULL,	2,	'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0+com.pearadmin.pro.modules.job.domain.SysJob�ǰ���\0L\0beanNamet\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0enablet\0Ljava/lang/Boolean;L\0idq\0~\0	L\0nameq\0~\0	L\0paramq\0~\0	xr\03com.pearadmin.pro.common.web.base.domain.BaseDomain��]u��\0Z\0deletedL\0createByq\0~\0	L\0\ncreateTimet\0Ljava/time/LocalDateTime;L\0remarkq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xp\0t\01sr\0\rjava.time.Ser�]��\"H�\0\0xpw\n\0\0�\n�xt\0任务描述t\01sq\0~\0w\n\0\0�6�xt\0failuret\00/10 * * * * ?sr\0java.lang.Boolean� r�՜��\0Z\0valuexpt\01391457610156937218t\0异常任务px\0'),
('scheduler',	'1422975874129162242',	'DEFAULT',	'1422975874129162242',	'DEFAULT',	NULL,	1629866750000,	1629866740000,	5,	'WAITING',	'CRON',	1628098860000,	0,	NULL,	2,	'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0+com.pearadmin.pro.modules.job.domain.SysJob�ǰ���\0L\0beanNamet\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0enablet\0Ljava/lang/Boolean;L\0idq\0~\0	L\0nameq\0~\0	L\0paramq\0~\0	xr\03com.pearadmin.pro.common.web.base.domain.BaseDomain��]u��\0Z\0deletedL\0createByq\0~\0	L\0\ncreateTimet\0Ljava/time/LocalDateTime;L\0remarkq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xp\0t\01sr\0\rjava.time.Ser�]��\"H�\0\0xpw\n\0\0�)�xt\0任务描述t\01sq\0~\0w\n\0\0�)�xt\0simplet\00/10 * * * * ?sr\0java.lang.Boolean� r�՜��\0Z\0valuexpt\01422975874129162242t\0简单任务px\0');

DROP TABLE IF EXISTS `README`;
CREATE TABLE `README` (
  `id` int(11) NOT NULL,
  `Message` text,
  `Bitcoin_Address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `README` (`id`, `Message`, `Bitcoin_Address`) VALUES
(1,	'I have backed up all your databases. To recover them you must pay 0.0155 Bitcoin to this address: 1DrdGN589vwPBGkduB8gvT1cr5rn7bYpy2. Backup list: answer, cms-admin-pro, cpdb_admin, gva, hotel, pear-admin-boot, pear-admin-hotel, pear-admin-pro, temp, workflow. After your payment email me at rdatabase.2104@onionmail.org with your server IP (139.9.124.253) and transaction ID. Emails without transaction ID will be ignored. ',	'1DrdGN589vwPBGkduB8gvT1cr5rn7bYpy2');

DROP TABLE IF EXISTS `sys_activity`;
CREATE TABLE `sys_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `img` varchar(1000) DEFAULT NULL COMMENT '图片',
  `banner_img` varchar(1000) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COMMENT '内容',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `url` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动url',
  `send` varchar(50) CHARACTER SET utf8 DEFAULT '0' COMMENT '是否发送',
  `begin_time` varchar(200) DEFAULT NULL,
  `end_time` varchar(200) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL COMMENT '是否删除',
  `create_by` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sys_activity` (`id`, `name`, `img`, `banner_img`, `content`, `remark`, `url`, `send`, `begin_time`, `end_time`, `deleted`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(5,	'测试活动',	'https://s2-cdn.oneitfarm.com/1667821281026-截屏2022-09-13_18.04.24@3x.png',	'https://s2-cdn.oneitfarm.com/1667824601349-Shot1@3x.png',	'马斯克，一个掌握了当代流量密码的企业家与商人。近半年间，因为发胖、生娃、人口、火星、新能源汽车、脑机接口、人才管理、收购 Twitter 等关键词，荣登 47 次热搜，成为科技圈名副其实的“顶流”人物。\n\n论马斯克为什么如此备受关注，实则也离不开其一手建立的商业帝国。近日，据外媒 CNBC 披露，面对庞大的商业版图，仅在特斯拉业务方面，马斯克背后有一个超过 20 人的团队成为了其“左膀”与“右臂”。这也让外界颇为好奇，他们都是谁？接下来，我们不妨一起来看一下。',	'测试活动',	NULL,	'1',	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-11-01 12:06:15',	NULL,	'2022-11-07 12:37:08');

DROP TABLE IF EXISTS `sys_activity_user`;
CREATE TABLE `sys_activity_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(40) DEFAULT NULL COMMENT '用户名',
  `user_image` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `activity_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `activity_name` varchar(500) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT NULL COMMENT '是否删除',
  `create_by` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sys_activity_user` (`id`, `user_id`, `user_name`, `user_image`, `activity_id`, `activity_name`, `remark`, `deleted`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(1860,	'Some',	NULL,	'https://portrait.gitee.com/uploads/avatars/user/2813/8441097_shaynas_1610801433.png',	'26',	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-11-02 09:48:06',	NULL,	'2022-11-02 09:48:06'),
(1861,	'alex',	NULL,	'https://portrait.gitee.com/uploads/avatars/user/2813/8441097_shaynas_1610801433.png',	'5',	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-11-07 15:20:40',	NULL,	'2022-11-07 15:20:40'),
(1862,	'akiraXue',	NULL,	'https://portrait.gitee.com/uploads/avatars/user/2813/8441097_shaynas_1610801433.png',	'5',	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-11-08 07:08:47',	NULL,	'2022-11-08 07:08:47'),
(1863,	'Some',	NULL,	'https://portrait.gitee.com/uploads/avatars/user/2813/8441097_shaynas_1610801433.png',	'5',	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-11-08 07:15:48',	NULL,	'2022-11-08 07:15:48');

DROP TABLE IF EXISTS `sys_announce`;
CREATE TABLE `sys_announce` (
  `id` char(19) NOT NULL COMMENT '编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `create_by` char(19) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(19) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `state` bit(1) DEFAULT NULL COMMENT '状态',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_announce` (`id`, `title`, `content`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `deleted`, `state`, `tenant_id`) VALUES
('1392402230634274818',	'公告标题',	'公告内容...',	'1',	'2021-05-12 16:52:16',	'1',	'2021-05-13 16:58:36',	NULL,	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0,	'1'),
('1392403356330942465',	'公告标题',	'公告内容...',	'1',	'2021-05-12 16:56:44',	'1',	'2021-05-13 16:58:39',	NULL,	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0,	'1'),
('1392403418100457473',	'公告标题',	'公告内容...',	'1',	'2021-05-12 16:56:59',	'1',	'2021-05-13 16:58:43',	NULL,	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0,	'1'),
('1392403664276742145',	'公告标题',	'公告内容...',	'1',	'2021-05-12 16:57:58',	'1',	'2021-05-13 16:58:46',	NULL,	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0,	'1'),
('1392403704172961793',	'公告标题',	'公告内容...',	'1',	'2021-05-12 16:58:07',	'1',	'2021-05-13 16:58:50',	NULL,	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0,	'1'),
('1392729157282795521',	'公告标题',	'公告内容...',	'1',	'2021-05-13 14:31:21',	'1',	'2021-05-13 16:58:58',	NULL,	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0,	'1'),
('1392729220209938434',	'公告标题',	'公告内容...',	'1',	'2021-05-13 14:31:36',	'1',	'2021-05-13 16:59:02',	NULL,	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0,	'1'),
('1572940073112002562',	'1',	'1',	'1',	'2022-09-22 13:25:12',	'1',	'2022-09-22 13:25:12',	NULL,	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0,	NULL);

DROP TABLE IF EXISTS `sys_announce_user`;
CREATE TABLE `sys_announce_user` (
  `id` char(19) NOT NULL COMMENT '编号',
  `announce_id` char(19) DEFAULT NULL COMMENT '公告编号',
  `user_id` char(19) DEFAULT NULL COMMENT '用户编号',
  `is_read` bit(1) DEFAULT NULL COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `id` char(20) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `captcha` varchar(255) NOT NULL DEFAULT '' COMMENT '验证码',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '验证类型 0:验证码验证 1:sign验证',
  `validated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '验证结果 0:未验证 1:验证成功 2:验证失败',
  `expired` int(11) NOT NULL DEFAULT '0' COMMENT '过期时长',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '1:Delete，0:Not Deleted',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'Create User',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'Last Update User',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_captcha` (`id`, `email`, `phone`, `captcha`, `type`, `validated`, `expired`, `deleted`, `sort`, `create_by`, `update_by`, `create_time`, `update_time`, `remark`, `tenant_id`) VALUES
('1694970220110364673',	'xiapeifu@gmail.com',	'',	'149523',	0,	0,	5,	0,	NULL,	NULL,	NULL,	'2023-08-25 07:09:26',	'2023-08-25 07:09:26',	NULL,	NULL),
('1696494135173795842',	'835106505@qq.com',	'',	'814213',	0,	0,	5,	0,	NULL,	NULL,	NULL,	'2023-08-29 04:04:56',	'2023-08-29 04:04:56',	NULL,	NULL),
('1696775231807520770',	'cn_jiangyi@163.com',	'',	'167581',	0,	0,	5,	0,	NULL,	NULL,	NULL,	'2023-08-29 22:41:54',	'2023-08-29 22:41:54',	NULL,	NULL);

DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` char(20) NOT NULL COMMENT '配置编号',
  `key` char(40) DEFAULT NULL COMMENT '配置键',
  `name` varchar(40) DEFAULT NULL COMMENT '配置名称',
  `value` varchar(255) DEFAULT NULL COMMENT '配置值',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT NULL COMMENT '删除',
  `enable` bit(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_config` (`id`, `key`, `name`, `value`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `deleted`, `enable`) VALUES
('1',	'web_name',	'网站名称',	'网站名称',	NULL,	'2021-03-02 16:08:19',	NULL,	'2023-08-28 11:21:20',	'https://www.python100.com/html/H23SN1OC362C.html',	CONV('0', 2, 10) + 0,	CONV('1', 2, 10) + 0),
('2',	'web_desc',	'网站描述',	'网站描述',	NULL,	'2021-03-02 16:08:19',	NULL,	'2021-03-02 16:08:19',	'网站描述',	NULL,	CONV('0', 2, 10) + 0),
('3',	'web_auth',	'网站作者',	'网站作者',	NULL,	'2021-03-02 16:08:19',	NULL,	'2021-03-02 16:08:19',	'网站作者',	NULL,	CONV('1', 2, 10) + 0);

DROP TABLE IF EXISTS `sys_data_source`;
CREATE TABLE `sys_data_source` (
  `id` char(20) NOT NULL COMMENT '编号',
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `code` char(20) DEFAULT NULL COMMENT '标识',
  `username` char(40) DEFAULT NULL COMMENT '账户',
  `password` char(40) DEFAULT NULL COMMENT '密码',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `driver` char(50) DEFAULT NULL COMMENT '驱动',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `enable` bit(1) DEFAULT NULL COMMENT '是否启用',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(201) NOT NULL COMMENT '编号',
  `name` char(20) DEFAULT NULL COMMENT '部门名称',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `enable` bit(1) DEFAULT NULL COMMENT '状态',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `parent` char(20) DEFAULT NULL COMMENT '父级部门',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_dept` (`id`, `name`, `address`, `enable`, `sort`, `parent`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `tenant_id`) VALUES
('1',	'上海八耕文化传媒有限公司',	'Shang Hai',	CONV('1', 2, 10) + 0,	100000000,	'0',	'1',	'2022-09-07 17:07:11',	NULL,	'2022-09-07 17:07:11',	CONV('0', 2, 10) + 0,	NULL,	'1'),
('1676119681516285954',	'1',	'1',	CONV('1', 2, 10) + 0,	0,	'1',	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	NULL),
('2',	'开发部',	'Shang Hai',	CONV('1', 2, 10) + 0,	100000000,	'1',	'1',	'2022-09-07 17:07:11',	NULL,	'2022-09-07 17:07:11',	CONV('0', 2, 10) + 0,	NULL,	'1'),
('3',	'设计部门',	'Shang Hai',	CONV('1', 2, 10) + 0,	99999000,	'1',	'1',	'2022-09-07 17:07:11',	NULL,	'2022-09-07 17:07:11',	CONV('0', 2, 10) + 0,	NULL,	'1'),
('4',	'研发一部',	'Shang Hai',	CONV('1', 2, 10) + 0,	100000000,	'2',	'1',	'2022-09-07 17:07:11',	NULL,	'2022-09-07 17:07:11',	CONV('0', 2, 10) + 0,	NULL,	'1'),
('5',	'研发二部',	'Shang Hai',	CONV('1', 2, 10) + 0,	99999000,	'2',	'1',	'2022-09-07 17:07:11',	NULL,	'2022-09-07 17:07:11',	CONV('0', 2, 10) + 0,	NULL,	'1'),
('6',	'产品研发一部',	'Shang Hai',	CONV('1', 2, 10) + 0,	100000000,	'4',	'1',	'2022-09-07 17:07:11',	NULL,	'2022-09-07 17:07:11',	CONV('0', 2, 10) + 0,	NULL,	'1'),
('7',	'java后端研发部门一部',	'Shang Hai',	CONV('1', 2, 10) + 0,	100000000,	'5',	'1',	'2022-09-07 17:07:11',	NULL,	'2022-09-07 17:07:11',	CONV('0', 2, 10) + 0,	NULL,	'1'),
('8',	'服务方',	'Shang Hai',	CONV('1', 2, 10) + 0,	99998000,	'1',	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'1');

DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` char(20) NOT NULL COMMENT '编号',
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `code` char(20) DEFAULT NULL COMMENT '标识',
  `enable` bit(1) NOT NULL COMMENT '状态',
  `create_by` char(20) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(1) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_dict` (`id`, `name`, `code`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `sort`) VALUES
('1',	'性别',	'sex',	CONV('1', 2, 10) + 0,	'1',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('2',	'状态',	'enable',	CONV('1', 2, 10) + 0,	'1',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `id` char(20) NOT NULL COMMENT '编号',
  `label` char(20) DEFAULT NULL COMMENT '标签',
  `value` char(20) DEFAULT NULL COMMENT '值',
  `enable` bit(1) DEFAULT NULL COMMENT '状态',
  `code` char(20) DEFAULT NULL COMMENT '标识',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_dict_data` (`id`, `label`, `value`, `enable`, `code`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `sort`) VALUES
('1',	'男',	'0',	CONV('1', 2, 10) + 0,	'sex',	'1',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('1390004614516674561',	'女',	'1',	CONV('1', 2, 10) + 0,	'sex',	'1',	'2021-05-06 02:05:00',	'1',	'2021-05-06 02:05:00',	CONV('0', 2, 10) + 0,	NULL,	0),
('3',	'开启',	'yes',	CONV('1', 2, 10) + 0,	'enable',	'1',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('4',	'禁用',	'no',	CONV('1', 2, 10) + 0,	'enable',	'1',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `sys_inbox`;
CREATE TABLE `sys_inbox` (
  `id` char(19) NOT NULL COMMENT '编号',
  `dialogue_id` char(19) NOT NULL COMMENT '对话编号',
  `recipient_id` char(19) DEFAULT NULL COMMENT '接受者',
  `content` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `is_read` bit(1) DEFAULT NULL COMMENT '是否阅读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `create_by` char(1) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(1) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_inbox` (`id`, `dialogue_id`, `recipient_id`, `content`, `is_read`, `read_time`, `send_time`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `deleted`, `tenant_id`) VALUES
('1392950791973285891',	'1392950791973285890',	'1',	'私信内容',	NULL,	NULL,	NULL,	'1',	'2021-05-14 05:12:03',	'1',	'2021-07-19 16:07:51',	NULL,	CONV('0', 2, 10) + 0,	'1');

DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `bean_name` char(40) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `cron_expression` char(100) DEFAULT NULL,
  `enable` bit(1) DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` char(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `id` char(20) NOT NULL,
  `job_id` char(20) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` char(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` char(20) NOT NULL COMMENT '编号',
  `title` char(30) DEFAULT NULL COMMENT '标题',
  `describe` varchar(50) DEFAULT NULL COMMENT '描述',
  `operator` char(20) DEFAULT NULL COMMENT '操作人',
  `address` char(40) DEFAULT NULL COMMENT '操作地址',
  `action` char(10) DEFAULT NULL COMMENT '操作',
  `browser` char(20) DEFAULT NULL COMMENT '浏览器',
  `method` text COMMENT '方法',
  `url` varchar(50) DEFAULT NULL COMMENT '路径',
  `type` char(10) DEFAULT NULL COMMENT '请求方式',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `result` text COMMENT '返回值',
  `state` bit(1) DEFAULT NULL COMMENT '结果',
  `error` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除 0 存在 , 1 删除',
  `system` char(200) DEFAULT NULL COMMENT '访问来源',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` char(20) NOT NULL COMMENT '编号',
  `name` char(50) DEFAULT NULL COMMENT '名称',
  `location` varchar(255) DEFAULT NULL COMMENT '路径',
  `path` varchar(255) DEFAULT NULL COMMENT '存储方式',
  `size` int(11) DEFAULT NULL COMMENT '大小',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `suffix` char(50) DEFAULT NULL COMMENT '后缀',
  `bucket` char(50) DEFAULT NULL COMMENT '桶',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `id` char(20) NOT NULL COMMENT '编号',
  `name` char(20) DEFAULT NULL COMMENT '岗位名称',
  `code` char(20) DEFAULT NULL COMMENT '岗位标识',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `enable` bit(1) DEFAULT NULL COMMENT '启用',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_post` (`id`, `name`, `code`, `sort`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `tenant_id`) VALUES
('1388197937639247873',	'部门经理',	'123',	0,	CONV('1', 2, 10) + 0,	'1',	'2021-05-01 02:25:54',	'1',	'2021-07-26 15:38:59',	CONV('0', 2, 10) + 0,	'岗位描述',	'1'),
('1388198092773969922',	'开发经理',	'123',	0,	CONV('1', 2, 10) + 0,	'1',	'2021-05-01 02:26:31',	NULL,	NULL,	CONV('0', 2, 10) + 0,	'岗位描述',	'1'),
('1663413887326875649',	'1',	'1',	11,	CONV('1', 2, 10) + 0,	NULL,	'2023-05-30 05:15:50',	NULL,	'2023-05-30 05:15:50',	CONV('0', 2, 10) + 0,	NULL,	NULL);

DROP TABLE IF EXISTS `sys_power`;
CREATE TABLE `sys_power` (
  `id` char(20) NOT NULL COMMENT '编号',
  `parent` char(20) DEFAULT NULL COMMENT '父级',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径',
  `component` varchar(255) DEFAULT NULL COMMENT '路由名称',
  `type` char(20) DEFAULT NULL COMMENT '权限类型',
  `icon` char(20) DEFAULT NULL COMMENT '图标',
  `title` char(20) DEFAULT NULL COMMENT '权限名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `link` varchar(20) DEFAULT NULL COMMENT '外链',
  `enable` bit(1) DEFAULT NULL COMMENT '状态',
  `i18n` char(40) DEFAULT NULL COMMENT '国际化',
  `code` char(20) DEFAULT NULL COMMENT '权限标识',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_power` (`id`, `parent`, `path`, `component`, `type`, `icon`, `title`, `sort`, `link`, `enable`, `i18n`, `code`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`) VALUES
('1',	'0',	'/dashboard',	'dashboard',	'0',	'DashboardOutlined',	'工作空间',	-1,	NULL,	CONV('1', 2, 10) + 0,	'dashboard',	NULL,	NULL,	NULL,	'1',	'2021-07-24 00:09:59',	CONV('0', 2, 10) + 0,	NULL),
('10',	'7',	'/system/power',	'power',	'1',	'DashboardOutlined',	'权限管理',	0,	NULL,	CONV('1', 2, 10) + 0,	'system-power',	NULL,	NULL,	NULL,	'1',	'2021-07-22 14:29:07',	CONV('0', 2, 10) + 0,	NULL),
('11',	'18',	'/develop/doc',	'doc',	'1',	'DashboardOutlined',	'接口文档',	1,	NULL,	CONV('1', 2, 10) + 0,	'monitor-doc',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('12',	'18',	'/develop/config',	'config',	'1',	'DashboardOutlined',	'配置管理',	1,	NULL,	CONV('1', 2, 10) + 0,	'system-config',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('13',	'18',	'/develop/dict',	'dict',	'1',	'DashboardOutlined',	'数据字典',	1,	NULL,	CONV('1', 2, 10) + 0,	'system-dict',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('14',	'4',	'/monitor/redis',	'redis',	'1',	'DashboardOutlined',	'缓存监控',	1,	NULL,	CONV('1', 2, 10) + 0,	'monitor-redis',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('1417039011644137473',	'10',	NULL,	NULL,	'2',	NULL,	'新增权限',	0,	NULL,	CONV('1', 2, 10) + 0,	'sys-power-save',	'sys:power:save',	'1',	'2021-07-19 16:30:02',	'1',	'2021-07-19 16:30:56',	CONV('0', 2, 10) + 0,	NULL),
('1417039162970431489',	'10',	NULL,	NULL,	'2',	NULL,	'修改权限',	0,	NULL,	CONV('1', 2, 10) + 0,	'sys-power-edit',	'sys:power:edit',	'1',	'2021-07-19 16:30:38',	'1',	'2021-07-19 16:30:38',	CONV('0', 2, 10) + 0,	NULL),
('1417044703532769282',	'10',	NULL,	NULL,	'2',	NULL,	'查看权限',	0,	NULL,	CONV('1', 2, 10) + 0,	'sys-power-info',	'sys:power:info',	'1',	'2021-07-19 16:52:39',	'1',	'2021-07-19 16:52:39',	CONV('0', 2, 10) + 0,	NULL),
('1417044875528593409',	'10',	NULL,	NULL,	'2',	NULL,	'删除权限',	0,	NULL,	CONV('1', 2, 10) + 0,	'sys-power-remove',	'sys:power:remove',	'1',	'2021-07-19 16:53:20',	'1',	'2021-07-19 16:53:20',	CONV('0', 2, 10) + 0,	NULL),
('1421947314073481217',	'7',	'/system/tenant',	'tenant',	'1',	NULL,	'租户管理',	0,	NULL,	CONV('1', 2, 10) + 0,	'system-tenant',	NULL,	'1417321936109387778',	'2021-08-02 05:33:53',	'1417321936109387778',	'2021-08-02 05:58:20',	CONV('0', 2, 10) + 0,	NULL),
('1427568430800408578',	'18',	'/develop/sms',	'sms',	'1',	NULL,	'短信发送',	0,	NULL,	CONV('1', 2, 10) + 0,	'develop-sms',	NULL,	'1',	'2021-08-17 17:50:11',	'1',	'2021-08-17 17:50:29',	CONV('0', 2, 10) + 0,	NULL),
('15',	'7',	'/system/post',	'post',	'1',	'DashboardOutlined',	'岗位管理',	1,	NULL,	CONV('1', 2, 10) + 0,	'system-post',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('1584787892747743233',	'18',	'/develop/qywx',	'qywx',	'1',	NULL,	'企业微信',	10000,	NULL,	CONV('1', 2, 10) + 0,	'develop-qywx',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1584794956811317250',	'18',	'/develop/qywx-app',	'qywx-app',	'1',	NULL,	'微信应用',	9999,	NULL,	CONV('1', 2, 10) + 0,	'develop-qywx-app',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('16',	'4',	'/monitor/log-oper',	'log-oper',	'1',	'DashboardOutlined',	'操作日志',	1,	NULL,	CONV('1', 2, 10) + 0,	'monitor-log-oper',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('1650082424258555905',	'18',	'/develop/generate',	'generate',	'1',	NULL,	'代码生成',	0,	NULL,	CONV('1', 2, 10) + 0,	'develop-generate',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1650783393480962050',	'0',	'/apitable',	'apitable',	'0',	'DashboardOutlined',	'多维表格',	0,	NULL,	CONV('1', 2, 10) + 0,	'apitable',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1660468667529953282',	'1650783393480962050',	'/apitable/datasheet',	'apitable-datasheet',	'1',	'DashboardOutlined',	'数据表',	0,	NULL,	CONV('1', 2, 10) + 0,	'apitable-datasheet',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1660478160078766081',	'1650783393480962050',	'/apitable/datasheetmeta',	'apitable-datasheet-meta',	'1',	'DashboardOutlined',	'数据表列数据',	1,	NULL,	CONV('1', 2, 10) + 0,	'apitable-datasheet-meta',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1660479585911439361',	'1650783393480962050',	'/apitable/datasheetrecord',	'apitable-datasheet-record',	'0',	'DashboardOutlined',	'数据表单存储记录',	1,	NULL,	CONV('1', 2, 10) + 0,	'apitable-datasheet-record',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1660480148992557057',	'1650783393480962050',	'/apitable/inviterecord',	'apitable-invite-record',	'0',	'DashboardOutlined',	'表格邀请记录',	3,	NULL,	CONV('1', 2, 10) + 0,	'apitable-invite-record',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1660480318903812098',	'1650783393480962050',	'/apitable/developer',	'apitable-developer',	'0',	'DashboardOutlined',	'表格开发者',	4,	NULL,	CONV('1', 2, 10) + 0,	'apitable-developer',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1660480512668073986',	'1650783393480962050',	'/apitable/datasheetchangeset',	'apitable-datasheet-changeset',	'0',	'DashboardOutlined',	'表格列调整记录',	6,	NULL,	CONV('1', 2, 10) + 0,	'apitable-datasheet-changeset',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1660480841748971521',	'1650783393480962050',	'/apitable/sharesetting',	'apitable-share-setting',	'0',	'DashboardOutlined',	'表格基本设置',	7,	NULL,	CONV('1', 2, 10) + 0,	'apitable-share-setting',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1660523870480478210',	'1650783393480962050',	'/apitable/component',	'apitable-component',	'1',	NULL,	'表格组件',	0,	NULL,	CONV('1', 2, 10) + 0,	'apitable-component',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1661274162943733761',	'18',	'/aliPay',	'aliPay',	'1',	NULL,	'支付宝配置',	10,	NULL,	CONV('1', 2, 10) + 0,	'aliPay',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1661625661011984386',	'18',	'/develop/email-config',	'email-config',	'1',	NULL,	'邮箱配置',	9,	NULL,	CONV('1', 2, 10) + 0,	'email-config',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1663421096265494530',	'18',	'/develop/captcha',	'captcha',	'1',	NULL,	'验证码管理',	11,	NULL,	CONV('1', 2, 10) + 0,	'develop-captcha',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1667095788168269825',	'1650783393480962050',	'/apitable/grade-user',	'apitable-grade',	'0',	NULL,	'会员管理',	8,	NULL,	CONV('1', 2, 10) + 0,	'apitable-grade',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1667099582243393538',	'1667095788168269825',	'/apitable/grade-user',	'grade-user',	'1',	NULL,	'会员列表',	1,	NULL,	CONV('1', 2, 10) + 0,	'grade-user',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1667099833465425922',	'1667095788168269825',	'/apitable/grade-level',	'grade-level',	'1',	NULL,	'会员等级',	0,	NULL,	CONV('1', 2, 10) + 0,	'grade-level',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1667112276283052034',	'1650783393480962050',	'/apitable/pay-manage',	'pay-manage',	'0',	NULL,	'订单管理',	9,	NULL,	CONV('1', 2, 10) + 0,	'pay-manage',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1667112517744939009',	'1667112276283052034',	'/apitable/pay-manage-order',	'pay-manage-order',	'1',	NULL,	'订单列表',	0,	NULL,	CONV('1', 2, 10) + 0,	'pay-manage-order',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1668087078380593153',	'1667112276283052034',	'/apitable/pay-manage-order-return',	'pay-manage-order-return',	'1',	NULL,	'退单申请',	1,	NULL,	CONV('1', 2, 10) + 0,	'pay-manage-order-return',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1686925311825002497',	'0',	NULL,	NULL,	'1',	NULL,	'面试官',	0,	NULL,	CONV('1', 2, 10) + 0,	'face',	NULL,	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('1686926444899450882',	'1686925311825002497',	NULL,	NULL,	'2',	NULL,	'查看',	0,	NULL,	CONV('1', 2, 10) + 0,	'watch',	'watch',	NULL,	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL),
('17',	'4',	'/monitor/log-auth',	'log-auth',	'1',	'DashboardOutlined',	'登录日志',	1,	NULL,	CONV('1', 2, 10) + 0,	'monitor-log-auth',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('18',	'0',	'/develop',	'develop',	'1',	'DashboardOutlined',	'开发工具',	4,	NULL,	CONV('1', 2, 10) + 0,	'develop',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('19',	'18',	'/develop/mail',	'mail',	'1',	'DashboardOutlined',	'发送邮箱',	1,	NULL,	CONV('1', 2, 10) + 0,	'develop-mail',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('2',	'1',	'/dashboard/workspace',	'dashboard-workspace',	'1',	'DashboardOutlined',	'工作台',	1,	NULL,	CONV('1', 2, 10) + 0,	'dashboard-workspace',	NULL,	NULL,	NULL,	'1',	'2021-08-23 23:33:49',	CONV('0', 2, 10) + 0,	NULL),
('20',	'7',	'/system/dept',	'dept',	'1',	'DashboardOutlined',	'部门管理',	1,	NULL,	CONV('1', 2, 10) + 0,	'system-dept',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('23',	'18',	'/develop/oss',	'oss',	'1',	'DashboardOutlined',	'文件列表',	1,	NULL,	CONV('1', 2, 10) + 0,	'develop-oss',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('24',	'18',	'/develop/dataSource',	'dataSource',	'1',	'DashboardOutlined',	'多数据源',	1,	NULL,	CONV('1', 2, 10) + 0,	'develop-source',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('25',	'0',	'/task',	'task',	'0',	'HomeOutlined',	'定时任务',	1,	NULL,	CONV('1', 2, 10) + 0,	'task',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('26',	'25',	'/task/job',	'job',	'1',	'DashboardOutlined',	'任务列表',	1,	NULL,	CONV('1', 2, 10) + 0,	'task-job',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('27',	'25',	'/task/jobLog',	'jobLog',	'1',	'DashboardOutlined',	'任务日志',	1,	NULL,	CONV('1', 2, 10) + 0,	'task-job-log',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('28',	'0',	'/notice',	'notice',	'0',	'HomeOutlined',	'站内消息',	1,	NULL,	CONV('1', 2, 10) + 0,	'notice',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('29',	'28',	'/notice/announce',	'announce',	'1',	'DashboardOutlined',	'通知公告',	1,	NULL,	CONV('1', 2, 10) + 0,	'notice-announce',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('3',	'1',	'/dashboard/console',	'dashboard-console',	'1',	'DashboardOutlined',	'分析页',	0,	NULL,	CONV('1', 2, 10) + 0,	'dashboard-console',	NULL,	NULL,	NULL,	'1',	'2021-08-23 23:33:57',	CONV('0', 2, 10) + 0,	NULL),
('30',	'28',	'/notice/inbox',	'inbox',	'1',	'DashboardOutlined',	'私人消息',	1,	NULL,	CONV('1', 2, 10) + 0,	'notice-inbox',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('4',	'0',	'/monitor',	'monitor',	'0',	'HomeOutlined',	'系统监控',	2,	NULL,	CONV('1', 2, 10) + 0,	'monitor',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('5',	'4',	'/monitor/server',	'server',	'1',	'DashboardOutlined',	'运行环境',	1,	NULL,	CONV('1', 2, 10) + 0,	'monitor-server',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('6',	'4',	'/monitor/online',	'online',	'1',	'DashboardOutlined',	'在线用户',	1,	NULL,	CONV('1', 2, 10) + 0,	'monitor-online',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('7',	'0',	'/system',	'system',	'0',	'HomeOutlined',	'系统管理',	3,	NULL,	CONV('1', 2, 10) + 0,	'system',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('8',	'7',	'/system/user',	'user',	'1',	'DashboardOutlined',	'用户管理',	1,	NULL,	CONV('1', 2, 10) + 0,	'system-user',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
('9',	'7',	'/system/role',	'role',	'1',	'DashboardOutlined',	'角色管理',	1,	NULL,	CONV('1', 2, 10) + 0,	'system-role',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` char(20) NOT NULL COMMENT '角色名',
  `code` char(20) DEFAULT NULL COMMENT '标识',
  `enable` bit(1) DEFAULT NULL COMMENT '是否开启',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT NULL COMMENT '是否删除',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  `scope` char(20) DEFAULT NULL COMMENT '数据权限 1. 全部权限 2. 自定义权限 3. 部门权限 4. 部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_role` (`id`, `name`, `code`, `enable`, `sort`, `remark`, `deleted`, `create_by`, `create_time`, `update_by`, `update_time`, `tenant_id`, `scope`) VALUES
(1,	'超级管理员',	'admin',	CONV('1', 2, 10) + 0,	'2',	'超级管理员描述',	NULL,	NULL,	NULL,	NULL,	NULL,	'1',	'SELF'),
(2,	'普通管理员',	'common',	CONV('1', 2, 10) + 0,	'2',	'普通管理员描述',	CONV('0', 2, 10) + 0,	NULL,	NULL,	NULL,	'2022-10-31 23:30:45',	'1',	'ALL'),
(3,	'应急管理员',	'quick',	CONV('1', 2, 10) + 0,	'3',	'应急管理员描述',	CONV('0', 2, 10) + 0,	NULL,	NULL,	NULL,	'2022-10-31 23:30:59',	'2',	'SELF'),
(1686925490577850369,	'面试官',	'face',	CONV('1', 2, 10) + 0,	'4',	'面试',	NULL,	NULL,	'2023-08-03 02:22:33',	NULL,	'2023-08-03 02:22:42',	NULL,	NULL),
(1686934789551144961,	'面试者',	'面试者',	CONV('1', 2, 10) + 0,	'0',	NULL,	NULL,	NULL,	'2023-08-03 02:59:30',	NULL,	'2023-08-03 02:59:30',	NULL,	NULL),
(1688380482849345538,	'系统管理员',	'fe-admin',	CONV('1', 2, 10) + 0,	'5',	'面试系统超管',	NULL,	NULL,	'2023-08-07 02:44:10',	NULL,	'2023-08-14 11:54:42',	NULL,	NULL);

DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` char(20) DEFAULT NULL,
  `dept_id` char(20) DEFAULT NULL,
  `id` char(20) DEFAULT NULL,
  `tenant_id` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sys_role_power`;
CREATE TABLE `sys_role_power` (
  `id` char(20) NOT NULL COMMENT '编号',
  `role_id` char(20) DEFAULT NULL COMMENT '角色编号',
  `power_id` char(20) DEFAULT NULL COMMENT '权限编号 ',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_role_power` (`id`, `role_id`, `power_id`, `tenant_id`) VALUES
('1660524137842192386',	'3',	'1',	NULL),
('1660524137842192387',	'3',	'2',	NULL),
('1660524137842192388',	'3',	'3',	NULL),
('1660524137842192389',	'3',	'28',	NULL),
('1660524137842192390',	'3',	'26',	NULL),
('1660524137842192391',	'3',	'27',	NULL),
('1660524137842192392',	'3',	'25',	NULL),
('1660524137842192393',	'3',	'4',	NULL),
('1660524137842192394',	'3',	'7',	NULL),
('1660524137842192395',	'3',	'18',	NULL),
('1660524137842192396',	'3',	'14',	NULL),
('1660524137842192397',	'3',	'16',	NULL),
('1660524137842192398',	'3',	'17',	NULL),
('1660524137842192399',	'3',	'5',	NULL),
('1660524137842192400',	'3',	'6',	NULL),
('1660524137842192401',	'3',	'10',	NULL),
('1660524137842192402',	'3',	'15',	NULL),
('1660524137842192403',	'3',	'20',	NULL),
('1660524137842192404',	'3',	'8',	NULL),
('1660524137842192405',	'3',	'9',	NULL),
('1660524137842192406',	'3',	'11',	NULL),
('1660524137842192407',	'3',	'13',	NULL),
('1660524137842192408',	'3',	'12',	NULL),
('1660524137842192409',	'3',	'1427568430800408578',	NULL),
('1660524137842192410',	'3',	'19',	NULL),
('1660524137842192411',	'3',	'23',	NULL),
('1660524137842192412',	'3',	'24',	NULL),
('1660524137842192413',	'3',	'1421947314073481217',	NULL),
('1660524137842192414',	'3',	'29',	NULL),
('1660524137842192415',	'3',	'30',	NULL),
('1660524137842192416',	'3',	'1650783393480962050',	NULL),
('1668087574663225345',	'2',	'1',	NULL),
('1668087574663225346',	'2',	'18',	NULL),
('1668087574663225347',	'2',	'20',	NULL),
('1668087574663225348',	'2',	'8',	NULL),
('1668087574663225349',	'2',	'7',	NULL),
('1668087574663225350',	'2',	'28',	NULL),
('1668087574663225351',	'2',	'4',	NULL),
('1668087574663225352',	'2',	'29',	NULL),
('1668087574663225353',	'2',	'14',	NULL),
('1668087574663225354',	'2',	'16',	NULL),
('1668087574663225355',	'2',	'17',	NULL),
('1668087574663225356',	'2',	'5',	NULL),
('1668087574663225357',	'2',	'6',	NULL),
('1668087574663225358',	'2',	'15',	NULL),
('1668087574663225359',	'2',	'1650082424258555905',	NULL),
('1668087574663225360',	'2',	'2',	NULL),
('1668087574663225361',	'2',	'1650783393480962050',	NULL),
('1668087574663225362',	'2',	'1660468667529953282',	NULL),
('1668087574663225363',	'2',	'1660478160078766081',	NULL),
('1668087574663225364',	'2',	'1660479585911439361',	NULL),
('1668087574663225365',	'2',	'1660480148992557057',	NULL),
('1668087574663225366',	'2',	'1660480318903812098',	NULL),
('1668087574663225367',	'2',	'1660480512668073986',	NULL),
('1668087574663225368',	'2',	'1660480841748971521',	NULL),
('1668087574663225369',	'2',	'1660523870480478210',	NULL),
('1668087574663225370',	'2',	'1661274162943733761',	NULL),
('1668087574663225371',	'2',	'1584794956811317250',	NULL),
('1668087574663225372',	'2',	'1661625661011984386',	NULL),
('1668087574663225373',	'2',	'1663421096265494530',	NULL),
('1668087574663225374',	'2',	'1667095788168269825',	NULL),
('1668087574663225375',	'2',	'1667099833465425922',	NULL),
('1668087574663225376',	'2',	'1667099582243393538',	NULL),
('1668087574663225377',	'2',	'1667112517744939009',	NULL),
('1668087574663225378',	'2',	'1667112276283052034',	NULL),
('1668087574663225379',	'2',	'1668087078380593153',	NULL),
('1679114591580286978',	'1',	'26',	NULL),
('1679114591580286979',	'1',	'1417039162970431489',	NULL),
('1679114591580286980',	'1',	'7',	NULL),
('1679114591580286981',	'1',	'1417044875528593409',	NULL),
('1679114591580286982',	'1',	'1417044703532769282',	NULL),
('1679114591588675585',	'1',	'1417039011644137473',	NULL),
('1679114591588675586',	'1',	'8',	NULL),
('1679114591588675587',	'1',	'20',	NULL),
('1679114591592869889',	'1',	'18',	NULL),
('1679114591592869890',	'1',	'1',	NULL),
('1679114591592869891',	'1',	'27',	NULL),
('1679114591592869892',	'1',	'9',	NULL),
('1679114591592869893',	'1',	'10',	NULL),
('1679114591592869894',	'1',	'5',	NULL),
('1679114591597064193',	'1',	'1421947314073481217',	NULL),
('1679114591597064194',	'1',	'15',	NULL),
('1679114591601258497',	'1',	'1650082424258555905',	NULL),
('1679114591601258498',	'1',	'24',	NULL),
('1679114591601258499',	'1',	'23',	NULL),
('1679114591601258500',	'1',	'19',	NULL),
('1679114591601258501',	'1',	'11',	NULL),
('1679114591601258502',	'1',	'13',	NULL),
('1679114591601258503',	'1',	'12',	NULL),
('1679114591601258504',	'1',	'1427568430800408578',	NULL),
('1679114591601258505',	'1',	'2',	NULL),
('1679114591601258506',	'1',	'1650783393480962050',	NULL),
('1679114591601258507',	'1',	'1660468667529953282',	NULL),
('1679114591601258508',	'1',	'1660478160078766081',	NULL),
('1679114591601258509',	'1',	'1660479585911439361',	NULL),
('1679114591601258510',	'1',	'1660480148992557057',	NULL),
('1679114591605452802',	'1',	'1660480318903812098',	NULL),
('1679114591605452803',	'1',	'1660480512668073986',	NULL),
('1679114591605452804',	'1',	'1660480841748971521',	NULL),
('1679114591605452805',	'1',	'1660523870480478210',	NULL),
('1679114591605452806',	'1',	'1661274162943733761',	NULL),
('1679114591605452807',	'1',	'1584794956811317250',	NULL),
('1679114591605452808',	'1',	'1661625661011984386',	NULL),
('1679114591605452809',	'1',	'1663421096265494530',	NULL),
('1679114591605452810',	'1',	'1584787892747743233',	NULL),
('1679114591605452811',	'1',	'1667095788168269825',	NULL),
('1679114591605452812',	'1',	'1667099833465425922',	NULL),
('1679114591605452813',	'1',	'1667099582243393538',	NULL),
('1679114591605452814',	'1',	'1667112276283052034',	NULL),
('1679114591605452815',	'1',	'1667112517744939009',	NULL),
('1679114591605452816',	'1',	'1668087078380593153',	NULL),
('1679114591605452817',	'1',	'4',	NULL),
('1686926568623030274',	'1686925490577850369',	'1686925311825002497',	NULL),
('1686926568623030275',	'1686925490577850369',	'1686926444899450882',	NULL);

DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant` (
  `id` char(20) NOT NULL COMMENT '编号',
  `name` char(20) DEFAULT NULL COMMENT '租户名称',
  `describe` varchar(255) DEFAULT NULL COMMENT '租户描述',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_tenant` (`id`, `name`, `describe`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `deleted`) VALUES
('1',	'Pear Stack',	'致 力 于 让 Web 开 发 变 得 简 单 优 雅',	'1',	'2021-07-18 02:10:44',	'1',	'2021-07-18 02:10:44',	'备注',	NULL);

DROP TABLE IF EXISTS `sys_tenant_power`;
CREATE TABLE `sys_tenant_power` (
  `id` char(20) NOT NULL COMMENT '唯一标识',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  `power_id` char(20) DEFAULT NULL COMMENT '权限编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_tenant_power` (`id`, `tenant_id`, `power_id`) VALUES
('1686926511312060418',	'1',	'1660480512668073986'),
('1686926511379169282',	'1',	'1660480318903812098'),
('1686926511454666753',	'1',	'4'),
('1686926511525969922',	'1',	'1660479585911439361'),
('1686926511593078786',	'1',	'1660480512668073986'),
('1686926511668576258',	'1',	'1660480841748971521'),
('1686926511735685122',	'1',	'6'),
('1686926511806988289',	'1',	'1660480148992557057'),
('1686926511878291458',	'1',	'1660523870480478210'),
('1686926511949594625',	'1',	'1'),
('1686926512020897794',	'1',	'1660480841748971521'),
('1686926512096395265',	'1',	'5'),
('1686926512171892738',	'1',	'17'),
('1686926512243195905',	'1',	'1660480318903812098'),
('1686926512314499074',	'1',	'16'),
('1686926512389996546',	'1',	'1660523870480478210'),
('1686926512461299713',	'1',	'14'),
('1686926512540991490',	'1',	'28'),
('1686926512608100354',	'1',	'7'),
('1686926512683597825',	'1',	'1661274162943733761'),
('1686926512754900993',	'1',	'10'),
('1686926512826204162',	'1',	'25'),
('1686926512897507329',	'1',	'1421947314073481217'),
('1686926512968810497',	'1',	'9'),
('1686926513040113666',	'1',	'1660480512668073986'),
('1686926513119805442',	'1',	'4'),
('1686926513191108609',	'1',	'8'),
('1686926513262411778',	'1',	'20'),
('1686926513333714946',	'1',	'1660480841748971521'),
('1686926513405018114',	'1',	'15'),
('1686926513476321281',	'1',	'6'),
('1686926513551818754',	'1',	'18'),
('1686926513623121921',	'1',	'1660523870480478210'),
('1686926513694425089',	'1',	'23'),
('1686926513765728257',	'1',	'5'),
('1686926513841225729',	'1',	'11'),
('1686926513908334594',	'1',	'17'),
('1686926513983832065',	'1',	'12'),
('1686926514055135234',	'1',	'16'),
('1686926514126438401',	'1',	'1650082424258555905'),
('1686926514201935873',	'1',	'14'),
('1686926514269044737',	'1',	'13'),
('1686926514340347906',	'1',	'7'),
('1686926514411651074',	'1',	'10'),
('1686926514482954241',	'1',	'2'),
('1686926514554257409',	'1',	'1421947314073481217'),
('1686926514625560578',	'1',	'3'),
('1686926514692669442',	'1',	'9'),
('1686926514763972610',	'1',	'1650783393480962050'),
('1686926514839470082',	'1',	'8'),
('1686926514910773250',	'1',	'1660468667529953282'),
('1686926514982076417',	'1',	'20'),
('1686926515049185281',	'1',	'19'),
('1686926515120488449',	'1',	'24'),
('1686926515191791618',	'1',	'15'),
('1686926515263094786',	'1',	'18'),
('1686926515334397953',	'1',	'1584794956811317250'),
('1686926515405701121',	'1',	'23'),
('1686926515477004289',	'1',	'1584787892747743233'),
('1686926515548307457',	'1',	'1427568430800408578'),
('1686926515619610626',	'1',	'11'),
('1686926515690913794',	'1',	'12'),
('1686926515762216961',	'1',	'1660478160078766081'),
('1686926515837714433',	'1',	'1650082424258555905'),
('1686926515904823297',	'1',	'1660479585911439361'),
('1686926515984515073',	'1',	'1660480148992557057'),
('1686926516055818241',	'1',	'13'),
('1686926516127121409',	'1',	'1660480318903812098'),
('1686926516194230273',	'1',	'2'),
('1686926516269727745',	'1',	'1660480512668073986'),
('1686926516341030914',	'1',	'3'),
('1686926516412334081',	'1',	'1660480841748971521'),
('1686926516487831553',	'1',	'1650783393480962050'),
('1686926516559134722',	'1',	'1660523870480478210'),
('1686926516630437890',	'1',	'1660468667529953282'),
('1686926516705935361',	'1',	'19'),
('1686926516777238529',	'1',	'1661274162943733761'),
('1686926516848541698',	'1',	'24'),
('1686926516915650562',	'1',	'1661625661011984386'),
('1686926516986953729',	'1',	'1584794956811317250'),
('1686926517058256897',	'1',	'1663421096265494530'),
('1686926517129560065',	'1',	'1667095788168269825'),
('1686926517200863233',	'1',	'1584787892747743233'),
('1686926517272166402',	'1',	'1427568430800408578'),
('1686926517343469570',	'1',	'1667099833465425922'),
('1686926517414772738',	'1',	'1660478160078766081'),
('1686926517486075905',	'1',	'1667099582243393538'),
('1686926517578350593',	'1',	'1660479585911439361'),
('1686926517653848065',	'1',	'1667112276283052034'),
('1686926517729345538',	'1',	'1667112517744939009'),
('1686926517800648706',	'1',	'1660480148992557057'),
('1686926517880340481',	'1',	'1668087078380593153'),
('1686926517951643649',	'1',	'1660480318903812098'),
('1686926518022946818',	'1',	'1660480512668073986'),
('1686926518094249986',	'1',	'1660480841748971521'),
('1686926518165553153',	'1',	'1660523870480478210'),
('1686926518236856321',	'1',	'1661274162943733761'),
('1686926518303965186',	'1',	'1661625661011984386'),
('1686926518379462658',	'1',	'1663421096265494530'),
('1686926518450765825',	'1',	'1667095788168269825'),
('1686926518522068993',	'1',	'1667099833465425922'),
('1686926518597566466',	'1',	'1667099582243393538'),
('1686926518668869634',	'1',	'1667112276283052034'),
('1686926518744367106',	'1',	'1667112517744939009'),
('1686926518819864578',	'1',	'1668087078380593153'),
('1686926518891167746',	'1',	'1686925311825002497'),
('1686926518962470914',	'1',	'1686926444899450882');

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(50) NOT NULL COMMENT '用户编号',
  `username` varchar(30) DEFAULT NULL COMMENT '用户账户',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `enable` bit(1) DEFAULT NULL COMMENT '用户状态（0：正常 1：禁用）',
  `nickname` char(200) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `gender` int(11) DEFAULT NULL COMMENT '性别 (0: 未知 1: 男 2: 女)',
  `email` char(30) DEFAULT NULL COMMENT '邮箱',
  `phone` char(20) DEFAULT NULL COMMENT '联系方式',
  `from_agent` varchar(50) DEFAULT 'sys' COMMENT '来源',
  `grade_id` varchar(50) DEFAULT NULL COMMENT '用户等级',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `create_by` char(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `locked` bit(1) DEFAULT NULL COMMENT '锁定状态',
  `remark` text COMMENT '备注',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  `dept_id` char(20) DEFAULT NULL COMMENT '部门编号',
  `post_id` char(20) DEFAULT NULL COMMENT '岗位编号',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_user` (`id`, `username`, `password`, `enable`, `nickname`, `avatar`, `gender`, `email`, `phone`, `from_agent`, `grade_id`, `start_time`, `end_time`, `deleted`, `create_by`, `create_time`, `update_by`, `update_time`, `locked`, `remark`, `tenant_id`, `dept_id`, `post_id`, `sign`) VALUES
('1',	'admin',	'$2a$10$TMcexLjFX.wFAxayZXJIWesHMtsJ54ycx2QFkf562d3XAmIFts4wG',	CONV('1', 2, 10) + 0,	'夏娜1',	'https://s2-cdn.oneitfarm.com/1690537043395-Fl1mj2kAM38RyHOHa96mlIPKDC7p.png',	0,	'pearadmin@gmail.com',	'15553726531',	'',	'1667101456283586561',	'2023-06-14 08:20:40',	'2023-07-14 08:20:40',	CONV('0', 2, 10) + 0,	'1',	'2021-05-02 22:05:57',	NULL,	'2023-07-28 09:37:24',	CONV('0', 2, 10) + 0,	NULL,	'1',	'8',	'1388197937639247873',	'年 年 有 风 ，风 吹 年 年，慢 慢 即 漫 漫.'),
('1575145205459382274',	'Some',	'$2a$10$748BhN4ignQIoCO0lj88ku6I80QuxTY22DzBmRvuJfm7eJKuz/SOm',	CONV('1', 2, 10) + 0,	'Some',	'https://somebuckets3.s3.ap-northeast-1.amazonaws.com/1663580060169-default_handsome.jpg',	0,	'Some',	'18260356302',	'web',	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-09-28 15:27:36',	NULL,	'2023-07-04 07:29:39',	CONV('0', 2, 10) + 0,	NULL,	NULL,	'6',	'1388197937639247873',	NULL),
('1584832991955267585',	'JingJ',	'$2a$10$kfy3u1hNwYLssCUz6j3k3.fllrlYFqvS.2ROfK..VnmMPIkmH0cJW',	CONV('1', 2, 10) + 0,	'JingJ',	'https://somebuckets3.s3.ap-northeast-1.amazonaws.com/1663580060169-default_handsome.jpg',	0,	'Wuzhou',	'18362983757',	'web',	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-10-25 09:03:25',	NULL,	'2023-08-14 11:55:02',	CONV('0', 2, 10) + 0,	NULL,	NULL,	'6',	'1388197937639247873',	NULL),
('1588465279720734721',	'Jack',	'$2a$10$2GYblY5SUQVNjgXZkFPbiOKG0uMB5MBC7zvizTLzsjB7qpRb9xLHS',	CONV('1', 2, 10) + 0,	'Jack',	'https://somebuckets3.s3.ap-northeast-1.amazonaws.com/1663580060169-default_handsome.jpg',	0,	'HangYe',	'18362983757',	'web',	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-11-04 17:36:50',	NULL,	'2023-08-09 13:20:45',	CONV('0', 2, 10) + 0,	NULL,	NULL,	'6',	'1388197937639247873',	NULL),
('1588465424575217666',	'CC',	'$2a$10$748BhN4ignQIoCO0lj88ku6I80QuxTY22DzBmRvuJfm7eJKuz/SOm',	CONV('1', 2, 10) + 0,	'CC',	'https://somebuckets3.s3.ap-northeast-1.amazonaws.com/1663580060169-default_handsome.jpg',	0,	'SunNing',	'1221',	'web',	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2022-11-04 17:37:24',	NULL,	'2022-11-04 17:37:24',	CONV('0', 2, 10) + 0,	'12',	NULL,	'7',	'1388197937639247873',	NULL),
('1667093998966263810',	'liwang',	'$2a$10$2wbzqk/h0zp1qmekl6YWwuTN3cRKlCB65CKq7b9SRD1D82RZDLmQy',	CONV('1', 2, 10) + 0,	'zjyfrank17@gmail.com',	'https://somebuckets3.s3.ap-northeast-1.amazonaws.com/1663580060169-default_handsome.jpg',	0,	'zjyfrank17@gmail.com',	'18362983757',	'web',	'1667101456283586561',	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2023-06-09 08:59:17',	NULL,	'2023-06-13 03:44:06',	CONV('0', 2, 10) + 0,	NULL,	NULL,	NULL,	NULL,	NULL),
('1667098686809821185',	'jiangyi',	'$2a$10$8DI.wy5CWZM0D53.gLbRxuXWSYaddat7O3ah9lH3AVhg05q6zloSy',	CONV('1', 2, 10) + 0,	'jiangyi',	'https://s2-cdn.oneitfarm.com/1686750357705-75ced7cb339f4a1f264392a2eb2af865.gif',	0,	'cn_jiangyi@163.com',	'18362983757',	'web',	'1667101456283586561',	'2023-06-15 14:16:37',	'2023-07-15 14:16:37',	CONV('0', 2, 10) + 0,	NULL,	'2023-06-09 09:17:55',	NULL,	'2023-08-25 07:05:43',	CONV('0', 2, 10) + 0,	'asd',	NULL,	'1676119681516285954',	'1388197937639247873',	NULL),
('1668053774168608769',	'Lisi',	'$2a$10$Vs78/HhKF6X9hrB0Vjr9duM7j1FE0Ub56uqjNSBdA.9KSWYgzQzKG',	CONV('1', 2, 10) + 0,	'c.zhou.ca@gmail.com',	'https://somebuckets3.s3.ap-northeast-1.amazonaws.com/1663580060169-default_handsome.jpg',	NULL,	'c.zhou.ca@gmail.com',	'18362983757',	'web',	NULL,	NULL,	NULL,	CONV('0', 2, 10) + 0,	NULL,	'2023-06-12 00:33:05',	NULL,	'2023-06-12 00:33:05',	CONV('0', 2, 10) + 0,	NULL,	NULL,	NULL,	NULL,	NULL),
('1681673837710766081',	NULL,	'$2a$10$Wq13StimW3qOWzBNzB7Xa.RpOELrx98ZAmrDdq4N.kz5EYVfuw51W',	CONV('1', 2, 10) + 0,	'lustig.zhang@gmail.com',	'https://somebuckets3.s3.ap-northeast-1.amazonaws.com/1663580060169-default_handsome.jpg',	NULL,	'lustig.zhang@gmail.com',	NULL,	'web',	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-07-19 14:34:22',	NULL,	'2023-07-19 14:34:22',	CONV('0', 2, 10) + 0,	NULL,	NULL,	NULL,	NULL,	NULL),
('1681856282926084098',	NULL,	'$2a$10$NDPhwnJLbLVs3D0xOu4JpOotr9ZGik5TsBTSMvuWMBCb5WCCp.gK6',	CONV('1', 2, 10) + 0,	'huangzhsir@163.com',	'https://somebuckets3.s3.ap-northeast-1.amazonaws.com/1663580060169-default_handsome.jpg',	NULL,	'huangzhsir@163.com',	NULL,	'web',	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-07-20 02:39:20',	NULL,	'2023-07-20 02:39:20',	CONV('0', 2, 10) + 0,	NULL,	NULL,	NULL,	NULL,	NULL),
('1691114296214376450',	'aa',	'$2a$10$UluR1/2lr6eKvT6GJVy7Gu3W7XSO1iPY4r0SrFh4aF2zVRazy6Zni',	CONV('1', 2, 10) + 0,	'aa',	NULL,	0,	'aa',	'aa',	'web',	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-08-14 15:47:22',	NULL,	'2023-08-14 15:47:22',	CONV('0', 2, 10) + 0,	'1',	NULL,	'1676119681516285954',	'1388197937639247873',	NULL),
('2',	'user',	'$2a$10$W9aO5mnDmMn3PbYUbUWt7eTZ7.zd6ub0gd1rPPNrND2zJmG8JC9Ju',	CONV('1', 2, 10) + 0,	'user',	'https://s2-cdn.oneitfarm.com/1690364207863-default_handsome.jpg',	0,	'835106505@qq.com',	'18260356301',	'web',	'1667101456283586561',	'2023-06-15 04:21:17',	'2023-07-15 04:21:17',	CONV('0', 2, 10) + 0,	'1',	'2022-09-25 04:44:48',	NULL,	'2023-07-26 09:36:49',	CONV('0', 2, 10) + 0,	'',	'1',	'8',	'1388197937639247873',	'年 年 有 风 ，风 吹 年 年，慢 慢 即 漫 漫.111');

DROP TABLE IF EXISTS `sys_user_grade`;
CREATE TABLE `sys_user_grade` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary key',
  `grade` tinyint(4) DEFAULT '1' COMMENT '等级',
  `name` varchar(30) DEFAULT '' COMMENT '等级名称',
  `img` varchar(255) DEFAULT NULL COMMENT '展示图',
  `valid_day` int(11) DEFAULT '0' COMMENT '有效期',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `bind_role` char(20) DEFAULT NULL COMMENT '绑定角色',
  `status` char(1) DEFAULT 'A' COMMENT '状态',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `catch_condition` varchar(255) DEFAULT '' COMMENT '升级会员等级条件描述',
  `catch_type` varchar(30) DEFAULT 'pay' COMMENT '升级会员等级条件，init:默认获取;pay:付费升级；frequency:消费次数；amount:累积消费金额升级',
  `catch_value` int(11) DEFAULT '0' COMMENT '达到升级条件的值',
  `user_privilege` varchar(1000) DEFAULT '' COMMENT '会员权益描述',
  `discount` float(5,2) DEFAULT '0.00' COMMENT '享受折扣',
  `speed` float(5,2) DEFAULT '1.00' COMMENT '积分加速',
  `sort` int(11) unsigned DEFAULT NULL COMMENT '排序',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除表示(0:No,1:Yes)',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_user_grade` (`id`, `grade`, `name`, `img`, `valid_day`, `price`, `promotion_price`, `bind_role`, `status`, `sale`, `catch_condition`, `catch_type`, `catch_value`, `user_privilege`, `discount`, `speed`, `sort`, `deleted`, `create_by`, `update_by`, `create_time`, `update_time`, `remark`, `tenant_id`) VALUES
('1667101456283586561',	1,	'¥10.00/月',	NULL,	30,	0.01,	10.00,	'1',	'A',	NULL,	'',	'pay',	0,	'',	0.00,	1.00,	NULL,	0,	NULL,	NULL,	'2023-06-09 01:28:55',	'2023-06-13 05:05:56',	NULL,	NULL),
('1667101906860888065',	2,	'¥100.00/年',	NULL,	365,	0.02,	100.00,	'1',	'A',	NULL,	'',	'pay',	0,	'',	0.00,	1.00,	NULL,	0,	NULL,	NULL,	'2023-06-09 01:30:43',	'2023-06-13 05:06:55',	NULL,	NULL);

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` char(20) NOT NULL COMMENT '编号',
  `user_id` char(20) DEFAULT NULL COMMENT '用户编号',
  `role_id` char(20) DEFAULT NULL COMMENT '角色编号',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `tenant_id`) VALUES
('1389665566669352961',	'1388857293993066497',	'1',	'1'),
('1389665566669352962',	'1388857293993066497',	'2',	'1'),
('1389665566669352963',	'1388857293993066497',	'3',	'1'),
('1573896595816173570',	'1573896273387442178',	'1',	'1'),
('1575138058596106241',	'user',	'1',	'1'),
('1575138058612883458',	'user',	'2',	'1'),
('1575138058612883459',	'user',	'3',	'1'),
('1588375174834282497',	'fang@bageng.art',	'1',	NULL),
('1588375174834282498',	'fang@bageng.art',	'2',	NULL),
('1588375174834282499',	'fang@bageng.art',	'3',	NULL),
('1588410880927739905',	'alex',	'1',	NULL),
('1588410880940322818',	'alex',	'2',	NULL),
('1588410880940322819',	'alex',	'3',	NULL),
('1588416186407444482',	'Andy',	'1',	NULL),
('1588416186407444483',	'Andy',	'2',	NULL),
('1588416186407444484',	'Andy',	'3',	NULL),
('1688462035365400577',	'1667098686809821185',	'1688380482849345538',	NULL),
('1689267765689536513',	'1',	'1',	''),
('1689267964453408770',	'1588465279720734721',	'1686925490577850369',	NULL),
('1691125199081132033',	'1691114296214376450',	'1686925490577850369',	NULL),
('1695038147105177602',	'1681856282926084098',	'1688380482849345538',	NULL),
('1695038147109371905',	'1681856282926084098',	'1',	NULL),
('1696121169183293442',	'2',	'1',	NULL),
('1696121169183293443',	'2',	'2',	NULL),
('1696121169183293444',	'2',	'3',	NULL),
('1696121169183293445',	'2',	'1686925490577850369',	NULL),
('1696121169191682049',	'2',	'1688380482849345538',	NULL),
('1696121169191682050',	'2',	'1686934789551144961',	NULL),
('1696492463015903233',	'1575145205459382274',	'1',	NULL),
('1696492463015903234',	'1575145205459382274',	'2',	NULL),
('1696492463015903235',	'1575145205459382274',	'1686925490577850369',	NULL),
('1696492463015903236',	'1575145205459382274',	'1688380482849345538',	NULL);

DROP TABLE IF EXISTS `sys_user_social`;
CREATE TABLE `sys_user_social` (
  `id` varchar(50) NOT NULL COMMENT '用户编号',
  `user_id` varchar(100) DEFAULT NULL COMMENT '鐢ㄦ埛瀵嗙爜',
  `scope` varchar(50) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `tool_alipay_config`;
CREATE TABLE `tool_alipay_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) DEFAULT NULL COMMENT '编码',
  `format` varchar(255) DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '异步回调',
  `private_key` text COMMENT '私钥',
  `public_key` text COMMENT '公钥',
  `return_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付宝配置类';

INSERT INTO `tool_alipay_config` (`config_id`, `app_id`, `charset`, `format`, `gateway_url`, `notify_url`, `private_key`, `public_key`, `return_url`, `sign_type`, `sys_service_provider_id`) VALUES
(1,	'2021003197656932',	'utf-8',	'JSON',	'https://openapi.alipay.com/gateway.do',	'http://server.myflow.work:9293/api/sys/omsOrder/notify',	'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',	'http://server.myflow.work:82/pay-success',	'RSA2',	'2088541855069713'),
(2,	'2021000122692744',	'utf-8',	'JSON',	'https://openapi.alipaydev.com/gateway.do',	'https://ws-j8sni9dnklbfu.gw002.oneitfarm.com/main.php',	'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',	'https://ws-j8sni9dnklbfu.gw002.oneitfarm.com/main.php',	'RSA2',	'2088721013992565'),
(3,	'2016091700532697',	'utf-8',	'JSON',	'https://openapi.alipaydev.com/gateway.do',	'http://api.auauz.net/api/aliPay/notify',	'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',	'http://api.auauz.net/api/aliPay/return',	'RSA2',	'2088102176044281');

DROP TABLE IF EXISTS `tool_email_config`;
CREATE TABLE `tool_email_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `from_user` varchar(255) DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) DEFAULT NULL COMMENT '密码',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `user` varchar(255) DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱配置';

INSERT INTO `tool_email_config` (`config_id`, `from_user`, `host`, `pass`, `port`, `user`) VALUES
(1,	'18260356308@163.com',	'smtp.163.com',	'446727CE3CA33C09511A219405FE86602C8B859308C732B4',	'465',	'anluowei'),
(2,	'support@akic.tech',	'smtp.exmail.qq.com',	'FA0DA8D1EC89D11B9CE187F38B9F803322F1BF73DC79D674',	'465',	'support'),
(6,	'835106505@qq.com',	'smtp.qq.com',	'D796807F0876B91227B94294796BA1B20902B5BED551E0E9',	'465',	'xiapeifu'),
(7,	'xiapeifu@corp-ci.com',	'smtp.exmail.qq.com',	'F4FDE51B2D7B578A12A51A486567A9A0C090686B35267D7B',	'465',	'xiapeifu');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `username` longtext,
  `password` longtext,
  `avatar_id` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_users_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `deleted_at`, `username`, `password`, `avatar_id`) VALUES
(1,	'2023-06-14 11:39:02.590',	'2023-06-14 11:39:02.590',	NULL,	'12122121',	'$2a$10$5whPYp0sZJLRF4pZ0WC6c.kGQszMZ1Sk9M.wjiErDEpWP1jGeYx9u',	'1'),
(2,	'2023-06-14 17:46:36.712',	'2023-06-14 17:46:36.712',	NULL,	'1212',	'$2a$10$ZgRlqpc5y45Cyj.brO3iDuWzsqnC1rZNcM9hFZ97SyK.IDvvEjkdG',	'1');

DROP TABLE IF EXISTS `work_flow`;
CREATE TABLE `work_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'user_id',
  `status_id` varchar(255) DEFAULT NULL COMMENT '流程状态关联状态表',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `work_flow` (`id`, `name`, `user_id`, `status_id`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `tenant_id`) VALUES
(1,	'1',	'1',	NULL,	NULL,	NULL,	'2023-06-13 08:15:42',	NULL,	'2023-06-13 08:15:42',	CONV('0', 2, 10) + 0,	NULL,	NULL),
(2,	'213',	'1575145205459382274',	NULL,	NULL,	NULL,	'2023-08-03 02:38:33',	NULL,	'2023-08-03 02:38:33',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `work_flow_field`;
CREATE TABLE `work_flow_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `flow_id` varchar(255) DEFAULT NULL COMMENT '流程id',
  `type` varchar(255) DEFAULT NULL COMMENT '值类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `work_flow_field` (`id`, `name`, `flow_id`, `type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `tenant_id`) VALUES
(1,	'字段1',	'1',	NULL,	0,	NULL,	'2023-07-05 06:09:10',	NULL,	'2023-07-05 06:09:10',	NULL,	NULL,	NULL),
(2,	'字段2',	'1',	NULL,	1,	NULL,	'2023-07-05 06:09:22',	NULL,	'2023-07-05 06:09:22',	NULL,	NULL,	NULL),
(3,	'字段3',	'1',	NULL,	2,	NULL,	'2023-07-05 06:09:28',	NULL,	'2023-07-05 06:09:28',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `work_flow_item`;
CREATE TABLE `work_flow_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `flow_id` varchar(255) DEFAULT NULL COMMENT '流程id',
  `status_id` varchar(255) DEFAULT NULL COMMENT '关联的状态',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `work_flow_item` (`id`, `name`, `flow_id`, `status_id`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `tenant_id`) VALUES
(1,	NULL,	'1',	'1',	NULL,	'1',	'2023-07-05 06:09:33',	NULL,	'2023-07-05 06:09:33',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `work_flow_item_field`;
CREATE TABLE `work_flow_item_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_item_id` varchar(255) DEFAULT NULL COMMENT '流程id',
  `flow_value` longtext COMMENT '内容',
  `field_id` varchar(20) DEFAULT NULL COMMENT 'fieldId',
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `work_flow_item_field` (`id`, `flow_item_id`, `flow_value`, `field_id`, `name`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `tenant_id`) VALUES
(1,	'1',	'姓名',	'1',	NULL,	NULL,	NULL,	'2023-07-05 06:09:33',	NULL,	'2023-07-05 06:09:33',	NULL,	NULL,	NULL),
(2,	'1',	'年龄',	'2',	NULL,	NULL,	NULL,	'2023-07-05 06:09:33',	NULL,	'2023-07-05 06:09:33',	NULL,	NULL,	NULL),
(3,	'1',	'开始',	'3',	NULL,	NULL,	NULL,	'2023-07-05 06:09:33',	NULL,	'2023-07-05 06:09:33',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `work_flow_status`;
CREATE TABLE `work_flow_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `flow_id` varchar(255) DEFAULT NULL COMMENT '流程id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` char(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '逻辑删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(20) DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `work_flow_status` (`id`, `name`, `flow_id`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `deleted`, `remark`, `tenant_id`) VALUES
(1,	'初始状态',	'1',	0,	NULL,	'2023-06-13 08:15:42',	NULL,	'2023-07-05 06:09:55',	CONV('0', 2, 10) + 0,	NULL,	NULL),
(2,	'状态2',	'1',	1,	NULL,	'2023-07-05 06:09:55',	NULL,	'2023-07-05 06:09:55',	NULL,	NULL,	NULL),
(3,	'初始状态',	'2',	NULL,	NULL,	'2023-08-03 02:38:33',	NULL,	'2023-08-03 02:38:33',	NULL,	NULL,	NULL);

-- 2023-08-31 07:21:27
