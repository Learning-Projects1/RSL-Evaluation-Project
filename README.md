


## Supervisor Attendance App



## Features Implemented

### ⚙️ Built with GetX
- Uses GetX for:
    - State management
    - Routing
    - Dependency injection

### Accounts
1. Syed Baber Mehmood
   Email : syed@gmail.com
   password : syed12345

2. Albert Einstien
   Email : albert@gmail.com
   password : albert12345

3. Qasim Naveed
   Email : qasim@gmail.com
   password : qasim12345


## ⚠️ Limitations
- The app currently supports only three user accounts with hardcoded coordinates stored in the JSON file.
- For successful attendance marking, use the account with email alert@gmail.com, as it has the assigned RSL office location.
- Other accounts have different assigned locations and will not mark attendance successfully if not near those locations.


### Json file structure
  "users": [
      {
      "email": "syed@gmail.com",
      "hashedPassword": "9e5c3507ddad0b84e60162caafda4afb3dc3744dfebaed883047032040e3daa8",
      "name": "Syed Baber Mehmood",
      "latitude": 25.0012396,
      "longitude": 55.1542717
      },
      {
      "email": "albert@gmail.com",
      "hashedPassword": "55f08df67d70ac75ebd49c5dd7382c2d17f5f9fc0eb0fb55fb91f4d97d5c8385",
      "name": "Albert Einstien",
      "latitude": 25.23256005560213,
      "longitude": 55.55575122883488
      },
      {
      "email": "qasim@gmail.com",
      "hashedPassword": "233286a309d86399242b8aa6a22e79a1c2c48b219a921671012f0ff6eb1f0488",
      "name": "Qasim Naveed",
      "latitude": 25.009711139069015,
      "longitude": 55.15976978486124
      }
]


### 🔐 Login Screen
- Validates email format and checks for empty fields.
- Displays errors using FlushBars for smooth UX.
- Passwords are hashed and matched against values in a local JSON file.
- Users are authenticated by matching the email present in `user_data.json`.


## 🕒 Attendance Screen
- On tapping the "Mark Attendance" button, the app checks and handles location permissions.
- It loads the assigned location for the current user from the local JSON file.
- The current location is compared with the assigned location:
    - If the user is within a 100-meter radius, attendance is marked as successful.
    - If not, a message is shown: "You are not at your assigned location."

- The screen also displays the live date and time.
- Logout functionality is implemented with a confirmation dialog to avoid accidental logouts.


## 📋 History Screen
- Displays a list of attendance history records for the logged-in user.
- Each record shows:
    - Status (Present, Outside Area)
    - Date and time of attendance
    - Location details (latitude and longitude)
  
- Pull-to-refresh functionality is implemented to reload the latest history data.


## 🗺️ Map Screen
- Shows the current location of the user with a red location pin on the map.
- Displays a circle around the assigned location loaded from the JSON file, with a default radius of 100 meters.
- The circle radius dynamically scales based on the map zoom level — it gets bigger when zoomed in and smaller when zoomed out.
- Uses **flutter_map** with OpenStreetMap tiles instead of Google Maps to avoid paid Google Maps API.
- Handles location permissions gracefully.



