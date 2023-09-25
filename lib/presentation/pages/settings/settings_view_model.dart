import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sky_watch/application/app_prefs.dart';
import 'package:sky_watch/application/functions.dart';
import 'package:sky_watch/presentation/pages/settings/settings_view.dart';
import 'package:sky_watch/presentation/resources/constants_manager.dart';

class SettingsViewModel extends GetxController {
  final AppPreferences _appPreferences = Get.find<AppPreferences>();

  var selectedDateFormat = DateFormatEnum.ddmmyyyy.obs;

  SettingsViewModel();

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  close() {
    Get.back();
  }

  initialize() {
    // selectedDateFormat.value =
    //     (_appPreferences.getDateFormat() == AppConstants.dateMonthYearString)
    //         ? DateFormatEnum.ddmmyyyy
    //         : DateFormatEnum.mmddyyyy;
  }

  Future<void> saveSettings(BuildContext context) async {
    EasyLoading.show();

    try {
      await _appPreferences.setDateFormat(
          // (selectedDateFormat.value == DateFormatEnum.ddmmyyyy)
          //     ? AppConstants.dateMonthYearString
          //     : AppConstants.monthDateYearString);

          showSuccessDialog(context,
              successMessageText: 'Settings saved successfully!'));
    } catch (e) {
      print(e.toString());
    }

    EasyLoading.dismiss();
  }
}
