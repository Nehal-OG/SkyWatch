import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SkyWatch/application/app_prefs.dart';
import 'package:SkyWatch/application/extensions.dart';
import 'package:SkyWatch/application/functions.dart';
import 'package:SkyWatch/domain/usecases/login_usecase.dart';
import 'package:SkyWatch/presentation/resources/api_manager.dart';
import 'package:SkyWatch/presentation/resources/strings_manager.dart';
import '../../resources/route_manager.dart';

class LoginViewModel extends GetxController {
  final AppPreferences _appPreferences = Get.find<AppPreferences>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var showError = false.obs;
  var errorText = AppStrings.fillInRequiredFields.obs;
  var showPassword = false.obs;

  final LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase);

  @override
  void onInit() {
    initializeTextFieldValues();
    super.onInit();
  }

  void initializeTextFieldValues() {
    assign(usernameController, "PRODWARE");
    assign(passwordController, "PROD2023");
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  login() async {
    bool isAllFieldsFilled =
        isAllRequiredFieldsFilled([usernameController, passwordController]);
    toggleErrorText(!isAllFieldsFilled);

    if (isAllFieldsFilled) {
      (await loginUseCase.execute(
        LoginUseCaseInput(usernameController.text, passwordController.text),
      ))
          .fold((failure) {
        // left -> failure
        toggleErrorText(true, errorTextValue: failure.message);
      }, (data) {
        // right -> data (success)
        // log('token: ${data.userInfo?.token}');
        if (data.userInfo != null) {
          _appPreferences.setUserToken(data.userInfo!.token.orEmpty());
          Get.offNamed(Routes.dashboardRoute);
        } else {
          log(APIErrors.userInfoObjectMissing);
          toggleErrorText(true, errorTextValue: AppStrings.loginError);
        }
      });
    }

    // Get.offNamed(Routes.dashboardRoute);
  }

  toggleErrorText(bool displayError, {String? errorTextValue}) {
    showError.value = displayError;
    errorText.value = errorTextValue ?? AppStrings.fillInRequiredFields;
  }
}
