# Generated by Django 5.0.3 on 2024-05-25 04:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0002_notification'),
    ]

    operations = [
        migrations.AddField(
            model_name='orders',
            name='shipping_rate',
            field=models.PositiveIntegerField(default=1, null=True),
        ),
        migrations.AddField(
            model_name='orders',
            name='total_price',
            field=models.PositiveIntegerField(default=1, null=True),
        ),
    ]