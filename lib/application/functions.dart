import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:SkyWatch/application/extensions.dart';
import 'package:SkyWatch/presentation/resources/strings_manager.dart';
import 'package:SkyWatch/presentation/widgets/custom_dialog.dart';

import '../presentation/resources/constants_manager.dart';
import '../presentation/resources/date_format_manager.dart';
import 'app_prefs.dart';

isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isAllRequiredFieldsFilled(List<TextEditingController> controllers) {
  for (TextEditingController textEditingController in controllers) {
    if (textEditingController.text.isEmpty) return false;
  }
  return true;
}

assign(TextEditingController textEditingController, String? controllerText) {
  if (controllerText.orEmpty().isNotEmpty) {
    textEditingController.text = controllerText.orEmpty();
  }
}

clearController(TextEditingController controllerName) {
  controllerName.clear();
}

toggleErrorText(bool displayError,
    {String errorText = AppStrings.fillInRequiredFields}) {
  if (displayError) {
    EasyLoading.showToast(errorText);
  }
}

// showErrorDialog(BuildContext context, {required String errorText}) {
showErrorDialog(BuildContext context, {required String errorText}) {
  // showDialog(
  //   context: context,
  //   builder: (context) {
  //     return CustomConfirmationDialog(
  //       headlineMessage: errorText,
  //       confirmationButtonText: AppStrings.ok,
  //       showErrorIcon: true,
  //       onConfirmation: () => Get.back(),
  //     );
  //   },
  // );
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        message: errorText,
        showErrorDialog: true,
        doubleBackButtonPressed: false,
      );
    },
  );
}

//Custom Error Cycle Count
showCCErrorDialog(
    {required BuildContext context,
    required String errorText,
    Function? onOkayPress}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        message: errorText,
        showErrorDialog: true,
        doubleBackButtonPressed: false,
        onOkayButtonPressed: () => onOkayPress,
      );
    },
  );
}

showSuccessDialog(
  BuildContext context, {
  required String successMessageText,
  bool doubleBackButtonPressed = true,
  VoidCallback? onOkayButtonPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        message: successMessageText,
        doubleBackButtonPressed: doubleBackButtonPressed,
        onOkayButtonPressed: onOkayButtonPressed,
      );
    },
  );
}

Future<int?> showDropdownDialog(
    BuildContext context, List<String> dropdownList) async {
  closeKeyboard(context);

  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomTextDropDownDialog(
        dropdownList,
      );
    },
  );
}

String getDateString(AppPreferences appPreferences,
    {required DateTime dateTime}) {
  return (appPreferences.getDateFormat() == AppConstants.dateMonthYearString)
      ? AppDateFormats.dateMonthYear.format(dateTime)
      : AppDateFormats.monthDateYear.format(dateTime);
}

/// KEYBOARD
bool isKeyboardShowing() {
  if (WidgetsBinding.instance != null) {
    return WidgetsBinding.instance.window.viewInsets.bottom > 0;
  } else {
    return false;
  }
}

void closeKeyboard(BuildContext context) {
  if (isKeyboardShowing()) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }
}
