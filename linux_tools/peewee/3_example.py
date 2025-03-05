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
class Teacher(Model):
    name=peewee.CharField(max_length=50) #varchar(50)
    age=peewee.IntegerField()            #int
    birthday=peewee.DateTimeField()      #时间格式
	
    class Meta:
        database=dbhandle                #这个Teacher模型使用"xxx"数据库




###################### 查 
T_list=Teacher.select()
print T_list.sql()
sql, params = T_list.sql()

for T in T_list:
	print T.name,T.age,T.birthday

print("desc \n")
T_list=Teacher.select().order_by(Teacher.age.desc())
print T_list.sql()
sql, params = T_list.sql()
for T in T_list:
	print T.name,T.age,T.birthday


######################   查单条 如果不存在会报异常
T_list=Teacher.select().where(Teacher.name=='wangwu')  #返回是list
print T_list.sql()
sql, params = T_list.sql()


for T in T_list:
	print T.name,T.age,T.birthday


