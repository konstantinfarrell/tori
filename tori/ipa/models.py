import os, sys
from django.db import models

class Character(models.Model):

    char_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, unique=True)
    code = models.CharField(max_length=40, unique=True)
    key_binding = models.CharField(max_length=2, null=True)
    english = models.BooleanField(default=False)

    class Meta:
        db_table = "character"


class Consonant(Character):

    consonant_id = models.AutoField(primary_key=True)
    place_OA = models.CharField(max_length=40)
    manner_OA = models.CharField(max_length=40)
    voiced = models.BooleanField(default=False)
    nasal = models.BooleanField(default=False)

    class Meta:
        db_table = "consonant"


class Vowel(Character):

    vowel_id = models.AutoField(primary_key=True)
    height = models.CharField(max_length=40)
    frontness = models.CharField(max_length=40)
    roundness = models.BooleanField(default=False)
    tense = models.BooleanField(default=False)

    class Meta:
        db_table = "vowel"
