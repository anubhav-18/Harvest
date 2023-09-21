import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grocers/src/utils/utils.dart';

class LocationProvider extends ChangeNotifier {
  // String? _currentAddress;
  // String? get currentAddress => _currentAddress;
  // LatLng? _currentPosition;
  // LatLng? get currentPosition => _currentPosition;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  double? _longitude;
  double? get longitude => _longitude;
  double? _latitude;
  double? get latitude => _latitude;

  Future<bool> checkLocationPermission(BuildContext context) async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      print('Location Service is not enabled');
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Location Service is not enabled');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location Service is not enabled');
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Location Service is not enabled');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print('Location Service are permantally denied');
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Location Service are permantally denied');
      return false;
    }
    print('Location is fetched');
    return true;
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    final hasPermission = await checkLocationPermission(context);
    _isLoading = true;
    notifyListeners();

    try {
      if (!hasPermission) {
        return;
      }
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((value) {
        _longitude = value.longitude;
        _latitude = value.latitude;
        notifyListeners();
      });
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, "Some error is there. Please retry.");
      print(e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}
