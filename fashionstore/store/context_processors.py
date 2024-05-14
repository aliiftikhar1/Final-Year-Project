from .views import getpersonalizedrecommendations, get_click_recommendations
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import AnonymousUser

def recommendations(request):
    user = request.user
    recommendations = []
    products = []
    if user.is_authenticated:
        recommendations, products = getpersonalizedrecommendations(user)
    return {'recommendations': recommendations, 'products': products}

from .models import lastclick, Product


def clickrecommendations(request):
    if isinstance(request.user, AnonymousUser):
        return {'clickrecommendeds': []}
    else:
        try:
            # Attempt to retrieve the lastclick object for the current user
            user = request.user
            item = lastclick.objects.get(user=user)
            item_name = Product.objects.get(id = item.product_clicked.id)
            item_name = item_name.label
        except lastclick.DoesNotExist:
            # Handle the case where the lastclick object doesn't exist
            item_name = "Blouse"
        clickrecommendeds = get_click_recommendations(item_name)
        return {'clickrecommendeds': clickrecommendeds}

