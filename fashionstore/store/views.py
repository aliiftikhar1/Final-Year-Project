
from decimal import Decimal
import json
from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseNotFound, HttpResponseRedirect, JsonResponse
from django.contrib.auth import logout
import csv
from datetime import datetime
from django.views import View
from django.db.models import Count
import pandas as pd
from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth import login
from django.contrib import messages
import pandas as pd
from django.contrib.auth import authenticate
import joblib
from .models import Dataset, Orders, Recommendations, Users, Product, CartItem,Contact, Notification
from .models import CartItem, Product, lastclick
from django.contrib.auth.models import AnonymousUser
from rest_framework import generics
from rest_framework import status
from django.contrib.auth.decorators import login_required
from .forms import UserUpdateForm
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import OrdersSerializer


def index(request):
     if isinstance(request.user, AnonymousUser):
         return render(request, 'index.html')
     else:
         user= request.user
         if user.role == 1:
             return redirect('customerpage')
         elif user.role == 2:
             return redirect('merchantpage')
         elif user.role == 3:
             return redirect('logisticpage')
         elif user.role == 0:
             return redirect('adminpage')
         
def customer_login (request):
    
    return render(request, 'customer/customer_login.html')

def merchant_login (request):
    
    return render(request, 'merchant/merchant_login.html')

def admin_login (request):
    
    return render(request, 'admin/admin_login.html')
def logistic_login (request):
    
    return render(request, 'logistic/logistic_login.html')

def admin(request):
    return render(request, 'admin/dashboard.html')

@login_required
def view_profile(request):
    user = request.user
    return render(request, 'view_profile.html', {'user': user})

@login_required
def update_profile(request):
    user = request.user
    if request.method == 'POST':
        form = UserUpdateForm(request.POST, request.FILES, instance=user)
        if form.is_valid():
            form.save()
            return redirect('view-profile')
    else:
        form = UserUpdateForm(instance=user)
    return render(request, 'update_profile.html', {'form': form})


def search_results(request):
    user = request.user
    print("searrch page called")
    query = request.GET.get('query', '')
    products = []
    if query:
        products = Product.objects.filter(name__icontains=query) | Product.objects.filter(description__icontains=query)
        if user.role == 0:
            return render(request, 'admin/admin_search.html', {'search': products, 'query': query})
        if user.role == 1:
            return render(request, 'customer/customer_search.html', {'search': products, 'query': query})

def home(request):
    
    total_users = Users.objects.count()
    total_products = Product.objects.count()
    total_new_orders = Orders.objects.filter(status='1').count()
    total_processing_orders = Orders.objects.filter(status='2').count()
    total_shipped_orders = Orders.objects.filter(status='3').count()
    total_delivered_orders = Orders.objects.filter(status='4').count()

    return render(request, 'admin/dashboard.html', {
        'home': 'home page',
        'view': 'home',
        'total_users': total_users,
        'total_products': total_products,
        'total_new_orders': total_new_orders,
        'total_processing_orders': total_processing_orders,
        'total_shipped_orders': total_shipped_orders,
        'total_delivered_orders': total_delivered_orders,
    })

def admin_recommendation_options(request):
    Recommendation = Recommendations.objects.all()
    return render(request, 'admin/admin_recommendation_system_page.html', {'recommendations': Recommendation, 'view': 'recommendations'})

def get_recommendation_graph_data(request):
    recommendations = Recommendations.objects.values('Recommendations')
    product_counts = {}
    for rec in recommendations:
        products = rec['Recommendations'].split(', ')
        for product in products:
            if product in product_counts:
                product_counts[product] += 1
            else:
                product_counts[product] = 1

    labels = list(product_counts.keys())
    counts = list(product_counts.values())

    return render(request, 'admin/admin_recommendation_system_page.html', {
        'graph_labels': labels,
        'graph_counts': counts,
        'view': 'recommendation_graph'
    })

def get_all_recommendations(request):
    recommendations = Recommendations.objects.all()
    return render(request, 'admin/admin_recommendation_system_page.html', {
        'recommendations': recommendations,
        'view': 'recommendations_table'
    })

def analytics(request):
    orders = Orders.objects.all()
    product_sales = {}
    for order in orders:
        product_name = order.label
        quantity = order.quantity
        if product_name in product_sales:
            product_sales[product_name] += quantity
        else:
            product_sales[product_name] = quantity
    
    product_names = list(product_sales.keys())
    quantities = list(product_sales.values())

    print(product_names , quantities)
    return render(request, 'admin/dashboard.html', {
        'analytics': 'analytics page',
        'view': 'analytics',
        'product_names': product_names,
        'quantities': quantities,
    })

