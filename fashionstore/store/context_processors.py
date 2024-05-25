from .views import getrecommendation, get_click_recommendations, add_record_to_dataset

from django.contrib.auth.models import AnonymousUser
from .models import lastclick, Product, Orders

def recommendations(request):
    if request.user.is_authenticated and request.user.role == 1:
        user = request.user
        recommendations = []
        products = []
        
        recommendations, products = getrecommendation(user)
        return {'recommendations': recommendations, 'products': products}
    else:
        return {'recommendations': [], 'products': []}

def clickrecommendations(request):
    if isinstance(request.user, AnonymousUser) or request.user.role != 1:
        return {'clickrecommendeds': []}
    else:
        try:
            user = request.user
            item = lastclick.objects.get(user=user)
            item_name = Product.objects.get(id=item.product_clicked.id)
            item_name = item_name.label
        except lastclick.DoesNotExist:
            item_name = "Blouse"
        clickrecommendeds = get_click_recommendations(item_name)
        return {'clickrecommendeds': clickrecommendeds}
