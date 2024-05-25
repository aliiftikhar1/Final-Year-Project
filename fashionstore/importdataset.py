import csv
import os
import django

# Setup Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'fashionstore.settings')
django.setup()

from store.models import Dataset

# Path to the CSV file
csv_file_path = 'AI models\your_dataset.csv'

def import_csv():
    with open(csv_file_path, newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            purchase = Dataset(
                Age=row['Age'],
                Gender=row['Gender'],
                Item_Purchased=row['Item Purchased'],
                Category=row['Category'],
                Location=row['Location'],
                Season=row['Season']
            )
            purchase.save()

if __name__ == "__main__":
    import_csv()