def useranalytics(request):
    
    roles = {
        'admin': 0,
        'customer': 0,
        'merchant': 0,
        'logistic': 0
    }

    users = Users.objects.all()
    for user in users:
        if user.role == 0:
            roles['admin'] += 1
        elif user.role == 1:
            roles['customer'] += 1
        elif user.role == 2:
            roles['merchant'] += 1
        elif user.role == 3:
            roles['logistic'] += 1

    role_labels = ['Admin', 'Customer', 'Merchant', 'Logistic']
    role_counts = [roles['admin'], roles['customer'], roles['merchant'], roles['logistic']]
    
    return render(request, 'admin/dashboard.html', {
        'useranalytics': 'user Analytics page',
        'view': 'useranalytics',
        'status': 'User Roles',
        'role_labels': role_labels,
        'role_counts': role_counts,
    })

def graph_all_orders_merchant(request):
    orders = Orders.objects.all()
    product_sales = {}
    for order in orders:
        product_name = order.label
        quantity = order.quantity
        if product_name in product_sales:
            product_sales[product_name] += quantity
        else:
            product_sales[product_name] = quantity
    
    product_names = list(product_sales.keys())
    quantities = list(product_sales.values())
    print("products: ",product_names)
    print("quantities: ",quantities)

    return render(request, 'merchant/merchantpage.html', {
        'analytics': 'analytics page',
        'view': 'analytics',
        'status': 'Sales Graph',
        'product_names': product_names,
        'quantities': quantities,
    })

def all_orders_merchant(request):
    orders = Orders.objects.filter(product__seller = request.user)

    return render(request, 'merchant/merchantpage.html', {
        'all_orders': 'analytics page',
        'view': 'analytics',
        'status': 'All Orders',
        'orders': orders,
    })


def graph_all_orders(request):
    orders = Orders.objects.all()
    product_sales = {}
    for order in orders:
        product_name = order.label
        quantity = order.quantity
        if product_name in product_sales:
            product_sales[product_name] += quantity
        else:
            product_sales[product_name] = quantity
    
    product_names = list(product_sales.keys())
    quantities = list(product_sales.values())

   
    return render(request, 'admin/dashboard.html', {
        'analytics': 'analytics page',
        'view': 'analytics',
        'status': 'All Orders',
        'product_names': product_names,
        'quantities': quantities,
    })
    
def graph_pending_orders(request):
    orders = Orders.objects.filter(status = "1")
    product_sales = {}
    for order in orders:
        product_name = order.label
        quantity = order.quantity
        if product_name in product_sales:
            product_sales[product_name] += quantity
        else:
            product_sales[product_name] = quantity
    
    product_names = list(product_sales.keys())
    quantities = list(product_sales.values())

   
    
    return render(request, 'admin/dashboard.html', {
        'analytics': 'analytics page',
        'view': 'analytics',
        'status': 'New Orders',
        'product_names': product_names,
        'quantities': quantities,
    })

def graph_processing_orders(request):
    orders = Orders.objects.filter(status = "2")
    product_sales = {}
    for order in orders:
        product_name = order.label
        quantity = order.quantity
        if product_name in product_sales:
            product_sales[product_name] += quantity
        else:
            product_sales[product_name] = quantity
    
    product_names = list(product_sales.keys())
    quantities = list(product_sales.values())

    
    return render(request, 'admin/dashboard.html', {
        'analytics': 'analytics page',
        'view': 'analytics',
        'status': 'Processing Orders',
        'product_names': product_names,
        'quantities': quantities,
    })

def graph_shipped_orders(request):
    orders = Orders.objects.filter(status = "3")
    product_sales = {}
    for order in orders:
        product_name = order.label
        quantity = order.quantity
        if product_name in product_sales:
            product_sales[product_name] += quantity
        else:
            product_sales[product_name] = quantity
    
    product_names = list(product_sales.keys())
    quantities = list(product_sales.values())

   
    return render(request, 'admin/dashboard.html', {
        'analytics': 'analytics page',
        'view': 'analytics',
        'status': 'Shipped Orders',
        'product_names': product_names,
        'quantities': quantities,
    })

