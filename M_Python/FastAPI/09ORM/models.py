# 选课系统

from tortoise.models import Model
from tortoise import fields

class Student(Model):
    id = fields.IntField(pk=True)
    name = fields.CharField(max_length=32, description="姓名")
    pwd = fields.CharField(max_length =32, description="密码")
    sno = fields.IntField(description="学号")

    # 一对多关系
    clas = fields.ForeignKeyField("models.Clas", related_name="students")
    # 多对多关系
    courseS = fields.ManyToManyField("models.Course", related_name="students")

class Course(Model):
    id = fields.IntField(pk = True)
    name = fields.CharField(max_length=32, description="课程名称")
    teacher = fields.ForeignKeyField("models.")

class clas(Model):
    id = fields.IntField(pk = True)
    name = fields.CharField(max_length=32, descriptin="班级名称")

class Teacher(Model):
    id = fields.IntField(pk = True)
    name = fields.CharField(max_length=32, description="姓名")
    pws = fields.CharField(max_length=32, description="密码")
    tno = fields.IntField(description="老师编号")




