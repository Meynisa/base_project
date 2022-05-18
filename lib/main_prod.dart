import 'package:core/core.dart';
import 'package:scm_mobile_app/main.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.PRODUCTION,
      values: FlavorValues(
          baseUrl: Endpoint.baseUrlProd, notifUrl: Endpoint.notifUrlProd));
  mainApp();
}
