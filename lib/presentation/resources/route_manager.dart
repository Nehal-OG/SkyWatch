import 'package:get/get.dart';
import 'package:SkyWatch/application/di.dart';
import 'package:SkyWatch/presentation/pages/dashboard/dashboard_view.dart';
import 'package:SkyWatch/presentation/pages/current_weather/current_weather_view.dart';
import 'package:SkyWatch/presentation/pages/settings/settings_view.dart';
import 'package:SkyWatch/presentation/pages/splash/splash_view.dart';
import 'package:SkyWatch/presentation/pages/unknown/unknown_view.dart';

class Routes {
  /// SPLASH
  static const String splashRoute = '/';

  /// LOGIN
  static const String loginRoute = '/login';

  /// DASHBOARD
  static const String dashboardRoute = '/dashboard';

  /// PO RECEIPT
  // Warehouse Operations
  static const String warehouseOperationsRoute =
      '/poReceipt/warehouseOperations';
  // Receipt Purchase
  static const String receiptPurchaseRoute = '/poReceipt/receiptPurchase';
  static const String branchPlantRoute =
      '/poReceipt/receiptPurchase/branchPlant';

  /// PUT AWAY
  // Request Inquiry
  static const String putAwayRequestEnquiryRoute = '/putAway/requestInquiry';
  static const String putAwayConfirmSuggestionsRoute =
      '/putAway/confirmSuggestions';

  /// PICK CONFIRM
  // pick suggestions dashboard
  static const String pickConfirmRequestEnquiryRoute =
      '/pickCofirm/pickingSuggestionsDashboard';
  // // mode transportation driver details
  // static const String pickConfirmDriverDetails =
  //     '/pickCofirm/modeTransportationDriverDetails';
  // // mode transportation Order
  // static const String pickConfirmOrder =
  //     '/pickCofirm/modeTransportationDriverDetails/modeTransportationOrder';
  // mode transportation Order Details
  static const String pickConfirmOrderDetails =
      '/pickCofirm/pickingSuggestionsDashboard/modeTransportationOrderDetails';
  // Search And Select LPN/LOction
  static const String pickConfirmSearchAndSelectLPNAndLocation =
      '/pickCofirm/modeTransportationDriverDetails/modeTransportationOrder/pickConfirmSearchAndSelectLPNAndLocation';

  /// ORDER POSTING
  // Production Posting
  static const String productionPostingRoute =
      '/orderPosting/productionPosting';

  /// Cycle Count
  // Initial Screen
  static const String cycleCountInitial = '/cycleCountInitial';
  // Get list
  static const String cycleCountEnquiryRoute = '/cycleCountMain';
  //Add Count Response
  static const String cycleCountACResponse = '/cycleCountMain/addCount';
  //Add Lpn Response
  static const String cycleCountAddLPNResponse = '/cycleCountMain/addLPN';

  /// COMBINE / SPLIT
  static const String combineSplitRoute = '/combineSplit';
  static const String lpnSplitRoute = '/combineSplit/lpnSplit';

  /// replenishment
  static const String replenishmentRoute = '/replenishment';

  /// replenishment Inquiry
  static const String replenishmentInquiryRoute = '/replenishmentInquiry';

  /// Replenishment Confirmation Process
  static const String replenishmentConfirmationRoute =
      '/replenishmentConfirmation';

  /// WO Put Away
  // static const String woPutAway = '/woPutAway';
  static const String woLPNConfirmation = '/woPutAway/lcnConfirmation';
  static const String woChangeLocation =
      '/woPutAway/lcnConfirmation/changeLocation';

  /// WO Picking
  static const String woPicking = '/woPicking';
  static const String woPickingITM = '/woPicking/woPickingITM';

  /// SHIP CONFIRM
  // Fetch
  static const String shipConfirmFetch = '/shipConfirm';
  // Get LPN
  static const String shipConfirmGetLPN = '/shipConfirm/getLPN';
  // Action Pending
  static const String shipConfirmActionPending = '/shipConfirm/acionPending';

  /// SETTINGS
  static const String settingsRoute = '/settings';

  /// UNKNOWN
  static const String unknownRoute = '/notFound';
}

class RouteGenerator {
  static List<GetPage<dynamic>> getPages = [
    /// SPLASH
    GetPage(
      name: Routes.splashRoute,
      page: () {
        initSplashModule();
        return const SplashView();
      },
    ),

    /// LOGIN
    GetPage(
      name: Routes.loginRoute,
      page: () {
        initLoginModule();
        return const LoginView();
      },
    ),

    /// LOGIN
    GetPage(
      name: Routes.settingsRoute,
      page: () {
        initSettingsModule();
        return const SettingsView();
      },
    ),

    /// DASHBOARD
    GetPage(
      name: Routes.dashboardRoute,
      page: () {
        initDashboardModule();
        return const DashboardView();
      },
    ),
  ];

  /// UNKNOWN
  static GetPage<dynamic> unknownRoute = GetPage(
    name: Routes.unknownRoute,
    page: () => const UnknownView(),
  );
}
