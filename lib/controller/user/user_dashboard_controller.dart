import 'package:get/get.dart';
import 'package:car_ticket/domain/models/user/user.dart';

class UserDashboardController extends GetxController {
  final Rx<MyUser?> _user = Rx<MyUser?>(null);
  MyUser? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.value = Get.arguments as MyUser;
  }
}