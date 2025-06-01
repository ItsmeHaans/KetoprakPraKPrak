# solar_api.py

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import pandas as pd
import joblib
from typing import List

from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler

# 1. Prepare FastAPI app
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# 2. Load your model and scaler (or retrain here)
model = joblib.load("model.pkl")  # Save with joblib if not yet
scaler = joblib.load("scaler.pkl")  # Save scaler if not yet

# 3. Store prediction history
history = []

@app.get("/predict-energy", response_model=List[float])
def predict_energy():
    """
    Simulate prediction and return last 5 output kW values.
    """

    # Simulate new input (in real app, replace with real sensor data)
    new_input = pd.DataFrame([{
        "hour": 12,
        "energy_usage_kw": 5.0,
        "daylight_hours": 6,
        "dayofweek": 1,
        "month": 6
    }])

    scaled_input = scaler.transform(new_input)
    prediction = model.predict(scaled_input)[0]

    estimated_kw = new_input["energy_usage_kw"].iloc[0] if prediction == 1 else 0
    history.append(estimated_kw)

    return history[-5:]  # Only return last 5
