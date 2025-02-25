import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:car_ticket/controller/user/user_dashboard_controller.dart';

class UserDashboardProfileScreen extends GetView<UserDashboardController> {
  static const String routeName = '/user-dashboard-profile';

  const UserDashboardProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Obx(() {
        final user = controller.user;
        if (user == null) return const Center(child: CircularProgressIndicator());
        
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ... rest of your existing UI code ...
            ],
          ),
        );
      }),
    );
  }
  // ... rest of your existing methods ...
}