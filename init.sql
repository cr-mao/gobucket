create database goods_service default charset utf8mb4;

use goods_service;

CREATE TABLE `goods`
(
    `id`                int(11) NOT NULL AUTO_INCREMENT,
    `add_time`          datetime(3) DEFAULT NULL,
    `update_time`       datetime(3) DEFAULT NULL,
    `is_deleted`        tinyint(1) DEFAULT NULL,
    `category_id`       int(11) NOT NULL,
    `brands_id`         int(11) NOT NULL,
    `on_sale`           tinyint(1) NOT NULL DEFAULT '0',
    `ship_free`         tinyint(1) NOT NULL DEFAULT '0',
    `is_new`            tinyint(1) NOT NULL DEFAULT '0',
    `is_hot`            tinyint(1) NOT NULL DEFAULT '0',
    `name`              varchar(50)   NOT NULL,
    `goods_sn`          varchar(50)   NOT NULL,
    `click_num`         int(11) NOT NULL DEFAULT '0',
    `sold_num`          int(11) NOT NULL DEFAULT '0',
    `fav_num`           int(11) NOT NULL DEFAULT '0',
    `market_price`      float         NOT NULL,
    `shop_price`        float         NOT NULL,
    `goods_brief`       varchar(100)  NOT NULL,
    `images`            varchar(1000) NOT NULL,
    `desc_images`       varchar(1000) NOT NULL,
    `goods_front_image` varchar(200)  NOT NULL,
    PRIMARY KEY (`id`),
    KEY                 `idx_goods_category` (`category_id`),
    KEY                 `idx_goods_brands` (`brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `category`
(
    `id`                 int(11) NOT NULL AUTO_INCREMENT,
    `add_time`           datetime(3) DEFAULT NULL,
    `update_time`        datetime(3) DEFAULT NULL,
    `is_deleted`         tinyint(1) DEFAULT NULL,
    `name`               varchar(20) NOT NULL,
    `parent_category_id` int(11) DEFAULT NULL,
    `level`              int(11) NOT NULL DEFAULT '1',
    `is_tab`             tinyint(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY                  `idx_category_sub_category` (`parent_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `goodscategorybrand`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `add_time`    datetime(3) DEFAULT NULL,
    `update_time` datetime(3) DEFAULT NULL,
    `is_deleted`  tinyint(1) DEFAULT NULL,
    `category_id` int(11) DEFAULT NULL,
    `brands_id`   int(11) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_category_brand` (`category_id`,`brands_id`),
    KEY           `idx_goodscategorybrand_brands` (`brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



