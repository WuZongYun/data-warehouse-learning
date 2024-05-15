-- DROP TABLE IF EXISTS ods.ods_refund_payment_inc;
CREATE  TABLE ods.ods_refund_payment_inc
(
    `id`  VARCHAR(255),
    `k1` DATE NOT NULL   COMMENT '分区字段',
    `out_trade_no`  STRING,
    `order_id`  STRING,
    `sku_id`  STRING,
    `payment_type`  STRING,
    `trade_no`  STRING,
    `total_amount`  DECIMAL(16, 2),
    `subject`  STRING,
    `refund_status`  STRING,
    `create_time`  STRING,
    `callback_time`  STRING,
    `callback_content`  STRING
)
    ENGINE=OLAP
UNIQUE KEY(`id`,`k1`)
COMMENT '退款表'
PARTITION BY RANGE(`k1`) ()
DISTRIBUTED BY HASH(`id`)
PROPERTIES
(
    "replication_allocation" = "tag.location.default: 1",
    "is_being_synced" = "false",
    "storage_format" = "V2",
    "light_schema_change" = "true",
    "disable_auto_compaction" = "false",
    "enable_single_replica_compaction" = "false",
    "dynamic_partition.enable" = "true",
    "dynamic_partition.time_unit" = "DAY",
    "dynamic_partition.start" = "-7",
    "dynamic_partition.end" = "3",
    "dynamic_partition.prefix" = "p",
    "dynamic_partition.buckets" = "32"
);
