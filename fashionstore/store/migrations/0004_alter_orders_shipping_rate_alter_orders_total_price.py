# Generated by Django 5.0.3 on 2024-05-25 04:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0003_orders_shipping_rate_orders_total_price'),
    ]

    operations = [
        migrations.AlterField(
            model_name='orders',
            name='shipping_rate',
            field=models.DecimalField(decimal_places=2, max_digits=10),
        ),
        migrations.AlterField(
            model_name='orders',
            name='total_price',
            field=models.DecimalField(decimal_places=2, max_digits=10),
        ),
    ]
