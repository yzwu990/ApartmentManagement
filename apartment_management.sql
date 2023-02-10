/*
Apartment
*********************************************************************
*/


SET NAMES utf8;

CREATE DATABASE IF NOT EXISTS`apartment_management`DEFAULT CHARACTER SET utf8;

USE `apartment_management`;

/*Table structure for table `tb_activity` */

DROP TABLE IF EXISTS `tb_activity`;

CREATE TABLE `tb_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Activity ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT 'Name of the Belonging Community',
  `community_id` int(11) DEFAULT NULL COMMENT 'ID of the Belonging Community',
  `title` varchar(100) DEFAULT NULL COMMENT 'Activity Title',
  `address` varchar(200) DEFAULT NULL COMMENT 'Activity Location',
  `organizer` varchar(100) DEFAULT NULL COMMENT 'Organizing Unit',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Activity Start Time',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Activity End Time',
  `status` char(1) DEFAULT '0' COMMENT 'Status: 0-Activity Not Started (default), 1-Activity In Progress, 2-Activity Completed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Activity Table';

/*Data for the table `tb_activity` */

/*Table structure for table `tb_building` */

DROP TABLE IF EXISTS `tb_building`;

CREATE TABLE `tb_building` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Building ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT 'Name of the Belonging Community',
  `community_id` int(11) DEFAULT NULL COMMENT 'ID of the Belonging Community',
  `name` varchar(50) DEFAULT NULL COMMENT 'Building Name',
  `total_households` int(11) DEFAULT NULL COMMENT 'Total Households',
  `description` varchar(500) DEFAULT NULL COMMENT 'Description',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Building Table';

/*Data for the table `tb_building` */

/*Table structure for table `tb_car` */

DROP TABLE IF EXISTS `tb_car`;

CREATE TABLE tb_car (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Car ID',
picture varchar(100) DEFAULT NULL COMMENT 'Car photo',
tenant_id int(11) DEFAULT NULL COMMENT 'Owned by member (tenant)',
color varchar(10) DEFAULT NULL COMMENT 'Car color',
car_number varchar(20) DEFAULT NULL COMMENT 'License plate number',
remark varchar(500) DEFAULT NULL COMMENT 'Remark',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update time',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Car table';

/*Data for the table `tb_car` */

/*Table structure for table `tb_charge_detail` */

DROP TABLE IF EXISTS `tb_charge_detail`;

CREATE TABLE tb_charge_detail (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Charge Detail ID',
community_id int(11) DEFAULT NULL COMMENT 'Community ID',
community_name varchar(50) DEFAULT NULL COMMENT 'Community Name',
charge_item_id int(11) DEFAULT NULL COMMENT 'Charge Item ID',
charge_item_name varchar(50) DEFAULT NULL COMMENT 'Charge Item Name',
contractor varchar(50) DEFAULT NULL COMMENT 'Contractor Name',
telephone int(20) DEFAULT NULL COMMENT 'Contractor Telephone',
pay_money int(11) DEFAULT NULL COMMENT 'Receivable Amount ($), in cents',
actual_money int(11) DEFAULT NULL COMMENT 'Actual Receipt Amount ($), in cents',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
pay_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Payment Time',
status char(1) DEFAULT '0' COMMENT 'Status: 0-Valid (default), 1-Expired',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Charge Detail Table';

/*Data for the table `tb_charge_detail` */

/*Table structure for table `tb_charge_item` */

DROP TABLE IF EXISTS `tb_charge_item`;

CREATE TABLE `tb_charge_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Charge Item ID',
  `community_id` int(11) DEFAULT NULL COMMENT 'Belonging Community ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT 'Belonging Community Name',
  `code` varchar(20) DEFAULT NULL COMMENT 'Charge Code',
  `name` varchar(50) DEFAULT NULL COMMENT 'Project Name',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
  `money` int(11) DEFAULT NULL COMMENT 'Project Charge Amount (per year), in cents',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Charge Item Table';


/*Data for the table `tb_charge_item` */

/*Table structure for table `tb_community` */

DROP TABLE IF EXISTS `tb_community`;

