import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {

  static Future<Position> getCurrentPosition() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  static Future<List<Address>> getAddressFromCoordinate(Coordinates coordinates) async {
    return await Geocoder.local.findAddressesFromCoordinates(coordinates);
  }
}