import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_watch/application/app_prefs.dart';
import 'package:sky_watch/application/extensions.dart';
import 'package:sky_watch/application/functions.dart';
import 'package:sky_watch/domain/usecases/login_usecase.dart';
import 'package:sky_watch/presentation/resources/api_manager.dart';
import 'package:sky_watch/presentation/resources/strings_manager.dart';
import '../../resources/route_manager.dart';

class HomeScreenViewModel extends GetxController {
  final AppPreferences _appPreferences = Get.find<AppPreferences>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var showError = false.obs;
  var errorText = AppStrings.fillInRequiredFields.obs;
  var showPassword = false.obs;

  final LoginUseCase loginUseCase;
  HomeScreenViewModel(this.loginUseCase);

  @override
  void onInit() {
    initializeTextFieldValues();
    super.onInit();
  }

  void initializeTextFieldValues() {}

  // login() async {
  //   bool isAllFieldsFilled =
  //       isAllRequiredFieldsFilled([usernameController, passwordController]);
  //   toggleErrorText(!isAllFieldsFilled);

  //   if (isAllFieldsFilled) {
  //     (await loginUseCase.execute(
  //       LoginUseCaseInput(usernameController.text, passwordController.text),
  //     ))
  //         .fold((failure) {
  //       // left -> failure
  //       toggleErrorText(true, errorTextValue: failure.message);
  //     }, (data) {
  //       // right -> data (success)
  //       // log('token: ${data.userInfo?.token}');
  //       if (data.userInfo != null) {
  //         _appPreferences.setUserToken(data.userInfo!.token.orEmpty());
  //         Get.offNamed(Routes.dashboardRoute);
  //       } else {
  //         log(APIErrors.userInfoObjectMissing);
  //         toggleErrorText(true, errorTextValue: AppStrings.loginError);
  //       }
  //     });
  //   }

  // }

  toggleErrorText(bool displayError, {String? errorTextValue}) {
    showError.value = displayError;
    errorText.value = errorTextValue ?? AppStrings.fillInRequiredFields;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
