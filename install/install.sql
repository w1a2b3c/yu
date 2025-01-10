CREATE TABLE IF NOT EXISTS `kami_class` (
  `cid` int(11) NOT NULL COMMENT '分类名ID',
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `introduce` text COMMENT '介绍',
  `usetip` text COMMENT '使用提示',
  `active` tinyint(2) NOT NULL DEFAULT '0' COMMENT '显示/隐藏'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `kami_faka` (
  `kid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `km` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `usetime` datetime DEFAULT NULL,
  `users` text,
  `mode` int(255) DEFAULT NULL COMMENT '获取方式',
  `trade_no` text COMMENT '订单号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `kami_pay` (
  `trade_no` varchar(64) NOT NULL COMMENT '订单号',
  `openid` text NOT NULL COMMENT '用户openid',
  `cid` int(11) NOT NULL COMMENT '分类id',
  `name` varchar(64) NOT NULL COMMENT '商品名称',
  `money` varchar(32) NOT NULL COMMENT '购买金额',
  `content` text COMMENT '内容',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  `endtime` datetime DEFAULT NULL COMMENT '完成时间',
  `ip` varchar(20) DEFAULT NULL,
  `sign` text COMMENT '校验',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `kami_user` (
  `id` int(255) NOT NULL,
  `openid` text NOT NULL COMMENT '用户openid',
  `gtkid` int(255) NOT NULL COMMENT 'gtk算法id',
  `rate` int(11) DEFAULT '100' COMMENT '率',
  `addtime` datetime NOT NULL COMMENT '创建时间',
  `lasttime` datetime NOT NULL COMMENT '最后登录时间',
  `ip` text COMMENT 'IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `site_config` (
  `k` varchar(255) NOT NULL,
  `v` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `site_config` (`k`, `v`) VALUES
('admin_pass', '123456'),
('admin_user', 'admin'),
('adVideoTip', ''),
('shareTip', '还需分享一次好友或群即可领取卡密了哦'),
('contact', '领取规则：点击上面按钮，观看视频广告后，即可免费领取，然后复制！'),
('adVideoId', ''),
('examine', '1'),
('ruleImg', ''),
('xcx_name', 'www.njymz.com'),
('shareTitle', ''),
('shareImg', ''),
('payName', '');

ALTER TABLE `kami_class`
  ADD PRIMARY KEY (`cid`);

ALTER TABLE `kami_faka`
  ADD PRIMARY KEY (`kid`);

ALTER TABLE `kami_pay`
  ADD PRIMARY KEY (`trade_no`);

ALTER TABLE `kami_user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `site_config`
  ADD PRIMARY KEY (`k`);

ALTER TABLE `kami_class`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类名ID';

ALTER TABLE `kami_faka`
  MODIFY `kid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `kami_user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;