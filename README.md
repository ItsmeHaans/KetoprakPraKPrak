# KetoprakPraKPrak Group's Project

LuminAI is an intelligent solar tracking and energy optimization system designed to enhance the efficiency of solar power collection and usage. Combining smart sensors, machine learning, and real-time analytics, LuminAI helps maximize solar energy capture while enabling smarter energy savings. This AI-powered system designed to predict both solar panel input (energy generation) and electricity output (consumption) based on historical data. By analyzing past trends, weather conditions, and usage patterns, the system aims to optimize energy efficiency, improve grid management, and reduce costs. This predictive tool will help users and energy providers make data-driven decisions for better renewable energy utilization.

How It Works:
- Sensor Input: Solar Panels and LDR sensors detect sunlight input and intensity.
- Data Logging: Energy stats are tracked and logged.
- Prediction & Automation: Our AI predicts optimal energy that is able to be saved, as well as suggestions. Future weather predictions will also be analyzed for predictions as well.
- User Interface: Dashboard displays real-time performance metrics.

Features:
- Solar Tracking: Automatically adjusts solar panel angles to follow the sun's position throughout the day.
- Energy Optimization: Monitors power usage and optimizes energy distribution based on real-time data.
- Smart Predictions: Uses weather forecasting and machine learning to anticipate sunlight availability and adjust behavior accordingly.
- User Dashboard: Visual interface for monitoring energy production, usage stats, and performance metrics.
- Eco-Friendly: Helps reduce energy waste and supports sustainable living.

How to run:
Frontend:
- Download Flutter & Dart (https://www.youtube.com/watch?v=2svrbgcHZew)
- Download our files and open them in Visual Studio Code
- Open the "lib" folder and open the "main.dart" file, and type "flutter run" in the terminal
- The Weather Dashboard should appear as shown:
![Weather Dashboard Image](https://github.com/user-attachments/assets/d145d05a-7d37-4e82-846f-94e9bd2757de)

Backed:
For the backend, we use Microsoft Azure Studio and since the VSCode cant import the azure library, You can run it by open the Solar(2).ipynb on Microsoft Azure Studio using Azure kernel on this link :
https://ml.azure.com/?tid=3485b963-82ba-4a6f-810f-b5cc226ff898&wsid=/subscriptions/a21d9b82-ce29-4faa-a409-cebb05762979/resourceGroups/ketopraksolar/providers/Microsoft.MachineLearningServices/workspaces/SolarPanel

For predicting the output, you can change these input on this particular codes:
![image](https://github.com/user-attachments/assets/5a67a425-0bec-4041-895b-cc7dd5d73485)
Which:
- hour : The time right now, rounded into hour
- energy_usage_kw = house uses energy right now
- daylight_hours = efective time for the solar panel to get the solar power from the sun
- dayofweek = the day of the week on index (Ex : Monday = 1, Tuesday = 2, Wednesday = 3, etc)
- month = today's month on index (Ex : January = 1, February = 2, March = 3, etc)
- retrain = selective mode if you want this data included into trained data

FAQ:
- "Why is the code not running?" 
  -> There could be many possibilities behind why the code isn't running, such as: no data input, hardware incompatibility
- "Why is the AI doesnt predict the data for my house?"
  -> Some issues may occur regarding the AI because the data we used is a dummy data for smaller watts
