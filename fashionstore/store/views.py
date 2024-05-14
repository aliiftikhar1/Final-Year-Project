
from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseNotFound, HttpResponseRedirect
from django.contrib.auth import logout
from datetime import datetime
import pandas as pd
from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth import login
from django.contrib import messages
import pandas as pd
from django.contrib.auth import authenticate
import joblib
from .models import Orders, Users, Product, CartItem,Contact
from .models import CartItem, Product, lastclick
from django.contrib.auth.models import AnonymousUser


def index(request):
     if isinstance(request.user, AnonymousUser):
         return render(request, 'index.html')
     else:
         user= request.user
         if user.role == 1:
                return redirect('customerpage')
                # return render(request, 'customer/customerpage.html')
         elif user.role == 2:
             return redirect('merchantpage')
         


def cart(request):
     user = request.user
     cuser = Users.objects.raw("SELECT * FROM store_users WHERE email = %s", [user])
     for i in cuser:
         requt = i.id
     products = CartItem.objects.filter(user_id= requt)
     return render(request, 'customer/customercart.html',{'products': products})

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
            return redirect('merchantproducts')
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

def getpersonalizedrecommendations(user):
    age = user.age
    gender = user.gender
    if(gender== '1'):
        gender = "Male"
    if(gender== '0'):
        gender = "Female"
    location = user.city
    season = "Fall"
    print(user,age,gender,location,season)
    new_input = pd.DataFrame({'Age': [age], 'Gender':[gender], 'Location': [location], 'Season': [season]})
    # user_interest = request.POST.get('user_interest')
    # Calculate recommended items based on user interest and preferences        
    model= joblib.load('AI models/model.pkl') 
    new_input_probs = model.predict_proba(new_input)
    top_10_indices = new_input_probs.argsort()[0][-10:][::-1]
    recommendations = model.classes_[top_10_indices]
    products = Product.objects.all()
    return recommendations, products


# Function to get recommendations based on item name
def get_click_recommendations(item_name):
    
    df = pd.read_csv("AI models/dataset.csv")
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


def updatemerchantproduct(request):
    if request.method == "POST":
        id = request.POST.get('id')
        name = request.POST.get('name')
        description = request.POST.get('description')
        price = request.POST.get('price')
        discount_price = request.POST.get('discount_price')
        product = Product.objects.get(pk=id)  # Assuming you have the product primary key or some other identifier
        product.update_product(name=name,description=description, price=price, discount_price=discount_price)
        return redirect('merchantproducts')
    return redirect('merchantproducts')



def products_by_category(request, category):
    # products = get_object_or_404(Product, label=category)
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
                # return render(request, 'customer/customerpage.html')
            elif user.role == 2:
                return redirect('merchantpage')
            # else:
            #     return render(request, 'adminpage.html')
            # return render(request, 'merchantpage.html')
        else:
            # Handle invalid login credentials
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
                gender=gender,age=age,
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
        
        # If it's a GET request, render the registration form
        
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
         # Redirect to products page after adding product
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
        # Extract form data
        user = request.user  # Assuming the user is logged in
        selected_products = request.session.get('selected_products', [])
        print("Products",selected_products)
        # quantity = request.POST.get('quantity')
        payment_method = request.POST.get('payment_method')
        card_number = request.POST.get('card_number')
        expiry_date = request.POST.get('expiry_date')
        cvv = request.POST.get('cvv')
        card_holder_name = request.POST.get('card_holder_name')
        billing_address = request.POST.get('billing_address')
        for  iitem in selected_products:
            print(iitem)
            pquantity = CartItem.objects.get(product_id =iitem)
            quantity = pquantity.quantity
            iiitem = Product.objects.raw("SELECT * FROM store_product WHERE id = %s", [iitem])
            for item in iiitem:
                print("product:")
                print(item)
                
                order = Orders(
                    user=user,
                    product=item.name,
                    quantity=quantity,
                    payment_method=payment_method,
                    card_number=card_number,
                    expiry_date=expiry_date,
                    cvv=cvv,
                    card_holder_name=card_holder_name,
                    billing_address=billing_address
                )
            order.save()
            pquantity.delete()
        
        
        # Optionally, you can do additional processing or send confirmation emails here
        item= Orders.objects.filter(user = user)
        return render(request, 'ordered_items.html',{'item': item})
    else:
        return render(request, 'customer/payment.html')
    
def customerproducts(request):
    # Retrieve all products from the database
    products = Product.objects.all()
    
    # Pass the products queryset to the template context
    return render(request, 'customer/customerproducts.html', {'products': products})


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