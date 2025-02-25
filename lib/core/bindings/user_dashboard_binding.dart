import 'package:get/get.dart';
import 'package:car_ticket/controller/user/user_dashboard_controller.dart';

class UserDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDashboardController());
  }
}