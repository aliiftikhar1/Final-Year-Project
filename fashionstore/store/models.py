from django.db import models
from django.contrib.auth.models import AbstractUser,BaseUserManager
from .manager import *
from datetime import datetime

class Users(AbstractUser):
    ROLE_CHOICES = (
        (1, 'Customer'),
        (2, 'Merchant'),
    )
    username = None
    
    image = models.ImageField(upload_to='profile_images/', null=True ,default=None)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    role = models.IntegerField(default = 1, choices=ROLE_CHOICES )
    gender = models.CharField(max_length=6)
    age = models.IntegerField(null=True)
    interests = models.CharField(max_length=100,null=True)
    location = models.CharField(max_length=100,null=True)
    city = models.CharField(max_length=100,null=True)
    phone_number = models.CharField(max_length=15,null=True)
    email = models.EmailField(unique=True)
    

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []  # Add any other required fields here

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    def update_user(self, **kwargs):
        for field, value in kwargs.items():
            setattr(self, field, value)
        self.save()


class Product(models.Model):
    GENDER_CHOICES = (
        ('Male', 'Male'),
        ('Female', 'Female'),
    )
    id=models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    seller = models.ForeignKey(Users, on_delete=models.CASCADE)
    gender = models.CharField(max_length=6, choices=GENDER_CHOICES)
    label = models.CharField(max_length=20)
    category = models.CharField(max_length=50)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    discount_price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='products/',max_length=250, null=True, default=None)  # You need to install Pillow for handling images

    def __str__(self):
        return self.name 
    
    def update_product(self, **kwargs):
        for field, value in kwargs.items():
            setattr(self, field, value)
        self.save()
    def delete_product(self, **kwargs):
        for field, value in kwargs.items():
            setattr(self, field, value)
        self.delete()
# class Cart(models.Model):
#     name = models.CharField(max_length=100)
#     category = models.CharField(max_length=50)
#     description = models.TextField()
#     price = models.DecimalField(max_digits=10, decimal_places=2)
#     discount_price = models.DecimalField(max_digits=10, decimal_places=2)
#     image = models.ImageField(upload_to='cart/',max_length=250, null=True, default=None)  # You need to install Pillow for handling images

#     def __str__(self):
#         return self.name      
    

class lastclick(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    product_clicked = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.first_name

class CartItem(models.Model):
    user =  models.ForeignKey(Users, on_delete=models.CASCADE)
    product =  models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    def subtotal(self):
        return self.product.price * self.quantity
    
class Orders(models.Model):
    user = models.CharField(max_length=100)
    product =  models.CharField(max_length=200)
    quantity = models.PositiveIntegerField(default=1,null=True)
    payment_method = models.CharField(max_length=20)
    card_number = models.CharField(max_length=16, blank=True, null=True)
    expiry_date = models.CharField(max_length=5, blank=True, null=True)
    cvv = models.CharField(max_length=4, blank=True, null=True)
    card_holder_name = models.CharField(max_length=100, blank=True, null=True)
    billing_address = models.TextField(null=True)



class Contact(models.Model):
    name = models.CharField(max_length=122)
    email = models.EmailField(max_length=254)
    subject = models.CharField(max_length=254)
    message = models.TextField()
    date = models.DateField(default=datetime.today)  # Use datetime.today as the default value

    def __str__(self):
     return self.name