CREATE TABLE tb_community (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Community ID',
code varchar(20) NOT NULL COMMENT 'Community Code',
name varchar(50) NOT NULL COMMENT 'Community Name',
address varchar(200) DEFAULT NULL COMMENT 'Address',
area double DEFAULT NULL COMMENT 'Area (m2)',
total_buildings int(11) DEFAULT NULL COMMENT 'Total Number of Buildings',
total_households int(11) DEFAULT NULL COMMENT 'Total Number of Households',
greening_rate int(11) DEFAULT NULL COMMENT 'Greening Rate (%)',
thumbnail varchar(200) DEFAULT NULL COMMENT 'Thumbnail',
developer varchar(100) DEFAULT NULL COMMENT 'Developer Name',
apartment_company varchar(100) DEFAULT NULL COMMENT 'Property Company Name',
create_time timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NULL DEFAULT NULL COMMENT 'Update Time',
status char(1) DEFAULT '0' COMMENT 'Status: 0-Enabled (default), 1-Disabled',
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Community Table';

/*Data for the table `tb_community` */

insert  into `tb_community`(`id`,`code`,`name`,`address`,`area`,`total_buildings`,`total_households`,`greening_rate`,`thumbnail`,`developer`,`apartment_company`,`create_time`,`update_time`,`status`) values (1,'HX19960101001','A','aaa',22222,66,2432,30,'/fileupload/d2cea885-a986-463a-97da-7073c9e6fbf6.jpg','a1','aa1','2020-12-13 09:12:04','2020-12-13 09:26:12','0');
insert  into `tb_community`(`id`,`code`,`name`,`address`,`area`,`total_buildings`,`total_households`,`greening_rate`,`thumbnail`,`developer`,`apartment_company`,`create_time`,`update_time`,`status`) values (2,'DH19960101002','B','bbb',33000,50,2222,40,'/images/dongfeng.jpg','b1','bb1','2020-12-13 09:24:42','2020-12-13 09:26:14','0');
insert  into `tb_community`(`id`,`code`,`name`,`address`,`area`,`total_buildings`,`total_households`,`greening_rate`,`thumbnail`,`developer`,`apartment_company`,`create_time`,`update_time`,`status`) values (3,'BH19960101003','C','ccc',44444,88,3000,50,'/fileupload/e6daae7d-17f6-4053-9e44-81cf5a4c5d82.jpg','c1','cc1','2020-12-13 09:24:42','2020-12-13 09:24:42','0');
insert  into `tb_community`(`id`,`code`,`name`,`address`,`area`,`total_buildings`,`total_households`,`greening_rate`,`thumbnail`,`developer`,`apartment_company`,`create_time`,`update_time`,`status`) values (28,'JYHF20160101001','D','ddd',66666,66,2195,35,'/fileupload/1faae278-4fc7-4561-b1bf-3770f0a7c75c.jpg','d1','dd1','2020-12-14 19:29:48',NULL,'0');

/*Table structure for table `tb_complaint` */

DROP TABLE IF EXISTS `tb_complaint`;

CREATE TABLE tb_complaint (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Complaint ID',
community_name varchar(50) DEFAULT NULL COMMENT 'Belonging Community Name',
community_id int(11) DEFAULT NULL COMMENT 'Belonging Community ID',
tenant_id int(11) DEFAULT NULL COMMENT 'Complaint Person (tenant) ID',
tenant_name varchar(40) DEFAULT NULL COMMENT 'Complaint Person (tenant) Name',
description varchar(500) DEFAULT NULL COMMENT 'Complaint Description',
reason varchar(100) DEFAULT NULL COMMENT 'Reason for Complaint',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
status char(1) DEFAULT '0' COMMENT 'Status: 0-Unaccepted, 1-Accepted (default), 2-Processed',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Complaint Table';

/*Data for the table `tb_complaint` */

/*Table structure for table `tb_device` */

DROP TABLE IF EXISTS `tb_device`;

CREATE TABLE tb_device (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Device ID',
community_name varchar(50) DEFAULT NULL COMMENT 'Community Name',
community_id int(11) DEFAULT NULL COMMENT 'Community ID',
code varchar(20) DEFAULT NULL COMMENT 'Device Code',
name varchar(50) DEFAULT NULL COMMENT 'Device Name',
brand varchar(40) DEFAULT NULL COMMENT 'Device Brand',
unit_price int(11) DEFAULT NULL COMMENT 'Unit Price ($)',
num int(11) DEFAULT NULL COMMENT 'Quantity Purchased',
expected_useful_life int(11) DEFAULT NULL COMMENT 'Expected Useful Life (Years)',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
purchase_date timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Purchase Date',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Device Table';

/*Data for the table `tb_device` */

/*Table structure for table `tb_apartment_manager` */

DROP TABLE IF EXISTS `tb_apartment_manager`;

CREATE TABLE tb_apartment_manager (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Apartment Manager ID',
community_name varchar(50) DEFAULT NULL COMMENT 'Community Name',
community_id int(11) DEFAULT NULL COMMENT 'Community ID',
login_name varchar(20) DEFAULT NULL COMMENT 'Login Name: Name used for login',
name varchar(50) DEFAULT NULL COMMENT 'Real Name',
password varchar(60) DEFAULT NULL COMMENT 'Password',
telephone int(20) DEFAULT NULL COMMENT 'Telephone',
email varchar(50) DEFAULT NULL COMMENT 'Email',
role_id int(11) DEFAULT '0' COMMENT 'Role ID: 0-Ordinary user (default 0), 1-Admin user',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Apartment Manager Table';

/*Data for the table `tb_apartment_manager` */

insert  into `tb_apartment_manager`(`id`,`community_name`,`community_id`,`login_name`,`name`,`password`,`telephone`,`email`,`role_id`,`create_time`,`update_time`) values (1,'A',1,'15900000000','Tom','123456',2147483647,'123@gmail.com',0,'2020-12-14 10:17:49','2020-12-14 10:17:49');
insert  into `tb_apartment_manager`(`id`,`community_name`,`community_id`,`login_name`,`name`,`password`,`telephone`,`email`,`role_id`,`create_time`,`update_time`) values (2,'B',3,'15911111111','Jerry','123456',2147483647,'456@gmail.com',0,'2020-12-14 10:17:55','2020-12-14 10:17:55');
insert  into `tb_apartment_manager`(`id`,`community_name`,`community_id`,`login_name`,`name`,`password`,`telephone`,`email`,`role_id`,`create_time`,`update_time`) values (3,'C',2,'15922222222','Lucas','123456',2147483647,'789@gmail.com',0,'2020-12-14 10:18:03','2020-12-14 10:18:03');

/*Table structure for table `tb_house` */

DROP TABLE IF EXISTS `tb_unit`;

CREATE TABLE tb_unit (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'House ID',
community_name varchar(50) DEFAULT NULL COMMENT 'Community Name',
community_id int(11) DEFAULT NULL COMMENT 'Community ID',
building_name varchar(50) DEFAULT NULL COMMENT 'Building Name',
building_id int(11) DEFAULT NULL COMMENT 'Building ID',
code varchar(50) DEFAULT NULL COMMENT 'Property Code',
name varchar(100) DEFAULT NULL COMMENT 'Property Name',
tenant_id int(11) DEFAULT NULL COMMENT 'tenant ID',
tenant_name varchar(50) DEFAULT NULL COMMENT 'tenant  Name',
telephone int(20) DEFAULT NULL COMMENT 'Contact Information',
room_num int(11) DEFAULT NULL COMMENT 'Number of Rooms',
unit int(2) DEFAULT NULL COMMENT 'Unit',
floor int(3) DEFAULT NULL COMMENT 'Floor',
description varchar(500) DEFAULT NULL COMMENT 'Description',
live_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Check-in Time',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='House Table';

/*Data for the table `tb_house` */

/*Table structure for table `tb_letter` */

DROP TABLE IF EXISTS `tb_letter`;

CREATE TABLE tb_letter (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Letter ID',
community_id int(11) DEFAULT NULL COMMENT 'Community ID',
community_name varchar(50) DEFAULT NULL COMMENT 'Community Name',
tenant_id int(11) DEFAULT NULL COMMENT 'Sender (tenant) ID',
tenant_name varchar(50) DEFAULT NULL COMMENT 'Sender (tenant) Name',
origin char(1) DEFAULT '0' COMMENT 'Letter Origin: 0-Mailbox (default), 1-Email, 2-WeChat, 3-Public account, 4-App, 5-PC',
title varchar(100) DEFAULT NULL COMMENT 'Letter Title',
content varchar(2000) DEFAULT NULL COMMENT 'Letter Content',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
status char(1) DEFAULT '0' COMMENT 'Status: 0-Unread (default), 1-Read',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Letter Table';

/*Data for the table `tb_letter` */

/*Table structure for table `tb_tenant` */

DROP TABLE IF EXISTS `tb_tenant`;

CREATE TABLE tb_tenant (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'tenant ID',
community_id int(11) DEFAULT NULL COMMENT 'Belonging Community',
unit_id int(11) DEFAULT NULL COMMENT 'Belonging Unit',
name varchar(50) DEFAULT NULL COMMENT 'Member Name',
picture varchar(100) DEFAULT NULL COMMENT 'Member Photo',
idcard varchar(18) DEFAULT NULL COMMENT 'ID Card Number',
telephone int(20) DEFAULT NULL COMMENT 'Contact Information',
profession varchar(20) DEFAULT NULL COMMENT 'Occupation',
sex char(1) DEFAULT '0' COMMENT 'Gender:0-Male (default), 1-Female',
type char(1) DEFAULT '0' COMMENT 'Type:0-unit tenant (default), 1-Renter',
remark varchar(200) DEFAULT 'None' COMMENT 'Remarks (default None)',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
birthday timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of Birth',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tenant Table';

/*Data for the table `tb_tenant` */

/*Table structure for table `tb_parking` */

DROP TABLE IF EXISTS `tb_parking`;

CREATE TABLE tb_parking (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Parking ID',
community_name varchar(50) DEFAULT NULL COMMENT 'Community Name',
community_id int(11) DEFAULT NULL COMMENT 'Community ID',
picture varchar(100) DEFAULT NULL COMMENT 'Parking Picture',
code varchar(20) DEFAULT NULL COMMENT 'Parking Code',
name varchar(50) DEFAULT NULL COMMENT 'Parking Name',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Parking Table';

/*Data for the table `tb_parking` */

/*Table structure for table `tb_parking_use` */

DROP TABLE IF EXISTS `tb_parking_use`;

CREATE TABLE tb_parking_use (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Parking Use ID',
community_name varchar(50) DEFAULT NULL COMMENT 'Community Name',
community_id int(11) DEFAULT NULL COMMENT 'Community ID',
code varchar(20) DEFAULT NULL COMMENT 'Parking Spot Code',
car_number varchar(20) DEFAULT NULL COMMENT 'Car Plate Number',
picture varchar(100) DEFAULT NULL COMMENT 'Vehicle License (Picture)',
tenant_name varchar(50) DEFAULT NULL COMMENT 'Vehicle Owner (tenant) Name',
tenant_id int(11) DEFAULT NULL COMMENT 'Vehicle Owner (tenant) ID',
telephone int(20) DEFAULT NULL COMMENT 'Contact Information',
use_type char(1) DEFAULT '0' COMMENT 'Use Properties: 0-Purchase (default), 1-Monthly Rent, 2-Annual Rent',
total_fee int(11) DEFAULT NULL COMMENT 'Total Cost (¥), in cents',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
start_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '(Use) Start Time',
end_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '(Use) End Time',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Parking Use Table';

/*Data for the table `tb_parking_use` */

/*Table structure for table `tb_pet` */

DROP TABLE IF EXISTS `tb_pet`;

CREATE TABLE tb_pet (
id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Pet ID',
picture varchar(100) DEFAULT NULL COMMENT 'Pet Photo',
tenant_name varchar(50) DEFAULT NULL COMMENT 'Owner (tenant) Name',
tenant_id int(11) DEFAULT NULL COMMENT 'Owner (tenant) ID',
name varchar(50) DEFAULT NULL COMMENT 'Pet Name',
color varchar(10) DEFAULT NULL COMMENT 'Pet Color',
remark varchar(500) DEFAULT NULL COMMENT 'Remarks',
create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
update_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
adopt_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Adoption Time',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet Table';

/*Data for the table `tb_pet` */

/*Table structure for table `tb_repair` */

DROP TABLE IF EXISTS `tb_repair`;

CREATE TABLE `tb_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Maintenance ID',
  `community_name` varchar(50) DEFAULT NULL COMMENT 'Community Name',
  `community_id` int(11) DEFAULT NULL COMMENT 'Community ID',
  `building_name` varchar(50) DEFAULT NULL COMMENT 'Building Name',
  `building_id` int(11) DEFAULT NULL COMMENT 'Building ID',
  `tenant_name` varchar(50) DEFAULT NULL COMMENT 'Reporter Name (tenant)',
  `tenant_id` int(11) DEFAULT NULL COMMENT 'Reporter ID (tenant)',
  `device_name` varchar(50) DEFAULT NULL COMMENT 'Device Name',
  `device_id` int(11) DEFAULT NULL COMMENT 'Device ID',
  `description` varchar(500) DEFAULT NULL COMMENT 'Report Description',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
  `status` char(1) DEFAULT '0' COMMENT 'Status: 0-Pending, 1-Accepted, 2-Repaired',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repair Table';


/*Data for the table `tb_repair` */

