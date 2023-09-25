import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:SkyWatch/application/app_prefs.dart';
import 'package:SkyWatch/domain/usecases/logout_usecase.dart';
import '../../../presentation/resources/route_manager.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/custom_confirmation_dialog.dart';

class DashboardViewModel extends GetxController {
  final AppPreferences _appPreferences = Get.find<AppPreferences>();

  final LogoutUseCase logoutUseCase;
  DashboardViewModel(this.logoutUseCase);

  Future<void> logout() async {
    (await logoutUseCase.execute(LogoutUseCaseInput(
      _appPreferences.getUserToken(),
    )))
        .fold((failure) {
      // left -> failure
      EasyLoading.showToast(failure.message);
    }, (data) {
      // right -> data (success)
      _appPreferences.setUserToken('');
      Get.offAllNamed(Routes.loginRoute);
    });

    //Get.offAllNamed(Routes.loginRoute);
  }

// Added a custom showLogoutDialog
  showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomConfirmationDialog(
          headlineMessage: AppStrings.logoutMessage,
          confirmationButtonText: AppStrings.yes,
          denieButtonText: AppStrings.no,
          onConfirmation: () => logout(),
        );
      },
    );
  }
}
