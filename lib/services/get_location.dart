import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GetLocation {
  Future<List<Placemark>> getLocation() async {
    // التحقق من إذن الوصول إلى الموقع
    var permissionStatus = await Permission.location.status;

    if (permissionStatus.isDenied) {
      // طلب الإذن
      permissionStatus = await Permission.location.request();
    }

    if (permissionStatus.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            // ignore: deprecated_member_use
            desiredAccuracy: LocationAccuracy.high);
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        print("Location fetched: ${placemarks[0].locality}");
        return placemarks;
      } catch (e) {
        print("Error getting current position: $e");
        throw Exception("Could not get current location");
      }
    } else {
      throw Exception("Location permissions are denied");
    }
  }
}
