import 'package:scm_mobile_app/main_lib.dart';
import 'package:scm_mobile_app/src/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