def graph_delivered_orders(request):
    orders = Orders.objects.filter(status = "4")
    product_sales = {}
    for order in orders:
        product_name = order.label
        quantity = order.quantity
        if product_name in product_sales:
            product_sales[product_name] += quantity
        else:
            product_sales[product_name] = quantity
    
    product_names = list(product_sales.keys())
    quantities = list(product_sales.values())

   
    
    return render(request, 'admin/dashboard.html', {
        'analytics': 'analytics page',
        'view': 'analytics',
        'status': 'Delivered Orders',
        'product_names': product_names,
        'quantities': quantities,
    })

def all_users(request):
    users = Users.objects.all()
    return render(request, 'admin/dashboard.html', {'adminusers': users, 'view': 'users'})

def all_products(request):
    products = Product.objects.all()
    return render(request, 'admin/dashboard.html', {'adminproducts': products, 'view': 'products'})
def all_orders(request):
    orders = Orders.objects.all()
    return render(request, 'admin/dashboard.html', {'adminorders': orders, 'view': 'orders'})

def generate_reports(request):
    return render(request, 'admin/generate_reports.html')



def download_data(request):
    download_type = request.POST.get('download_type')
    
    if download_type == 'dataset':
        queryset = Dataset.objects.all()
        filename = 'dataset.csv'
    elif download_type == 'orders':
        queryset = Orders.objects.all()
        filename = 'orders.csv'
    elif download_type == 'products':
        queryset = Product.objects.all()
        filename = 'products.csv'
    elif download_type == 'users':
        queryset = Users.objects.all()
        filename = 'users.csv'
    elif download_type == 'recommendations':
        queryset = Recommendations.objects.all()
        filename = 'recommendations.csv'
    else:
        # Handle invalid download type
        return HttpResponse("Invalid download type", status=400)
    
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = f'attachment; filename="{filename}"'
    
    # Create a CSV writer object
    writer = csv.writer(response)
    
    # Write header row based on the model fields
    writer.writerow([field.name for field in queryset.model._meta.fields])
    
    # Write data rows
    for obj in queryset:
        writer.writerow([getattr(obj, field.name) for field in queryset.model._meta.fields])
    
    return response


def cart(request):
     user = request.user
     cuser = Users.objects.raw("SELECT * FROM store_users WHERE email = %s", [user])
     for i in cuser:
         requt = i.id
     cart_items = CartItem.objects.filter(user_id= requt)
     return render(request, 'customer/customercart.html',{'cart_items': cart_items})

def contactus(request):
    return render(request, 'contactus.html')

def products(request):
    user = request.GET.get('value1')
    products = Product.objects.all()
    # Pass the products queryset to the template context
    return render(request, 'products.html', {'products': products, 'user':user})

def clickeditem(request, product_id):
    user = request.user
    product = get_object_or_404(Product, id=product_id)

    # Check if a record for the current user already exists
    existing_record = lastclick.objects.filter(user=user).first()

    if existing_record:
        # If a record exists, update the product_clicked field
        existing_record.product_clicked = product
        existing_record.save()
    else:
        # If no record exists, create a new one
        last_click = lastclick.objects.create(user=user, product_clicked=product)
        last_click.save()

def delete_merchant_product(request):
    if request.method == 'POST':
        product_id = request.POST.get('id')
        try:
            product = Product.objects.get(id=product_id)
            print(product)
            product.delete_product(name=product)
            # Redirect to a success page or refresh the current page
            if request.user.role == 2:
                return redirect('merchantproducts')
            if request.user.role == 0:
                return redirect('all_products')
        except Product.DoesNotExist:
            return HttpResponseNotFound('Product does not exist')
    else:
        return HttpResponseNotAllowed(['POST'])

def customerproducts(request):
    user = request.user
    products = Product.objects.filter(seller_id=user.id)
    # Pass the products queryset to the template context
    return render(request, 'customer/customerproducts.html', {'products': products})

def product_detail(request, product_id):
    clickeditem(request, product_id)
    product = get_object_or_404(Product, id=product_id)
    print(product)
    return render(request, 'customer/product_detail.html', {'product': product})

def merchantproducts(request):
    user = request.user
    products = Product.objects.filter(seller_id=user.id)
    # Pass the products queryset to the template context
    return render(request, 'merchant/merchantproducts.html', {'products': products})

def merchantpage(request):
    return render(request, 'merchant/merchantpage.html')

def get_current_season():
    month = datetime.now().month
    day = datetime.now().day

    if (month == 12 and day >= 21) or (month == 1) or (month == 2) or (month == 3 and day < 20):
        return "Winter"
    elif (month == 3 and day >= 20) or (month == 4) or (month == 5) or (month == 6 and day < 21):
        return "Spring"
    elif (month == 6 and day >= 21) or (month == 7) or (month == 8) or (month == 9 and day < 22):
        return "Summer"
    elif (month == 9 and day >= 22) or (month == 10) or (month == 11) or (month == 12 and day < 21):
        return "Autumn"


