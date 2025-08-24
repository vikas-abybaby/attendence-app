import 'dart:async';
import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:attandenceadmin/data/repository/api.dart';
import 'package:attandenceadmin/data/repository/api_urls.dart';
import 'package:attandenceadmin/services/location_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

LocationController locationController = LocationController();

class LocationController extends GetxController {
  StreamSubscription<Position>? _positionSubscription;

  Position? position;
  Placemark? placemark;
  String? latLong;
  String? area;

  Future<void> startLocationTracking() async {
    final granted = await LocationService().checkAndRequestPermissions();
    if (!granted) {
      return;
    }

    _positionSubscription = LocationService().getPositionStream().listen(
      (pos) async {
        position = pos;
        placemark = await LocationService().getAddressFromLatLng(pos);

        if (placemark != null) {
          latLong = '${pos.latitude},${pos.longitude}';
          String? safeValue(String? value) =>
              (value != null && value.isNotEmpty) ? value : null;

          area = [
            safeValue(placemark?.name),
            safeValue(placemark?.subLocality),
            safeValue(placemark?.locality),
            safeValue(placemark?.administrativeArea),
            safeValue(placemark?.country),
            safeValue(placemark?.postalCode),
          ].whereType<String>().join(", ");

          log("message  :- $area $latLong");
        }
        update();
      },
      onError: (error) {
        log('Location error: $error');
        stopTracking();
      },
    );
  }

  Future updateLatLong() async {
    await Api().request(
      url: setUsersActivityUrl,
      method: RequestMethod.post,
      header: Api().commonHeader,
      showLoader: false,
      payload: {
        "lat": latLong?.split(",")[0].toString(),
        "long": latLong?.split(",")[1].toString(),
      },
    );
  }

  void stopTracking() {
    _positionSubscription?.cancel();
    _positionSubscription = null;
    latLong = null;
    area = null;
    update();
  }
}
