import 'package:car_ticket/domain/repositories/user/firebase_user_repository.dart';
import 'package:car_ticket/presentation/screens/auth/auth_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final _firebaseUserRepository = Get.find<FirebaseUserRepository>();
  
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<void> logout() async {
    try {
      _isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      await _firebaseUserRepository.signOut();
      Get.offAllNamed(AuthScreen.routeName);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to logout: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }
}