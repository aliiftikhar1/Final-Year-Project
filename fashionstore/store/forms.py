# forms.py
from django import forms
from .models import Product

# class UserRegistrationForm(forms.ModelForm):
#     password = forms.CharField(widget=forms.PasswordInput)

#     class Meta:
#         model = CustomUser
#         fields = ['profile_image', 'first_name', 'last_name', 'role', 'gender', 'age', 'interest', 'country', 'city', 'phone_number', 'email', 'password']

# class UserLoginForm(forms.Form):
#     email = forms.EmailField()
#     password = forms.CharField(widget=forms.PasswordInput)



class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['id','name', 'category', 'description', 'price', 'discount_price', 'image']