# def getpersonalizedrecommendations(user):
#     age = user.age,
#     gender = user.gender,
#     if(gender== '1'):
#         gender = "Male"
#     if(gender== '0'):
#         gender = "Female"
#     location = user.city,
#     season = get_current_season(),
#     category = user.interest_in,
    
#     print(user,age,gender,location,category)
    
#     # user_interest = request.POST.get('user_interest')
#     # Calculate recommended items based on user interest and preferences    

#     if location in ['Kentucky', 'Maine', 'Massachusetts', 'Rhode Island', 'Oregon', 'Wyoming',
#         'Montana', 'Louisiana', 'West Virginia', 'Missouri', 'Arkansas', 'Hawaii',
#         'Delaware', 'New Hampshire', 'New York', 'Alabama', 'Mississippi',
#         'North Carolina', 'California', 'Oklahoma', 'Florida', 'Texas', 'Nevada',
#         'Kansas', 'Colorado', 'North Dakota', 'Illinois', 'Indiana', 'Arizona',
#         'Alaska', 'Tennessee', 'Ohio', 'New Jersey', 'Maryland', 'Vermont',
#         'New Mexico', 'South Carolina', 'Idaho', 'Pennsylvania', 'Connecticut', 'Utah',
#         'Virginia', 'Georgia', 'Nebraska', 'Iowa', 'South Dakota', 'Minnesota',
#         'Washington', 'Wisconsin', 'Michigan']:
#         model = joblib.load('AI models/knn_personalzied_recommendation.pkl')
#         data = pd.read_csv("AI models/your_dataset.csv") 
#         data = pd.get_dummies(data, columns=['Gender', 'Category', 'Location', 'Season'])
#         X = data.drop(columns=['Item Purchased']) 
#         new_input = pd.DataFrame({'Age': [age], 'Gender_' + gender: [1], 'Category_' + category: [1],
#                                'Location_' + location: [1], 'Season_' + season: [1]})
#         new_input = new_input.reindex(columns=X.columns, fill_value=0)
#         scaler = joblib.load('AI models/scaler.pkl')
#     else:
#         model = joblib.load('AI models/knn_personalzied_recommendation(no location).pkl')
#         data = pd.read_csv("AI models/your_dataset.csv") 
#         data = pd.get_dummies(data, columns=['Gender', 'Category', 'Season'])
#         X = data.drop(columns=['Item Purchased','Location']) 
#         print("x : ", X.columns)
#         new_input = pd.DataFrame({'Age': [age], 'Gender_' + gender: [1], 'Category_' + category: [1],
#                                    'Season_' + season: [1]})
#         new_input = new_input.reindex(columns=X.columns, fill_value=0)
#         print("NEW INPUT",new_input)
#         scaler = joblib.load('AI models/scaler(nolocation).pkl')
        
    
    
#     new_input = scaler.transform(new_input)
#     new_input_probs = model.predict_proba(new_input)
#     top_10_indices = new_input_probs.argsort()[0][-10:][::-1]
#     recommendations = model.classes_[top_10_indices]
#     products = Product.objects.all()
#     print(recommendations)

#     # Save recommendations to the database
#     recommendation_str = ", ".join(recommendations)  # Convert list of recommendations to a comma-separated string
#     new_recommendation = Recommendations(
#         Gender=gender,
#         Age=age,
#         Interest = category,
#         Location=location,
#         Recommendations=recommendation_str,
#         Season= season,
#         Date=datetime.today()
#     )
#     new_recommendation.save()
    
#     return recommendations, products


# Function to get recommendations based on item name
def get_click_recommendations(item_name):
    
    df = pd.read_csv("AI models/your_dataset.csv")
    loaded_model = joblib.load('AI models/clickrecommendation.pkl')
    # Get the index of the item that matches the name
    idx = df[df['Item Purchased'] == item_name].index[0]

    # Get the pairwise similarity scores of all items with that item
    sim_scores = list(enumerate(loaded_model[idx]))

    # Sort the items based on the similarity scores
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)

    # Get the top 5 most similar items
    sim_scores = sim_scores[1:6]

    # Get the item indices
    item_indices = [i[0] for i in sim_scores]

    # Return the top 5 most similar items
    return df.iloc[item_indices]['Item Purchased'].unique().tolist()
    # Return the top 5 most similar items
    # print(clickrecs)
    # return clickrecs
    # return df.iloc[item_indices]['Item Purchased'].unique().tolist()




