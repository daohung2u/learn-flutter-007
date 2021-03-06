import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double long;

  Future<void> getLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
