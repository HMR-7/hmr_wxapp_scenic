/*
 Navicat Premium Data Transfer

 Source Server         : tour
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : tour

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 10/04/2021 11:58:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `good_id` int DEFAULT NULL,
  `iscollect` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
BEGIN;
INSERT INTO `collect` VALUES (1, 1, 1, 1);
INSERT INTO `collect` VALUES (3, 1, 2, 1);
INSERT INTO `collect` VALUES (4, 1, 3, 0);
INSERT INTO `collect` VALUES (5, 1, 4, 0);
INSERT INTO `collect` VALUES (6, 1, 5, 0);
INSERT INTO `collect` VALUES (7, 1, 7, 0);
INSERT INTO `collect` VALUES (8, 1, 12, 0);
INSERT INTO `collect` VALUES (9, 1, 11, 0);
INSERT INTO `collect` VALUES (10, 1, 10, 0);
INSERT INTO `collect` VALUES (11, 1, 9, 0);
INSERT INTO `collect` VALUES (12, 1, 8, 1);
INSERT INTO `collect` VALUES (13, 5, 1, 1);
INSERT INTO `collect` VALUES (14, 1, 6, 0);
INSERT INTO `collect` VALUES (15, 14, 1, 0);
INSERT INTO `collect` VALUES (16, 14, 2, 1);
INSERT INTO `collect` VALUES (17, 14, 3, 1);
INSERT INTO `collect` VALUES (18, 26, 4, 1);
INSERT INTO `collect` VALUES (19, 1, 13, 0);
INSERT INTO `collect` VALUES (20, 27, 5, 1);
INSERT INTO `collect` VALUES (21, 27, 8, 1);
INSERT INTO `collect` VALUES (22, 40, 3, 1);
INSERT INTO `collect` VALUES (23, 40, 1, 1);
INSERT INTO `collect` VALUES (24, 40, 2, 1);
INSERT INTO `collect` VALUES (25, 40, 4, 1);
INSERT INTO `collect` VALUES (26, 40, 5, 1);
INSERT INTO `collect` VALUES (27, 40, 6, 1);
INSERT INTO `collect` VALUES (28, 40, 7, 1);
INSERT INTO `collect` VALUES (29, 40, 8, 1);
INSERT INTO `collect` VALUES (30, 40, 9, 1);
INSERT INTO `collect` VALUES (31, 40, 10, 1);
INSERT INTO `collect` VALUES (32, 40, 11, 1);
INSERT INTO `collect` VALUES (33, 40, 12, 1);
INSERT INTO `collect` VALUES (34, 40, 13, 1);
INSERT INTO `collect` VALUES (35, 39, 1, 0);
INSERT INTO `collect` VALUES (36, 68, 1, 1);
INSERT INTO `collect` VALUES (37, 68, 2, 1);
INSERT INTO `collect` VALUES (38, 68, 3, 1);
INSERT INTO `collect` VALUES (39, 68, 4, 1);
INSERT INTO `collect` VALUES (40, 68, 5, 0);
INSERT INTO `collect` VALUES (41, 68, 7, 1);
INSERT INTO `collect` VALUES (42, 68, 11, 1);
INSERT INTO `collect` VALUES (43, 68, 12, 1);
INSERT INTO `collect` VALUES (44, 68, 6, 1);
COMMIT;

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `good_name` varchar(255) DEFAULT NULL,
  `good_price` float(11,2) DEFAULT NULL,
  `childTicket` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `swipeArr` varchar(655) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `introduce` text,
  `time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of detail
-- ----------------------------
BEGIN;
INSERT INTO `detail` VALUES (1, '蓬莱阁景区', 88.00, '43', 'http://img.alicdn.com/i3/170090268524400251/TB2zhofXhvzQeBjSZPfXXbWGFXa_!!0-travel.jpg_750x388q80.jpg', 'http://img.alicdn.com/i3/170090268524400251/TB2zhofXhvzQeBjSZPfXXbWGFXa_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i3/170090268524465191/TB2KkINXw_xQeBjy0FoXXX1vpXa_!!0-travel.jpg_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1NR0VilTH8KJjy0FiSuwRsXXa_750x388q80.jpg', '烟台市蓬莱市迎宾路7号', '碑刻匾额满目,人间仙境', '八仙过海”神话源于此，可以远眺黄海与渤海的交界处。', NULL);
INSERT INTO `detail` VALUES (2, '蓬莱八仙过海景区', 40.00, '20', 'http://img.alicdn.com/i2/152440259742608991/TB21WuztFXXXXbrXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg', 'http://img.alicdn.com/i2/152440259742608991/TB21WuztFXXXXbrXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i1/152440259742796106/TB22mJ6tFXXXXayXpXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1o6_Zk6qhSKJjSspnSuw79XXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1XX.heIjI8KJjSsppSutbyVXa_750x388q80.jpg', '烟台市蓬莱市海滨路8号', '八仙渡口,探索神话传说', '传说中八仙过海的地方，可以感受道教文化，欣赏海景。', NULL);
INSERT INTO `detail` VALUES (3, '蓬莱三仙山景区', 64.00, '43', 'http://img.alicdn.com/i3/152410264913421435/TB2092suXXXXXXlXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg', 'http://img.alicdn.com/i3/152410264913421435/TB2092suXXXXXXlXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1SXfukWagSKJjy0FbSuu.mVXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1ZwLGkWmgSKJjSsphSuwy1VXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1U7V9eN6I8KJjSszfSuuZVXXa_750x388q80.jpg', '烟台市蓬莱市海滨路9号', '壮观仿古建筑群,仙山怀老', '珍藏众多，精美的雕刻，巨大的金丝楠木，都值得一看。', NULL);
INSERT INTO `detail` VALUES (4, '蓬莱文成城堡', 20.00, '0', 'http://img.alicdn.com/i3/152410264913421435/TB2092suXXXXXXlXXXXXXXXXXXX_!!0-https://img.alicdn.com/bao/uploaded/i8/TB15aTSEH1YBuNjSszhVVUUsFXa_041550.jpg', 'https://img.alicdn.com/bao/uploaded/i8/TB15aTSEH1YBuNjSszhVVUUsFXa_041550.jpg，https://img.alicdn.com/imgextra/i3/O1CN011tUXKSOi8xxJJKP_!!0-travel.jpg', '烟台市蓬莱市刘家沟镇206国道北(马家沟对面)', '宫殿城堡', '珍藏众多，精美的雕刻，巨大的金丝楠木，都值得一看。', NULL);
INSERT INTO `detail` VALUES (5, '蓬莱戚继光故里', 21.90, '14', 'https://img.alicdn.com/tfscom/TB1xXtNeRDH8KJjSszcSuvDTFXa_750x388q80.jpg', 'https://img.alicdn.com/tfscom/TB1xXtNeRDH8KJjSszcSuvDTFXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1EP4Bih6I8KJjSszfSuuZVXXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1CdU4fCfD8KJjSszhSuvIJFXa_750x388q80.jpg', '烟台市蓬莱市小十口北街与钟楼西路交叉口西南150米', '了解鸳鸯阵图,大明朝武器装备', '缅怀民族英雄，体验胶东民俗，还能看戚家军绝活表演。', NULL);
INSERT INTO `detail` VALUES (6, '蓬莱国宾酒庄', 39.00, '0', 'https://img.alicdn.com/imgextra/i2/O1CN011kqfw8i65l2Bm6O_!!0-travel.jpg_750x388q80.jpg', 'https://img.alicdn.com/imgextra/i2/O1CN011kqfw8i65l2Bm6O_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i1/152410262112802314/TB2JEBUtVXXXXXqXFXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i1/152410262113026464/TB2KI47tVXXXXcnXpXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg', '烟台蓬莱市国宾路1号即206国道', '酒厂', '蓬莱酒庄', NULL);
INSERT INTO `detail` VALUES (7, '蓬莱海洋极地世界', 96.00, '80', 'http://img.alicdn.com/i3/152430263411804729/TB2psxduXXXXXaQXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg', 'http://img.alicdn.com/i3/152430263411804729/TB2psxduXXXXXaQXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i1/152430263411794911/TB2g5XhuXXXXXXZXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i1/152430263411817243/TB2mVJnuXXXXXXiXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i4/152430263411877066/TB2SsAVtVXXXXXWXpXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg', '烟台市蓬莱市海港路88号', '观美人鱼表演,体验亲手喂海豚', '走进海底隧道，看美人鱼和珊瑚礁，增长海洋知识！', NULL);
INSERT INTO `detail` VALUES (8, '蓬莱欧乐堡梦幻世界', 92.88, '79', 'http://img.alicdn.com/i2/152410264966077952/TB2XUzbuXXXXXcFXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg', 'http://img.alicdn.com/i2/152410264966077952/TB2XUzbuXXXXXcFXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i3/152410264966063868/TB2b_LiuXXXXXa2XXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,https://img.alicdn.com/imgextra/i4/O1CN01s38H3P1JplUq9JEmV_!!0-alitrip.jpg_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1QZy3fYYI8KJjy0FaSuvAiVXa_750x388q80.jpg', '烟台市蓬莱市路三仙山大酒店对面(近三仙山风景区)', '欧洲风情建筑,逼真视觉效果', '珍藏众多，精美的雕刻，巨大的金丝楠木，都值得一看。', NULL);
INSERT INTO `detail` VALUES (9, '蓬莱黄金河度假村', 65.00, '56.9', 'http://img.alicdn.com/i4/170110260206973662/TB2xXeftFXXXXb0XpXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg', 'http://img.alicdn.com/i4/170110260206973662/TB2xXeftFXXXXb0XpXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i2/170110260207058529/TB2K9jbtFXXXXbSXXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg,http://img.alicdn.com/i3/170110260207020356/TB2_IzbtFXXXXc8XXXXXXXXXXXX_!!0-travel.jpg_750x388q80.jpg', '蓬莱市大柳行镇时金河村北', '珍稀动物植物,度假村', '集游览观光、休闲度假于一体的综合型旅游度假区。', NULL);
INSERT INTO `detail` VALUES (10, '蓬莱田横山', 0.00, '0', 'https://img.alicdn.com/tfscom/TB1ZylWignH8KJjSspcSuv3QFXa_750x388q80.jpg', 'https://img.alicdn.com/tfscom/TB1ZylWignH8KJjSspcSuv3QFXa_750x388q80.jpg,https://img.alicdn.com/imgextra/i2/O1CN01lVnt7f1FXfOgtpBWx_!!0-alitrip.jpg_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1xAFPidrJ8KJjSspaSutuKpXa_750x388q80.jpg', '迎宾路59号蓬莱阁旅游风景区', '绝美田横栈道,观黄海渤海分界线', '海面的快艇、白帆和沙滩，组成的画面就是桌面背景啊！', NULL);
INSERT INTO `detail` VALUES (11, '蓬莱古船博物馆', 0.00, '0', 'https://img.alicdn.com/tfscom/TB1Cgx5eJrJ8KJjSspaSutuKpXa_750x388q80.jpg', 'https://img.alicdn.com/tfscom/TB1Cgx5eJrJ8KJjSspaSutuKpXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1id43eIrI8KJjy0FhSuvfnpXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1IGeeeJnJ8KJjSszdSuuxuFXa_750x388q80.jpg', '迎宾路59号蓬莱阁景区内', '观赏元明古船,了解胶东半岛民俗', '博物馆造型很别致，顶部还有几艘古船，值得参观。', NULL);
INSERT INTO `detail` VALUES (12, '蓬莱水城', 0.00, '0', 'https://img.alicdn.com/tfscom/TB175VWeN6I8KJjSszfSuuZVXXa_750x388q80.jpg', 'https://img.alicdn.com/tfscom/TB175VWeN6I8KJjSszfSuuZVXXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1D10.eMLD8KJjSszeSuuGRpXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1QZs2fDnI8KJjy0FfSuwdoVXa_750x388q80.jpg', '烟台市蓬莱市蓬莱阁旅游景区 ‎ ', '明代古城墙,欣赏戚家军出征表演', '一个沿岸水军堡垒，和几门明代的岸炮，维护的很不错。', 1587628426141);
INSERT INTO `detail` VALUES (13, '蓬莱艾山国家公园', 0.00, '0', 'https://img.alicdn.com/tfscom/TB1hcJ6ff6TBKNjSZJiSuvKVFXa_750x388q80.jpg', 'https://img.alicdn.com/tfscom/TB1hcJ6ff6TBKNjSZJiSuvKVFXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1kmjufbZnBKNjSZFGSuvt3FXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB1o7Xuhf9TBuNjy0FcSuveiFXa_750x388q80.jpg,https://img.alicdn.com/tfscom/TB15mjufbZnBKNjSZFGSuvt3FXa_750x388q80.jpg', '烟台市蓬莱市村里集镇黄泥沟村艾山国家公园', '岩石,国家公园', '集险峰群崮、温泉碧湖、历史遗迹于一体的国家级公园。', 1587628426141);
COMMIT;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `food_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
BEGIN;
INSERT INTO `food` VALUES (1, '蓬莱小面', '济南大学泉城学院-山东省蓬莱市海滨西路34号');
INSERT INTO `food` VALUES (2, '凤凰炸鸡', '济南大学泉城学院-山东省蓬莱市海滨西路34号');
INSERT INTO `food` VALUES (3, '鲜美羊肉汤', '济南大学泉城学院-山东省蓬莱市海滨西路34号');
COMMIT;

-- ----------------------------
-- Table structure for footer
-- ----------------------------
DROP TABLE IF EXISTS `footer`;
CREATE TABLE `footer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `good_id` int DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of footer
-- ----------------------------
BEGIN;
INSERT INTO `footer` VALUES (64, 1, 1, 1589594539);
INSERT INTO `footer` VALUES (65, 1, 2, 1589594473);
INSERT INTO `footer` VALUES (66, 68, 1, 1618025964);
INSERT INTO `footer` VALUES (67, 68, 3, 1618025967);
INSERT INTO `footer` VALUES (68, 68, 2, 1617894901);
INSERT INTO `footer` VALUES (69, 68, 4, 1617894873);
INSERT INTO `footer` VALUES (70, 68, 8, 1618026018);
INSERT INTO `footer` VALUES (71, 68, 12, 1618025953);
INSERT INTO `footer` VALUES (72, 68, 5, 1618025974);
INSERT INTO `footer` VALUES (73, 68, 7, 1617894918);
INSERT INTO `footer` VALUES (74, 68, 11, 1616913578);
INSERT INTO `footer` VALUES (75, 68, 6, 1617949753);
INSERT INTO `footer` VALUES (76, 68, 13, 1617779386);
INSERT INTO `footer` VALUES (77, 68, 10, 1617951291);
INSERT INTO `footer` VALUES (78, 68, 9, 1617269603);
COMMIT;

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(255) DEFAULT NULL,
  `hotel_address` varchar(255) DEFAULT NULL,
  `src` varchar(500) DEFAULT NULL,
  `good_id` int DEFAULT NULL,
  `hotel_price` int DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of hotel
-- ----------------------------
BEGIN;
INSERT INTO `hotel` VALUES (1, '蓬莱文城城堡', '蓬莱文成城堡位于蓬莱刘家沟镇解西村', 'https://img.alicdn.com/bao/uploaded/i8/TB15aTSEH1YBuNjSszhVVUUsFXa_041550.jpg,https://img.alicdn.com/bao/uploaded/i1/TB143o1iRfH8KJjy1XbzVzLdXXa_030451.jpg,https://img.alicdn.com/bao/uploaded/i1/TB143o1iRfH8KJjy1XbzVzLdXXa_030451.jpg,https://img.alicdn.com/bao/uploaded/i1/TB143o1iRfH8KJjy1XbzVzLdXXa_030451.jpg', 4, 168, 1588948372150);
INSERT INTO `hotel` VALUES (3, '蓬莱全季', '烟台市蓬莱市钟楼东路94号', 'https://img.alicdn.com/bao/uploaded/i1/TB1ZdV.bBGw3KVjSZFDdklWEpXa_013231.jpg,https://img.alicdn.com/bao/uploaded/i5/TB1I3EIdhD1gK0jSZFKqzkJrVXa_093616.jpg,https://img.alicdn.com/bao/uploaded/i2/TB1rp8mblGw3KVjSZFD2eJWEpXa_060808.jpg,https://img.alicdn.com/bao/uploaded/i4/TB14FZDdXT7gK0jSZFp9IGTkpXa_093552.jpg', 3, 166, 1589594641221);
INSERT INTO `hotel` VALUES (4, '蓬莱阁海景公寓(1号店) ', '兴蓬路/新兴路(路口)(悦动港湾)', 'https://img.alicdn.com/bao/uploaded/i2/TB1eGmgjDZmx1VjSZFGlzKx2XXa_065947.jpg,https://img.alicdn.com/bao/uploaded/i5/TB1I3EIdhD1gK0jSZFKqzkJrVXa_093616.jpg', 1, 98, NULL);
INSERT INTO `hotel` VALUES (6, '银座佳驿烟台蓬莱阁店', '山东省蓬莱市北关路133号悦动港湾10号楼', 'https://img.alicdn.com/bao/uploaded/i6/TB1yekyaTJ_SKJjSZPiaTz3LpXa_073136.jpg，https://img.alicdn.com/bao/uploaded/i5/TB142cbq.Y1gK0jSZFMYOOWcVXa_095228.jpg,https://img.alicdn.com/bao/uploaded/i8/TB15_caq8v0gK0jSZKbC5LK2FXa_095003.jpg', 1, 49, NULL);
INSERT INTO `hotel` VALUES (7, '蓬莱仙境戴斯酒店', '蓬莱市北关路133号', 'https://img.alicdn.com/bao/uploaded/i3/TB1tJkPaRHH8KJjy0FbkzUqlpXa_022526.jpg,https://img.alicdn.com/bao/uploaded/i6/TB1p8iLp.Y1gK0jSZFMjUOWcVXa_045508.jpg,https://img.alicdn.com/bao/uploaded/i4/TB1i4uKmsuYBuNkSmRypI7A3pXa_125118.jpg,https://img.alicdn.com/bao/uploaded/i4/TB1i4uKmsuYBuNkSmRypI7A3pXa_125118.jpg,https://img.alicdn.com/bao/uploaded/i7/TB1JAW3igHqK1RjSZFg7ce7JXXa_095248.jpg', 1, 99, NULL);
INSERT INTO `hotel` VALUES (8, '蓬莱都市118酒店', '山东省烟台市蓬莱市北关路133号悦动港湾', 'https://img.alicdn.com/bao/uploaded/i6/TB1vkgjQXXXXXczapXXT.c77pXX_010431.jpg,https://img.alicdn.com/bao/uploaded/i2/TB1LwgDQXXXXXaiaXXXT.c77pXX_010431.jpg,https://img.alicdn.com/bao/uploaded/i1/TB1gyQzQXXXXXbNaXXXT.c77pXX_010431.jpg,https://img.alicdn.com/bao/uploaded/i8/TB1ynsEQXXXXXaAaXXXxIk87pXX_010432.jpg', 1, 108, NULL);
INSERT INTO `hotel` VALUES (9, '花筑·蓬莱相见民宿', '蓬莱市蓬莱阁街道乐园路8号', 'https://img.alicdn.com/bao/uploaded/i8/TB1N9H1e8Cw3KVjSZR0EiPcUpXa_033211.jpg,https://img.alicdn.com/bao/uploaded/i8/TB1F7zZe8Kw3KVjSZFOBu9rDVXa_033214.jpg,https://img.alicdn.com/bao/uploaded/i1/TB1fhQ6cfBj_uVjSZFpnuk0SXXa_033203.jpg,https://img.alicdn.com/bao/uploaded/i8/TB1gIr1e8Kw3KVjSZTESjEuRpXa_033219.jpg,https://img.alicdn.com/bao/uploaded/i4/TB1noYSe79E3KVjSZFG1uI19XXa_033210.jpg', 4, 371, NULL);
INSERT INTO `hotel` VALUES (10, '蓬莱欧乐堡骑士度假酒店', '蓬莱阁街道海滨路9号', 'https://img.alicdn.com/bao/uploaded/i2/TB1JEagAUz1gK0jSZLej3b9kVXa_030602.jpg,https://img.alicdn.com/bao/uploaded/i2/TB17MemAND1gK0jSZFyj3ciOVXa_030602.jpg,https://img.alicdn.com/bao/uploaded/i4/TB19FKrARr0gK0jSZFnGb6RRXXa_030601.jpg', 3, 497, NULL);
INSERT INTO `hotel` VALUES (11, '烟台克里斯假日公寓酒店', '蓬莱街道海滨东路7号蓬莱度假中心3号楼3单元', 'https://img.alicdn.com/bao/uploaded/i2/TB1l1dLWcbpK1RjSZFy_P4_qFXa_110433.jpg,https://img.alicdn.com/bao/uploaded/i2/TB1l1dLWcbpK1RjSZFy_P4_qFXa_110433.jpg,https://img.alicdn.com/bao/uploaded/i5/TB1EIJDWmzqK1RjSZFLXEMn2XXa_110753.jpg', 2, 468, NULL);
INSERT INTO `hotel` VALUES (12, '测试酒店1', '测试地址1', 'https://img.alicdn.com/bao/uploaded/i3/TB1tJkPaRHH8KJjy0FbkzUqlpXa_022526.jpg,https://img.alicdn.com/bao/uploaded/i6/TB1p8iLp.Y1gK0jSZFMjUOWcVXa_045508.jpg', 5, 66, NULL);
INSERT INTO `hotel` VALUES (13, '测试酒店2', '测试地址2', 'https://img.alicdn.com/bao/uploaded/i3/TB1tJkPaRHH8KJjy0FbkzUqlpXa_022526.jpg,https://img.alicdn.com/bao/uploaded/i6/TB1p8iLp.Y1gK0jSZFMjUOWcVXa_045508.jpg', 5, 66, NULL);
INSERT INTO `hotel` VALUES (14, '酒店测试', '测试地址3', 'https://img.alicdn.com/bao/uploaded/i3/TB1tJkPaRHH8KJjy0FbkzUqlpXa_022526.jpg,https://img.alicdn.com/bao/uploaded/i6/TB1p8iLp.Y1gK0jSZFMjUOWcVXa_045508.jpg', 6, 123, 1587622102099);
COMMIT;

-- ----------------------------
-- Table structure for travellog
-- ----------------------------
DROP TABLE IF EXISTS `travellog`;
CREATE TABLE `travellog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_head` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `article` varchar(255) DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of travellog
-- ----------------------------
BEGIN;
INSERT INTO `travellog` VALUES (1, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '应该是最值得玩的地方吧，景区分两部分，能逛很久，景色迷人，可以爬到蓬莱最高点，然后坐在小亭子里眺望大海，很喜欢那个灯塔，一直觉得守着灯塔的人是很特别的，找个人少的地方，就那样坐着，我想大概可以坐很久，去蓬莱的话，一定要去蓬莱阁，听一听八仙过海的故事，也静下心来听一听海浪的声音，蓬莱仙境果然名不虚传。', 1616932493);
INSERT INTO `travellog` VALUES (3, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '蓬莱阁真的值得一去！', 1616932493);
INSERT INTO `travellog` VALUES (4, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '蓬莱阁一定要去玩一次。', 1616932493);
INSERT INTO `travellog` VALUES (6, 2, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '这真的太好玩了', 1616932493);
INSERT INTO `travellog` VALUES (7, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '更新了时间', 1616932493);
INSERT INTO `travellog` VALUES (8, 1, 5, 'https://wx.qlogo.cn/mmopen/vi_32/m4ic8NKwfPpemnzPZYHiaibZ9TQzQpnCVmLiaCqxibMNNFNDsPAdiaTlyicULZrvwoO5lX2rmH9rcanP2thJusk3S58Nw/132', '唐云龙', '蓬莱阁一定要去一次呀！！！！', 1616932493);
INSERT INTO `travellog` VALUES (20, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '好人一生平安！', 1616932493);
INSERT INTO `travellog` VALUES (21, 10, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '我又来点评了！', 1616932493);
INSERT INTO `travellog` VALUES (22, 1, 39, 'https://wx.qlogo.cn/mmopen/vi_32/EsE8SHhWvTXdmMibTjWKYuYOHTou9g6VkHv0HrT8vaBh4G4MAjia9YceLTGVcLuXwaAFS8icaGg3epWRpWMvSic5EA/132', 'LINGJINGz🍃', '哈哈哈', 1616932493);
INSERT INTO `travellog` VALUES (23, 1, 41, 'https://wx.qlogo.cn/mmopen/vi_32/v3uUicroVE1uLSKwBC11AqHwvKxHUGPUmowNtvyGgJnhWMsD3WkUibMnHF0KmRbvaD5cIHZnQ0ueEwXpqYB7Av5Q/132', '参天桃树', 'hello\n', 1616932493);
INSERT INTO `travellog` VALUES (24, 1, 41, 'https://wx.qlogo.cn/mmopen/vi_32/v3uUicroVE1uLSKwBC11AqHwvKxHUGPUmowNtvyGgJnhWMsD3WkUibMnHF0KmRbvaD5cIHZnQ0ueEwXpqYB7Av5Q/132', '参天桃树', '牛逼', 1616932493);
INSERT INTO `travellog` VALUES (25, 1, 14, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erHjjBMugYru11kqYhD7OCasQCkicDEcuDsTaKUeOibkDdfmxeOp7xJDt6ZSNMq2dwbKXXykiasCblhw/132', '花抹开月抹圆', '我来了', 1616932493);
INSERT INTO `travellog` VALUES (26, 1, 14, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erHjjBMugYru11kqYhD7OCasQCkicDEcuDsTaKUeOibkDdfmxeOp7xJDt6ZSNMq2dwbKXXykiasCblhw/132', '花抹开月抹圆', '你好', 1616932493);
INSERT INTO `travellog` VALUES (27, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '你真棒', 1616932493);
INSERT INTO `travellog` VALUES (28, 1, 14, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erHjjBMugYru11kqYhD7OCasQCkicDEcuDsTaKUeOibkDdfmxeOp7xJDt6ZSNMq2dwbKXXykiasCblhw/132', '花抹开月抹圆', '棒', 1616932493);
INSERT INTO `travellog` VALUES (29, 9, 14, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erHjjBMugYru11kqYhD7OCasQCkicDEcuDsTaKUeOibkDdfmxeOp7xJDt6ZSNMq2dwbKXXykiasCblhw/132', '花抹开月抹圆', '沙发是我的', 1616932493);
INSERT INTO `travellog` VALUES (30, 9, 14, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erHjjBMugYru11kqYhD7OCasQCkicDEcuDsTaKUeOibkDdfmxeOp7xJDt6ZSNMq2dwbKXXykiasCblhw/132', '花抹开月抹圆', '沙发第二个', 1616932493);
INSERT INTO `travellog` VALUES (34, 1, 14, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erHjjBMugYru11kqYhD7OCasQCkicDEcuDsTaKUeOibkDdfmxeOp7xJDt6ZSNMq2dwbKXXykiasCblhw/132', '花抹开月抹圆', '你好', 1616932493);
INSERT INTO `travellog` VALUES (35, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '好人一生平安', 1616932493);
INSERT INTO `travellog` VALUES (36, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '好人一生平安！', 1616932493);
INSERT INTO `travellog` VALUES (37, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '你真是一个好了啊', 1616932493);
INSERT INTO `travellog` VALUES (38, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '真好啊', 1616932493);
INSERT INTO `travellog` VALUES (39, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '你可真牛逼啊', 1616932493);
INSERT INTO `travellog` VALUES (40, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '这都被你猜到了？', 1616932493);
INSERT INTO `travellog` VALUES (41, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '终于改好了', 1616932493);
INSERT INTO `travellog` VALUES (43, 10, 40, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLrC94981ku8ZGl2eAh55lzOHzcnwDDiaNsWn9N1ibM73Dd1eZiaOcTAl96W1RiconBy3YVFRicjSPTjog/132', '情绪疯子 👄', '好玩！推荐！', 1616932493);
INSERT INTO `travellog` VALUES (44, 1, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '发成功了', 1616932493);
INSERT INTO `travellog` VALUES (46, 2, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '我来点评啦！', 1616932493);
INSERT INTO `travellog` VALUES (47, 2, 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2580096711,113788457&fm=26&gp=0.jpg', 'HMR ⁶⁶⁶', '我再一次来点评啦！', 1616932493);
INSERT INTO `travellog` VALUES (49, 1, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '测试1', 1616932493);
INSERT INTO `travellog` VALUES (50, 1, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '哥斯拉打金刚太好玩了', 1616932493);
INSERT INTO `travellog` VALUES (51, 1, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '哥斯拉打金刚太好玩了', 1616932493);
INSERT INTO `travellog` VALUES (52, 1, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '你好，李焕英太有意思', 1616932493);
INSERT INTO `travellog` VALUES (53, 3, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '完美世界', 1616932493);
INSERT INTO `travellog` VALUES (54, 1, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '复仇者联盟好像也挺好看', 1616932493);
INSERT INTO `travellog` VALUES (55, 3, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '美国队长也很好看', 1616932815);
INSERT INTO `travellog` VALUES (56, 10, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '还不错哦', 1616990052);
INSERT INTO `travellog` VALUES (57, 3, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '还不错哦', 1617266770);
INSERT INTO `travellog` VALUES (58, 3, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '值得一去的', 1617267309);
INSERT INTO `travellog` VALUES (59, 4, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '想去但是没有机会', 1617267348);
INSERT INTO `travellog` VALUES (63, 4, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '挺好玩', 1617780569);
INSERT INTO `travellog` VALUES (64, 4, 68, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZibbrJZw3iclYwYxCygibFXvfhquPb2UmP0cNnUE0q8ibXcBQjH6EBnfBm6icwL87IarlSOveDXnZucuty3AV0sPMmg/132', '橘子汽水', '真不错啊', 1617780667);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpic` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nickName` varchar(255) DEFAULT NULL,
  `userPhone` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `isAdmin` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
BEGIN;
INSERT INTO `userinfo` VALUES (1, 'HMR ⁶⁶⁶', '17853558905', 'owVCB4rl5T_THnCrKF0fbujJdKXM', 1);
INSERT INTO `userinfo` VALUES (14, '花抹开月抹圆', '17858805011', 'owVCB4tZA-VBlyYJi9iRSp1Gv584', 0);
INSERT INTO `userinfo` VALUES (26, '唐云龙', '17284599232', 'owVCB4osEduAK7cX3UquMsBNEDn8', 0);
INSERT INTO `userinfo` VALUES (28, '几单', '17816321021', 'owVCB4nn8UYDRNjvYZnRgjsoTrV0', 0);
INSERT INTO `userinfo` VALUES (41, '参天桃树', '17853558923', 'owVCB4it05e8oW_KGsnwXVwUwpO4', 1);
INSERT INTO `userinfo` VALUES (68, '橘子汽水', '17799852733', NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
