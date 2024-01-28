import "dart:developer";

import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  late String latitude;
  late String longitude;
  @override
  void initState() {
    latitude = '0';
    longitude = '0';
    super.initState();
  }

  _determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      log("Latitude=${currentposition.latitude.toString()}");
      log("Longitude=${currentposition.longitude.toString()}");
      setState(() {
        latitude = currentposition.latitude.toString();
        longitude = currentposition.longitude.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 100.0,
        backgroundColor: Colors.green,
        title: Text(
          'LOCATION',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 250),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Longitude: $longitude,\nLatitude: $latitude",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  _determinePosition();
                },
                child: Container(
                  width: 200,
                  padding: EdgeInsets.only(left: 32),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_rounded),
                      Text(
                        'GET LOCATION',
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}