def customerpage(request):
    return render(request, 'customer/customerpage.html')

def adminpage(request):
    return render(request, 'admin/dashboard.html')
def logisticpage(request):
    return render(request, 'logistic/logisticpage.html')

def updatemerchantproduct(request):
    if request.method == "POST":
        id = request.POST.get('id')
        name = request.POST.get('name')
        description = request.POST.get('description')
        price = request.POST.get('price')
        discount_price = request.POST.get('discount_price')
        product = Product.objects.get(pk=id)  # Assuming you have the product primary key or some other identifier
        product.update_product(name=name,description=description, price=price, discount_price=discount_price)
        if request.user.role == 2:
            return redirect('merchantproducts')
        if request.user.role == 0:
            return redirect('all_products')
    return redirect('merchantproducts')




def products_by_category(request, category):
    categoryproducts = Product.objects.filter(label=category)
    return render(request,'customer/productbycategory.html', {'categoryproducts': categoryproducts})


def Recommendation_system(request):
    return render(request, 'Recommendation_system.html')

def Logout(request):
    # Log the user out
    logout(request)
    return render(request, 'index.html')

def Login(request):
    if request.method == 'POST':
        email = request.POST.get('inputEmail')
        print(email)
        password = request.POST.get('password')
        print(password)
        user = authenticate(email=email, password=password)
        if user is not None:
            login(request, user)
            print("Login successful")
            if user.role == 1:
                return redirect('customerpage')
            elif user.role == 2:
                return redirect('merchantpage')
            elif user.role==3:
                return redirect('logisticpage')
            elif user.role==0:
                return redirect('adminpage')
        else:
            return render(request, 'login.html', {'error_message': 'Invalid email or password'})
    else:
        return render(request, 'login.html')


def register(request):
    if request.method == "POST":
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        role = request.POST.get('role')
        gender = request.POST.get('gender')
        age = request.POST.get('age')
        country = request.POST.get('country')
        city = request.POST.get('city')
        phone_number = request.POST.get('phone_number')
        email = request.POST.get('inputEmail')
        password = request.POST.get('password')
        image = request.FILES['getimage']
        if image:
            user_profile = Users.objects.create_user(
                first_name=first_name,
                last_name=last_name,
                role=role,
                gender=gender,
                age=age,
                location=country,
                city=city,
                phone_number=phone_number,
                email=email,
                password=password,
                image = image
                )
            user_profile.save()
            messages.success(request, "New User Added Successfully!!!")
            return render(request, "login.html")
        else:
            print("image not uploaded")
            return render(request,"register.html")
    else:
        return render(request, 'register.html')

def add_product(request):
    if request.method == "POST":
        id = None
        name = request.POST.get('name')
        gender = request.POST.get('gender')
        category = request.POST.get('category')
        description = request.POST.get('description')
        price = request.POST.get('price')
        discount_price = request.POST.get('discount_price')
        image = request.FILES['getimage']
        if image:
            product = Product(
            id=id,
            name=name,
            seller = request.user,
            gender = gender,
            category=category,
            description=description,
            price=price,
            discount_price=discount_price,
            image=image
            )
            product.save()
            products = Product.objects.all()
            return render(request, 'products.html', {'products': products})
    else:
        return render(request, 'add_product.html')
    
def merchantadd_product(request):
    if request.method == "POST":
        id = None
        name = request.POST.get('name')
        gender = request.POST.get('gender')
        category = request.POST.get('category')
        label = request.POST.get('label')
        description = request.POST.get('description')
        price = request.POST.get('price')
        discount_price = request.POST.get('discount_price')
        image = request.FILES['getimage']
        if image:
            product = Product(
            id=id,
            name=name,
            seller = request.user,
            label = label,
            gender = gender,
            category=category,
            description=description,
            price=price,
            discount_price=discount_price,
            image=image
            )
            product.save()
            return render(request, 'merchant/merchantadd_product.html')
         # Redirect to products page after adding product
    else:
        return render(request, 'merchant/merchantadd_product.html')

def recommendations_view(request):
    if request.method == 'POST':
        age = request.POST.get('age')
        gender = request.POST.get('gender')
        location = request.POST.get('location')
        season = request.POST.get('season')
        new_input = pd.DataFrame({'Age': [age], 'Gender':[gender], 'Location': [location], 'Season': [season]})
        # user_interest = request.POST.get('user_interest')

        # Calculate recommended items based on user interest and preferences        
    
        model= joblib.load('AI models/model.pkl') 
        new_input_probs = model.predict_proba(new_input)
        top_10_indices = new_input_probs.argsort()[0][-10:][::-1]
        recommendations = model.classes_[top_10_indices]
        products = Product.objects.all()
        return render(request, 'recommendations.html', {'recommendations': recommendations, 'products': products})
    else:
       return render(request, 'Recommendation_system.html')
    
