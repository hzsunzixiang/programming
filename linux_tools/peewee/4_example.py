#!/usr/bin/env python
# -*- coding:UTF-8
#https://blog.codecp.org/2017/10/20/ORM%E6%A1%86%E6%9E%B6peewee%E7%9A%84%E4%BD%BF%E7%94%A8%E4%BB%8B%E7%BB%8D/
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
class TeacherTest(Model):
    name=peewee.CharField(max_length=50) #varchar(50)
    age=peewee.IntegerField()            #int
    birthday=peewee.DateTimeField()      #时间格式
	
    class Meta:
        database=dbhandle                #这个Teacher模型使用"xxx"数据库


#TeacherTest.create_table()
TeacherTest.drop_table()


