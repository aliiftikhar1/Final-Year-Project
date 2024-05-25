
from django.contrib import admin
from django.urls import include, path
from store import views
from .views import NotificationAPIView,DeliveredOrdersList, PendingOrdersList, ProcessingOrdersList, ShippedOrdersList, approve_order, delete_order


urlpatterns = [
    path('api/orders/pending/', PendingOrdersList.as_view(), name='orders-list'),
    path('api/orders/processing/', ProcessingOrdersList.as_view(), name='orders-list'),
    path('api/orders/shipped/', ShippedOrdersList.as_view(), name='orders-list'),
    path('api/orders/delivered/', DeliveredOrdersList.as_view(), name='orders-list'),
    path('api/notifications/<int:user_id>/', views.NotificationAPIView.as_view(), name='notifications_api'),
    path('api/orders/approve/<int:pk>/', approve_order, name='approve-order'),
    path('api/orders/delete/<int:pk>/', delete_order, name='delete-order'),
    path('', views.index, name='index'),
    path('admin/', views.admin, name='admin'),
     path('home', views.home, name='home'),
     path('analytics', views.analytics, name='analytics'),
     path('useranalytics', views.useranalytics, name='useranalytics'),
    path('all_users', views.all_users, name='all_users'),
    path('all_products', views.all_products, name='all_products'),
    path('all_orders', views.all_orders, name='all_orders'),
    path('admin_recommendation_options', views.admin_recommendation_options, name='admin_recommendation_options'),
    path('get_recommendation_graph_data', views.get_recommendation_graph_data, name='get_recommendation_graph_data'),
    path('get_all_recommendations', views.get_all_recommendations, name='get_all_recommendations'),
    path('graph_all_orders', views.graph_all_orders, name='graph_all_orders'),
     path('graph_pending_orders', views.graph_pending_orders, name='graph_pending_orders'),
      path('graph_processing_orders', views.graph_processing_orders, name='graph_processing_orders'),
       path('graph_shipped_orders', views.graph_shipped_orders, name='graph_shipped_orders'),
        path('graph_delivered_orders', views.graph_delivered_orders, name='graph_deliverd_orders'),
         path('generate_reports', views.generate_reports, name='generate_reports'),
        path('download/', views.download_data, name='download_data'),
      path('cart', views.cart, name='cart'),
       path('contactus', views.contactus, name='contactus'),
        path('Recommendation_system', views.Recommendation_system, name='Recommendation_system'),
         path('products', views.products, name='products'),
         path('customerorders', views.customerorders, name='customerorders'),
         path('customerproducts', views.customerproducts, name='customerproducts'),
         path('updatemerchantproduct', views.updatemerchantproduct, name='updatemerchantproducts'),
         path('merchantproducts', views.merchantproducts, name='merchantproducts'),
         path('merchantpage', views.merchantpage, name='merchantpage'),
         path('customerpage', views.customerpage, name='customerpage'),
         path('adminpage', views.adminpage, name='adminpage'),
         path('logisticpage', views.logisticpage, name='logisticpage'),
         path('logout', views.Logout, name='logout'),
         path('login', views.Login, name='login'),
         path('customer_login', views.customer_login, name='customer_login'),
         path('merchant_login', views.merchant_login, name='merchant_login'),
         path('admin_login', views.admin_login, name='admin_login'),
         path('logistic_login', views.logistic_login, name='logistic_login'),
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
         path('save_user_interest/', views.save_user_interest, name='save_user_interest'),
]