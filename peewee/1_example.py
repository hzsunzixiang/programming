#!/usr/bin/env python
# -*- coding:UTF-8

import peewee
from peewee import * 
import datetime
user = 'root'
password = '123456'
#db_name = 'peewee_demo'
db_name = 'peewee_test'

dbhandle = peewee.MySQLDatabase(
    db_name, user=user,
    password=password,
    host='localhost'
)
print dbhandle

#class Teacher(peewee.Model):
class Teacher(Model):
    name=peewee.CharField(max_length=50) #varchar(50)
    age=peewee.IntegerField()            #int
    birthday=peewee.DateTimeField()      #时间格式
	
    class Meta:
        database=dbhandle                #这个Teacher模型使用"xxx"数据库


Teacher.create_table()


#dbhandle.create_tables([Teacher]) #可同时创建多个


# 这里自动插入了 id 字段
#  `id` int(11) NOT NULL AUTO_INCREMENT,

#MariaDB [peewee_test]> show tables;
#+-----------------------+
#| Tables_in_peewee_test |
#+-----------------------+
#| teacher               |
#+-----------------------+
#1 row in set (0.00 sec)
#
#MariaDB [peewee_test]> show create table teacher;
#+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#| Table   | Create Table                                                                                                                                                                                                           |
#+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#| teacher | CREATE TABLE `teacher` (
#  `id` int(11) NOT NULL AUTO_INCREMENT,
#  `name` varchar(50) NOT NULL,
#  `age` int(11) NOT NULL,
#  `birthday` datetime NOT NULL,
#  PRIMARY KEY (`id`)
#) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 |
#+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#1 row in set (0.00 sec)


#模型定义
#	  模型类，字段实例和模型实例对应数据库概念：
#
#		  模型类： 数据库表
#		  字段实例：数据库表的列
#		  模型实例：数据库表的行
