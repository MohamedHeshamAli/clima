import 'package:geolocator/geolocator.dart';

class Location {
  double longtude;
  double latitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longtude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
