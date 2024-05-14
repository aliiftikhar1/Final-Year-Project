from django.contrib.auth.backends import BaseBackend
from .models import Users

class CustomAuthBackend(BaseBackend):
    def authenticate(self, request, email=None, password=None):
        try:
            print("Yes password")
            user = Users.objects.get(email=email)
            print(user)
            if user.check_password(password):
                print(user)
                print("Yes password")
                return user
            
        except Users.DoesNotExist:
            print("wrong password")
            return None
        

    # def get_user(self, user_id):
    #     try:
    #         return Users.objects.get(pk=user_id)
    #     except Users.DoesNotExist:
    #         return None
