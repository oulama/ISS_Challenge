# ISS_Challenge
The main tasks of this test are the following:
- Display the current live location of the ISS (International Space Station)
- Display a list of the actual passengers of the ISS
- Tell the user if the ISS is over his own location (latitude, longitude) within a radius of
10 km
- Let the user know at which time the ISS will be passing above his location.

The project was implemented with no Third-party library.

# API:

Retrieve the ISS’ current location:
To retrieve the ISS’ actual position you’ll use the following API Endpoint:
http://api.open-notify.org/iss-now.json
Documentation link : http://open-notify.org/Open-Notify-API/ISS-Location-Now/
Retrieve the times at which the ISS will be above the user’s location
http://api.open-notify.org/iss-pass.json
Documentation link : http://open-notify.org/Open-Notify-API/ISS-Pass-Times/