def add_to_cart(request):
        if request.method == 'POST':
             product= request.POST.get('product')
             product_id = Product.id(product)
             user = request.user
             product = get_object_or_404(Product, pk=product_id)
             cart_item, created = CartItem.objects.get_or_create(user=user, product=product)
             if not created:
                 cart_item.quantity += 1
                 cart_item.save()
                 products = CartItem.objects.all()
                 return render(request, 'cart.html', {'products': products,'user':user})

             else:
                 pass
             
        else:
            pass



def orders(request):
    if request.method == 'POST':
        user = request.user  # Assuming the user is logged in
        selected_products = request.session.get('selected_products')
        print("Selected Products: ",selected_products)
        payment_method = request.POST.get('payment_method')
        card_number = request.POST.get('card_number')
        expiry_date = request.POST.get('expiry_date')
        cvv = request.POST.get('cvv')
        shipping_rate = request.POST.get('shipping_charges')
        card_holder_name = request.POST.get('card_holder_name')
        billing_address = request.POST.get('billing_address')
        shipping_rate = Decimal(shipping_rate)
        
        for product_id in selected_products:
            cart_item = get_object_or_404(CartItem, user=user, product_id=product_id)
            quantity = cart_item.quantity
            product = cart_item.product
            total_price = quantity * product.price
            order = Orders(
                user=user,
                product=product,
                label=product.label,
                quantity=quantity,
                payment_method=payment_method,
                card_number=card_number,
                expiry_date=expiry_date,
                cvv=cvv,
                card_holder_name=card_holder_name,
                shipping_rate = shipping_rate  ,
                total_price = total_price,
                billing_address=billing_address,
                status=1  # Assuming 1 means pending
                )
            order.save()
            cart_item.delete()
            
            return redirect('customer_receipt')
    else:
        return render(request, 'customer/payment.html')
    
def ordered_products(request):
    user= request.user
    item= Orders.objects.filter(user = user)
    
    return render(request, 'ordered_items.html',{'item': item})

def customer_receipt(request):
    user= request.user
    item= Orders.objects.filter(user = user, status = 1)
    
    return render(request, 'customer/receipt.html', {'item': item,'user':user,'products': products})

from django.template.loader import render_to_string
from django.http import HttpResponse
from xhtml2pdf import pisa

def download_receipt(request):
    user = request.user
    items = Orders.objects.filter(user=user, status=1)
    
    # Render the HTML template with context
    html_string = render_to_string('customer/receipt.html', {'user': user, 'items': items})
    
    # Create a HttpResponse object with PDF headers
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="receipt.pdf"'
    
    # Convert HTML to PDF
    pisa_status = pisa.CreatePDF(html_string, dest=response)
    
    # If there's an error, show what went wrong
    if pisa_status.err:
        return HttpResponse('We had some errors <pre>' + html_string + '</pre>')
    
    return response



def customerproducts(request):
    # Retrieve all products from the database
    products = Product.objects.all()
    
    # Pass the products queryset to the template context
    return render(request, 'customer/customerproducts.html', {'products': products})

def customerorders(request):
    # Retrieve all products from the database
    orders = Orders.objects.filter(user = request.user)
    return render(request, 'ordered_items.html', {'orders': orders})
   


def add_to_cart(request):
    if request.method == 'POST':
        product_id = request.POST.get('product_id')  # Retrieve the product ID from the form data
        quantity_str = request.POST.get('quantity')  # Retrieve the quantity from the form data

        # Ensure quantity_str is not empty
        if quantity_str:
            quantity = int(quantity_str)  # Convert the quantity to an integer
        else:
            # Redirect back to the customerproducts page if the quantity is empty
            return redirect('customerproducts')

        # Get the product object
        product = get_object_or_404(Product, id=product_id)

        # Get or create the cart item for the current user and the selected product
        cart_item, created = CartItem.objects.get_or_create(user=request.user, product=product)

        # Update the quantity of the cart item
        cart_item.quantity = quantity
        cart_item.save()

        # Redirect to the cart page after updating the quantity
        return redirect('cart')  # Ensure 'cart' matches the actual URL pattern name
    else:
        # Redirect to the customerproducts page if the request method is not POST
       
        return redirect('customerproducts')  # Ensure 'customerproducts' matches the actual URL pattern name
    
