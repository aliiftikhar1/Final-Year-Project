from django.contrib import admin
from .models import Orders, Users, Product, CartItem, Contact

@admin.register(Users)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'role', 'email', 'phone_number' , 'location', 'city', 'age', 'gender', 'password')
    search_fields = ('first_name', 'last_name', 'email')

@admin.register(Product)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'discount_price' , 'description', 'image')
    search_fields = ('name','price')

@admin.register(CartItem)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'product', 'quantity')
    search_fields = ('user','product', 'quantity')

@admin.register(Orders)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user','product', 'quantity','payment_method','card_number','expiry_date','cvv','card_holder_name','billing_address')
    search_fields = ('user','product')


# @admin.register(Cart)
# class UserProfileAdmin(admin.ModelAdmin):
#     list_display = ('name', 'price','seller', 'description', 'image')
#     search_fields = ('name','seller')

@admin.register(Contact)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'message')
    search_fields = ('name','email')