# serializers.py
from rest_framework import serializers
from .models import Orders, Product, Users,Notification

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['name']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ['first_name', 'last_name']

class OrdersSerializer(serializers.ModelSerializer):
    product = ProductSerializer()
    user = UserSerializer()

    class Meta:
        model = Orders
        fields = ['id', 'product', 'user', 'label', 'quantity', 'payment_method', 'billing_address', 'status']



class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = '__all__'
