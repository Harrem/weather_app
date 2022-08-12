import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;

class GetLocation {
  static double lat = 0;
  static double lon = 0;
  static List<Placemark> placemarks = [];

  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Geolocator.requestPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Geolocator.requestPermission();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    lat = position.latitude;
    lon = position.longitude;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(GetLocation.lat, GetLocation.lon);
  }
}
