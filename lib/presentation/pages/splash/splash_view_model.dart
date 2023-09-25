import 'package:get/get.dart';
import 'package:SkyWatch/application/app_prefs.dart';
import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/route_manager.dart';

class SplashViewModel extends GetxController {
  final AppPreferences _appPreferences = Get.find<AppPreferences>();

  @override
  void onInit() {
    _moveToHomeScreen();
    super.onInit();
  }

  void _moveToHomeScreen() async {
    await Future.delayed(
      const Duration(seconds: AppConstants.splashDelayseconds),
      () {
        bool isUserLoggedIn = _appPreferences.getUserToken().isNotEmpty;
        Get.offNamed(
          isUserLoggedIn ? Routes.dashboardRoute : Routes.loginRoute,
        );
      },
    );
  }
}