def payment_view(request):
    if request.method == 'POST':
        selected_product_ids = request.POST.getlist('selected_products')
        print(selected_product_ids)
        request.session['selected_products'] = selected_product_ids
        total_price = 0
        # Loop through selected product IDs and calculate the total price
        for product_id in selected_product_ids:
            try:
                # Fetch the product details from the database
                product = Product.objects.get(id=product_id)
                
                # Calculate the total price for each selected product and sum them up
                total_price += product.price
                
            except Product.DoesNotExist:
                # Handle the case where the product does not exist
                pass
        
        return render(request, 'customer/payment.html', {'total_price': total_price, 'selected_product_ids': selected_product_ids})
    else:
        return render(request, 'customer/customercart.html')
    


def contactus(request):
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        subject = request.POST.get('subject')
        message = request.POST.get('message')
        contact = Contact(name=name, email=email, subject=subject, message=message, date=datetime.today())
        contact.save()
        messages.success(request, 'Your message has been sent!')
    return render(request, 'contact.html')



#creating api 
# views.py


class PendingOrdersList(generics.ListAPIView):
    serializer_class = OrdersSerializer

    def get_queryset(self):
        # # order = Orders.objects.filter(status="1")
        # # order.product = order.product.name
        # # order.user = order.user.first_name , order.user.last_name
        # item = Orders.objects.filter(status="1")
        # data = [{'Product': item.product.name, 'image': item.product.image.url,'user': item.user.first_name + item.user.last_name ,'Product': item.product.name,} for notification in notifications]
        # return JsonResponse(data, safe=False)
        return Orders.objects.filter(status="1")

class ProcessingOrdersList(generics.ListAPIView):
    serializer_class = OrdersSerializer

    def get_queryset(self):
        user = self.request.user

        print(user.id)  # Debug statement to print user ID
        print(user.role)
        if user.role == 3:  # Logistic user
            logisticuser = Orders.objects.filter(status="2", logistic=user.id)
            print(logisticuser)
            return logisticuser
            
        
        elif user.role == 0:  # Admin user
            return Orders.objects.filter(status="2")
    
class ShippedOrdersList(generics.ListAPIView):
    serializer_class = OrdersSerializer
    
    def get_queryset(self):
        user = self.request.user

        print(user.id)  # Debug statement to print user ID
        print(user.role)
        if user.role == 3:  # Logistic user
            logisticuser = Orders.objects.filter(status="3", logistic=user.id)
            print(logisticuser)
            return logisticuser
            
        
        elif user.role == 0:  # Admin user
            return Orders.objects.filter(status="3")

class DeliveredOrdersList(generics.ListAPIView):
    serializer_class = OrdersSerializer
    def get_queryset(self):
        user = self.request.user

        print(user.id)  # Debug statement to print user ID
        print(user.role)
        if user.role == 3:  # Logistic user
            logisticuser = Orders.objects.filter(status="4", logistic=user.id)
            print(logisticuser)
            return logisticuser
            
        
        elif user.role == 0:  # Admin user
            return Orders.objects.filter(status="4")
    
def save_notification(user, message, product_id,orderstatus):
    newmessage = message
    print(user)
    product = product_id
    newuser = get_object_or_404(Users, email=user)
    print(newuser)
    notification = Notification(user = newuser, product=product  , message=newmessage, status=orderstatus )
    notification.save()
    if not notification:
        print("page opened but notification not saved")
        return Response({"message": "Order approved successfully."}, status=status.HTTP_200_OK)

def add_record_to_dataset(order):
    gender = order.user.gender
    if(gender== '1'):
        gender = "Male"
    if(gender== '0'):
        gender = "Female"
    age = order.user.age
    location = order.user.city
    item_purchased = order.product.label
    category = order.product.category
    season = get_current_season()
    date = datetime.today()
    print("dataset record : ", age, gender,location, item_purchased,season,date)
    dataset = Dataset(
        Gender=gender,
        Age=age,
        Location=location,
        Item_Purchased=item_purchased,
        Category = category,
        Season=season,
        Date=date
    )
    dataset.save()

