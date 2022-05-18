import 'package:core/core.dart';
import 'package:scm_mobile_app/main.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEV,
      values: FlavorValues(
          baseUrl: Endpoint.baseUrlDev, notifUrl: Endpoint.notifUrlDev));
  mainApp();
}
