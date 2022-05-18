import 'package:scm_mobile_app/main_lib.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;
  static const ONBOARDING = Routes.ONBOARDING;
  static const LOGIN = Routes.LOGIN;
 

  static final routes = [
    GetPage(name: _Paths.SPLASH_SCREEN, page: () => SplashScreen()),
    GetPage(
        name: _Paths.ONBOARDING,
        page: () => OnboardingPage()),
    GetPage(
        name: _Paths.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
  ];
}
