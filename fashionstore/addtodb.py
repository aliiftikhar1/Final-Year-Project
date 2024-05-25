from datetime import datetime
from store.models import Dataset,Orders
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

def add_record_to_dataset(order):
    gender = order.user.gender
    age = order.user.age
    location = order.user.city
    item_purchased = order.product.label
    season = get_current_season()
    date = datetime.today()
    print("dataset record : ", age, gender,location, item_purchased,season,date)
    dataset = Dataset(
        Gender=gender,
        Age=age,
        Location=location,
        Item_Purchased=item_purchased,
        Season=season,
        Date=date
    )
    dataset.save()

order = Orders.objects.filter(id=175)
add_record_to_dataset(order)