# Generated by Django 5.0.3 on 2024-04-29 15:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0005_lastclick'),
    ]

    operations = [
        migrations.AlterField(
            model_name='users',
            name='gender',
            field=models.CharField(max_length=6),
        ),
    ]
