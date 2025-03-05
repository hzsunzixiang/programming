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


class BaseModel(Model):
    class Meta:
        database = dbhandle


class Category(BaseModel):
    id = PrimaryKeyField(null=False)
    name = CharField(max_length=100)

    created_at = DateTimeField(default=datetime.datetime.now())
    updated_at = DateTimeField(default=datetime.datetime.now())

    class Meta:
        db_table = "categories"
        order_by = ('created_at',)
