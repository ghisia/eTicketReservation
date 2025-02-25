import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportController extends GetxController {
  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  final _totalTickets = 0.obs;
  int get totalTickets => _totalTickets.value;

  final _totalRevenue = 0.obs;
  int get totalRevenue => _totalRevenue.value;

  final _totalCustomers = 0.obs;
  int get totalCustomers => _totalCustomers.value;

  final _activeRoutes = 0.obs;
  int get activeRoutes => _activeRoutes.value;

  List<FlSpot> get revenueData => [
    const FlSpot(0, 3),
    const FlSpot(1, 1),
    const FlSpot(2, 4),
    const FlSpot(3, 2),
    const FlSpot(4, 5),
    const FlSpot(5, 3),
  ];

  List<BarChartGroupData> get ticketData => [
    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8)]),
    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10)]),
    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14)]),
    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15)]),
    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 13)]),
    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 10)]),
  ];

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    try {
      _isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      _totalTickets.value = 1250;
      _totalRevenue.value = 25000;
      _totalCustomers.value = 850;
      _activeRoutes.value = 12;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load dashboard data',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }
}