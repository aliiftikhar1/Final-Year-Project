
from django.contrib import admin
from django.urls import include, path
from store import views

urlpatterns = [
    
    path('', views.index, name='index'),
      path('cart', views.cart, name='cart'),
       path('contactus', views.contactus, name='contactus'),
        path('Recommendation_system', views.Recommendation_system, name='Recommendation_system'),
         path('products', views.products, name='products'),
         path('customerproducts', views.customerproducts, name='customerproducts'),
         path('updatemerchantproduct', views.updatemerchantproduct, name='updatemerchantproducts'),
         path('merchantproducts', views.merchantproducts, name='merchantproducts'),
         path('merchantpage', views.merchantpage, name='merchantpage'),
         path('customerpage', views.customerpage, name='customerpage'),
         path('logout', views.Logout, name='logout'),
         path('login', views.Login, name='login'),
         path('register', views.register, name='register'),
         path('add_product', views.add_product, name='add_product'),
         path('merchantadd_product', views.merchantadd_product, name='merchantadd_product'),
         path('products', views.products, name='products'),
         path('delete_merchant_product', views.delete_merchant_product, name='delete_merchant_product'),
         path('recommendations', views.recommendations_view, name='recommedations_view'),
        # path('add_to_cart', views.add_to_cart, name='add_to_cart'),
         path('orders', views.orders, name='orders'),
         path('products_by_category/<str:category>', views.products_by_category, name='products_by_category'),
         path('product_detail/<int:product_id>/', views.product_detail, name='product_detail'),
         path('add_to_cart', views.add_to_cart, name='add_to_cart'),  # Include the add_to_cart view here
         path('payment', views.payment_view, name='payment'),

]

