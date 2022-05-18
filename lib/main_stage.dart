import 'package:core/core.dart';
import 'package:scm_mobile_app/main.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.STAGE,
      values: FlavorValues(
          baseUrl: Endpoint.baseUrlStage, notifUrl: Endpoint.notifUrlStage));
  mainApp();
}
