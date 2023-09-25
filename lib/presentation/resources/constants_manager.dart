import 'package:SkyWatch/domain/models/models.dart';
import 'package:SkyWatch/presentation/resources/assets_manager.dart';
import 'package:SkyWatch/presentation/resources/strings_manager.dart';

class AppConstants {
  // App Version
  static const double appVersion = 1.0;

  // Splash
  static const int splashDelayseconds = 2;

  // LPN Split
  static const int newLPNSplitItem = 0;
  static const int existingLPNSplitItem = 1;

  // Date Format
  static const String dateMonthYearString = "dd/MM/yyyy";
  static const String monthDateYearString = "MM/dd/yyyy";
}

class ListConstants {
  // Dashboard List
  static List<DashboardItem> dashboardItems = [
    DashboardItem(name: AppStrings.poReceipt, iconPath: ImageAssets.poReceipt),
    DashboardItem(name: AppStrings.putAway, iconPath: ImageAssets.putAway),
    DashboardItem(
        name: AppStrings.pickConfirm, iconPath: ImageAssets.pickConfirm),
    DashboardItem(
        name: AppStrings.shipConfirm, iconPath: ImageAssets.shipConfirm),
    DashboardItem(
        name: AppStrings.splitCombine, iconPath: ImageAssets.shipConfirm),
  ];

  // Dashboard List
//   static List<String> lpnSplitItems = [
//     AppStrings.newLPN,
//     AppStrings.existingLPN,
//   ];
// }
}

class AppVersion {
  // App Version
  static const String appVersionZJDE0001 = "ZJDE0001";
  static const String appVersionZJDE0002 = "ZJDE0002";
  static const String appVersionZJDE0003 = "ZJDE0003";
  static const String appVersionNAP0010 = "NAP0010";
  static const String appVersionNAPM0002 = "NAPM0002";
}