@api_view(['POST'])
def approve_order(request, pk):
    try:
        order = Orders.objects.get(pk=pk)
        print(order)
        # Increment the status by 1
        current_status = int(order.status)
        new_status = current_status + 1
        logistic = request.user.id
        # Update the status
        orderstatus =order.status
        order.status = str(new_status)
        order.logistic = logistic
        order.save()

        if new_status == 2:
            message = f"Your order for '({order.product})' under id: '({order.id})' has been placed."
            save_notification(order.user, message, order.product,orderstatus)
        elif new_status == 3:
            message = f"Your order for '({order.product})' under id: '({order.id})' has been shipped."
            save_notification(order.user, message,order.product,orderstatus)
        elif new_status == 4:
            message = f"Your order for '({order.product})' under id: '({order.id})' has been delivered."
            save_notification(order.user, message, order.product,orderstatus)
            add_record_to_dataset(order)
            
        
        return Response({"message": "Order approved successfully."}, status=status.HTTP_200_OK)
    except Orders.DoesNotExist:
        return Response({"message": "Order not found."}, status=status.HTTP_404_NOT_FOUND)

@api_view(['DELETE'])
def delete_order(request, pk):
    try:
        order = Orders.objects.get(pk=pk)
        order.delete()
        return Response({"message": "Order deleted successfully."}, status=status.HTTP_200_OK)
    except Orders.DoesNotExist:
        return Response({"message": "Order not found."}, status=status.HTTP_404_NOT_FOUND)
    

class NotificationAPIView(View):
    def get(self, request, user_id, *args, **kwargs):
        # Assume you have a Notification model with a message field
        notifications = Notification.objects.filter(user_id=user_id)
        data = [{'message': notification.message, 'image': notification.product.image.url} for notification in notifications]
        return JsonResponse(data, safe=False)
    

def save_user_interest(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        interest = data.get('interest')
        user = request.user
        user.interest_in = interest
        user.save()
        return JsonResponse({'status': 'success'})
    return JsonResponse({'status': 'failed'}, status=400)



import joblib
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score
import numpy as np
from .models import Dataset

import joblib
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score
import numpy as np
from .models import Dataset

def getrecommendation(user):
    # Load the dataset from the database
    
    data = pd.DataFrame(list(Dataset.objects.all().values('Age', 'Gender', 'Category', 'Location', 'Item_Purchased', 'Season')))

    # Convert categorical variables into numerical using one-hot encoding
    data = pd.get_dummies(data, columns=['Gender', 'Category', 'Location', 'Season'])

    # Split features and target variable
    X = data.drop(columns=['Item_Purchased'])
    y = data['Item_Purchased']

    # Split the dataset into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=42)

    # Scale the features
    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    X_test_scaled = scaler.transform(X_test)

    # Train the KNN model
    k = 5  # Number of neighbors
    knn_model = KNeighborsClassifier(n_neighbors=k)
    knn_model.fit(X_train_scaled, y_train)

    # Make predictions on the testing data
    y_pred = knn_model.predict(X_test_scaled)

    # Evaluate the model's performance
    accuracy = accuracy_score(y_test, y_pred)
    print("Accuracy:", accuracy)

    # Prepare user data for prediction
    age = user.age
    gender = user.gender
    gender = "Male" if gender == '1' else "Female"
    location = user.city
    season = get_current_season()
    category = user.interest_in
    if not category:
        category = "nothing"

    print(user, age, gender, location, category, season)

    # Create a DataFrame for the new input with all possible columns
    new_input = pd.DataFrame(columns=X.columns)

    # Fill the new input DataFrame with the user's data
    new_input.loc[0, 'Age'] = age
    new_input.loc[0, f'Gender_{gender}'] = 1
    new_input.loc[0, f'Category_{category}'] = 1
    new_input.loc[0, f'Location_{location}'] = 1
    new_input.loc[0, f'Season_{season}'] = 1

    # Fill missing columns with 0
    new_input = new_input.fillna(0)

    # Ensure the order of columns matches the training data
    new_input = new_input[X.columns]

    # Scale the new input data
    new_input_scaled = scaler.transform(new_input)

    # Get probabilities for the new input
    new_input_probs = knn_model.predict_proba(new_input_scaled)

    # Get the top 10 recommendations
    top_10_indices = new_input_probs.argsort()[0][-10:][::-1]
    recommendations = knn_model.classes_[top_10_indices]
    products = Product.objects.all()
    print(recommendations)

    recommendation_str = ", ".join(recommendations)  # Convert list of recommendations to a comma-separated string
    new_recommendation = Recommendations(
        Gender=gender,
        Age=age,
        Interest = category,
        Location=location,
        Recommendations=recommendation_str,
        Season= season,
        Date=datetime.today()
    )
    new_recommendation.save()

    return recommendations,products