import joblib
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score
from store.models import Dataset
import numpy as np

# # Load the dataset
# data = pd.read_csv("your_dataset.csv")  # Replace "your_dataset.csv" with the path to your dataset file

# Load the dataset from the database
def load_data():
    data = Dataset.objects.all().values('Age', 'Gender', 'Location','Category', 'Season','Item_Purchased')
    df = pd.DataFrame(data)
    print("datasetloaded")
    return df

# Train the KNN model
def train_knn_model(data):
    # Convert categorical variables into numerical using one-hot encoding
    data = pd.get_dummies(data, columns=['Gender', 'Category', 'Location', 'Season'])
    print("training started")
    # Split features and target variable
    X = data.drop(columns=['Item_Purchased'])
    y = data['Item_Purchased']

    # Save the column names for future use
    column_names = X.columns.tolist()
    joblib.dump(column_names, 'column_names.pkl')
    
    # Split the dataset into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=42)
    
    # Scale the features
    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    joblib.dump(scaler, 'scaler.pkl')
    
    X_test_scaled = scaler.transform(X_test)
    
    # Train the KNN model
    k = 10  # Number of neighbors
    knn_model = KNeighborsClassifier(n_neighbors=k)
    knn_model.fit(X_train_scaled, y_train)
    
    joblib.dump(knn_model, 'knn_personalzied_recommendation.pkl')
    
    # Make predictions on the testing data
    y_pred = knn_model.predict(X_test_scaled)
    
    # Evaluate the model's performance
    accuracy = accuracy_score(y_test, y_pred)
    print("Accuracy:", accuracy)
    
    return knn_model

def retrain_model():
    data = load_data()
    knn_model = train_knn_model(data)
    return knn_model

knn_model = retrain_model()



def make_recommendations(age, gender, category, location, season, top_n=10):
    
    input_data = pd.DataFrame({'Age': [age], 'Gender_' + gender: [1], 'Category_' + category: [1],
                               'Location_' + location: [1], 'Season_' + season: [1]})
    input_data = input_data.reindex(columns=X .columns, fill_value=0)
    
    # Scale the input features
    scaler = joblib.load('scaler.pkl')
    input_data_scaled = scaler.transform(input_data)
    
    # Predict the probabilities for all classes
    probabilities = knn_model.predict_proba(input_data_scaled)
    
    top_10_indices = probabilities.argsort()[0][-10:][::-1]
    top_10_items = knn_model.classes_[top_10_indices]
    
    return top_10_items

from datetime import datetime
def get_current_season():
    month = datetime.now().month
    if month in [12, 1, 2]:
        return 'Winter'
    elif month in [3, 4, 5]:
        return 'Spring'
    elif month in [6, 7, 8]:
        return 'Summer'
    else:
        return 'Fall'
