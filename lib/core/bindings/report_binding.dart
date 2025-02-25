import 'package:get/get.dart';
import 'package:car_ticket/controller/dashboard/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController());
  }
}