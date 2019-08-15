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


#Teacher.create_table()

####################### 增
#T=Teacher()
#T.name='zhangsan'
#T.age=20
#T.birthday=datetime.datetime.now()
#T.save()
#
##或
#T=Teacher(name='lisi',age='40',birthday=datetime.datetime.now())
#T.save()
##或
#T=Teacher().insert(name='wangwu',age=80,birthday=datetime.datetime.now())
#T.execute()
##或
#T=Teacher.create(name='maliu',age=32,birthday=datetime.datetime.now())


###################### 删 
#T=Teacher.delete().where(Teacher.name=='zhangsan')
#T.execute()
##或
#T=Teacher.get(name='lisi')
#T.delete_instance()


###################### 改 
#T=Teacher.update(age=100).where(Teacher.name=='wangwu')
#T.execute()
##或
#T=Teacher().get(name='wangwu')
#T.age=101
#T.save()


###################### 查 
T_list=Teacher.select()
for T in T_list:
	print T.name,T.age,T.birthday

#
######################   查多条
T_list=Teacher.select().where(Teacher.age==32)
for T in T_list:
	print T.name,T.age,T.birthday

######################   查单条 如果不存在会报异常
T_list=Teacher.select().where(Teacher.name=='wangwu')  #返回是list
for T in T_list:
	print T.name,T.age,T.birthday
#或
T=Teacher.select().where(Teacher.name=='maliu').get() #返回时单个
print T.name,T.age,T.birthday
#或
T=Teacher.get(Teacher.name=='maliu')
print T.name, T.age, T.birthday





######################  升序 
T_list=Teacher.select().order_by(Teacher.age)
for T in T_list:
	print T.name,T.age,T.birthday

#######################  降序 
#
print("desc \n")
T_list=Teacher.select().order_by(Teacher.age.desc())
for T in T_list:
	print T.name,T.age,T.birthday






print("raw \n")

sql = "select * from teacher where name = 'maliu' and age = 32"
T_list=Teacher.raw(sql)
for T in T_list:
	print T.name,T.age,T.birthday
