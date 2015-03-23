import os, sys
from django.db import models

# Create your models here.
class Character(models.Model):

    char_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, unique=True)
    code = models.CharField(max_length=40, unique=True)

    class Meta:
        db_table = "character"
