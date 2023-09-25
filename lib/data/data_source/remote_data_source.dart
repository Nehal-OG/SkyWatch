import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:SkyWatch/application/app_prefs.dart';
import '../network/app_api.dart';
import '../requests/requests.dart';
import '../responses/responses.dart';
import '../../application/extensions.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<LogoutResponse> logout(LogoutRequest logoutRequest);

  // /// PO RECEIPT
  // Future<POReceiptWarehouseResponse> getOrderDetails(
  //     POReceiptWarehouseRequest poReceiptWarehouseRequest);
  // // Validate LPN
  // Future<LPNVAlidationMessageResponse> validateLPN(
  //     POReceiptLPNValidationRequest poReceiptLPNValidationRequest);
  // //
  // Future<ProcessPoReceiptResponse> processPOReceipt(
  //     ReceiptPurchaseRequest receiptPurchaseRequest);
  // // Branch Plant
  // Future<BranchPlantResponse> getBranchPlant();
  // // Added
  // Future<PickConfirmDirverDetailsResponse> getDriverDetailsPickConfirm(
  //     PickingSuggestionsDashboardRequest pickingSuggestionsDashboardRequest);

  Future<CombineSplitProcessLPNResponse> processCombineSplitLPN(
      CombineSplitProcessLPNRequest processLPNRequest);

  /// COMBINE SPLI
  // Get LPN INfo
  Future<CombineSplitLPNInfoResponse> getCombineSplitLPNInfo(
      CombineSplitLPNInfoRequest lpnInfoRequest);
  // Confirm Suggestions
  Future<CombineSplitNewLPNResponse> getCombineSplitNewLPN(
      CombineSplitNewLPNNumberRequest newLPNNumberRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient appServiceClient;
  RemoteDataSourceImpl(this.appServiceClient);
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return await appServiceClient.login({
      'deviceName': deviceId.orEmpty(),
      'username': loginRequest.username,
      'password': loginRequest.password,
    });
  }

  @override
  Future<LogoutResponse> logout(LogoutRequest logoutRequest) async {
    String? token = Get.find<AppPreferences>().getUserToken();
    return await appServiceClient.logout({
      'token': token.orEmpty(),
    });
  }

//   @override
//   Future<POReceiptWarehouseResponse> getOrderDetails(
//       POReceiptWarehouseRequest poReceiptWarehouseRequest) async {
//     String? token = Get.find<AppPreferences>().getUserToken();
//     String? deviceId = await PlatformDeviceId.getDeviceId;
//     return await appServiceClient.getOrderDetails({
//       'token': token.orEmpty(),
//       'deviceName': deviceId,
//       'orderNumber': poReceiptWarehouseRequest.orderNumber,
//       'trailer': poReceiptWarehouseRequest.trailer,
//       'doorNumber': poReceiptWarehouseRequest.doorNumber,
//     });
//   }

// // Validate LPN
//   @override
//   Future<LPNVAlidationMessageResponse> validateLPN(
//       POReceiptLPNValidationRequest poReceiptLPNValidationRequest) async {
//     String? token = Get.find<AppPreferences>().getUserToken();
//     String? deviceId = await PlatformDeviceId.getDeviceId;
//     return await appServiceClient.validateLPN({
//       'token': token.orEmpty(),
//       'deviceName': deviceId,
//       'licensePlateNumber': poReceiptLPNValidationRequest.lpn,
//     });
//   }

//   /// PO RECEIPT
//   @override
//   Future<ProcessPoReceiptResponse> processPOReceipt(
//       ReceiptPurchaseRequest receiptPurchaseRequest) async {
//     String? token = Get.find<AppPreferences>().getUserToken();
//     String? deviceId = await PlatformDeviceId.getDeviceId;
//     return await appServiceClient.processPOReceipt({
//       'token': token.orEmpty(),
//       'deviceName': deviceId,
//       'lineNumber': receiptPurchaseRequest.lineNumber,
//       'orderNumber': receiptPurchaseRequest.orderNumber,
//       'licensePlateNumber': receiptPurchaseRequest.licensePlateNumber,
//       'quantity': receiptPurchaseRequest.quantity,
//       "lotExpirationDate": receiptPurchaseRequest.lotExpirationDate,
//       "branchPlant": receiptPurchaseRequest.branchPlant,
//       'supplierLot': receiptPurchaseRequest.supplierLot,
//       'productionDate': receiptPurchaseRequest.productionDate,
//       'receiptDate': receiptPurchaseRequest.receiptDate,
//       "supplierRemark": receiptPurchaseRequest.supplierRemark,
//       'appVersion': receiptPurchaseRequest.appVersion,
//     });
//   }

//   // Branch Plant
//   @override
//   Future<BranchPlantResponse> getBranchPlant() async {
//     String? token = Get.find<AppPreferences>().getUserToken();
//     String? deviceId = await PlatformDeviceId.getDeviceId;
//     return await appServiceClient.getBranchPlant({
//       'token': token.orEmpty(),
//       'deviceName': deviceId,
//     });
//   }

//   /// Pick Confirm
//   @override
//   Future<PickConfirmDirverDetailsResponse> getDriverDetailsPickConfirm(
//       PickingSuggestionsDashboardRequest
//           pickingSuggestionsDashboardRequest) async {
//     String? token = Get.find<AppPreferences>().getUserToken();
//     String? deviceId = await PlatformDeviceId.getDeviceId;
//     return await appServiceClient.getDriverDetailsPickConfirm({
//       'token': token.orEmpty(),
//       'deviceName': deviceId,
//       'driverID': pickingSuggestionsDashboardRequest.driverID,
//       "orderNumber": pickingSuggestionsDashboardRequest.orderNumber,
//     });
//   }

  /// COMBINE SPLIT
  // Get LPN Info
  @override
  Future<CombineSplitLPNInfoResponse> getCombineSplitLPNInfo(
      CombineSplitLPNInfoRequest lpnInfoRequest) async {
    String? token = Get.find<AppPreferences>().getUserToken();
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return await appServiceClient.getCombineSplitLPNInfo({
      'token': token.orEmpty(),
      'deviceName': deviceId,
      'fromLicensePlateNumber': lpnInfoRequest.fromLicensePlateNumber,
      'appVersion': "",
    });
  }

  // New LPN
  @override
  Future<CombineSplitNewLPNResponse> getCombineSplitNewLPN(
      CombineSplitNewLPNNumberRequest newLPNNumberRequest) async {
    String? token = Get.find<AppPreferences>().getUserToken();
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return await appServiceClient.getCombineSplitNewLPN({
      'token': token.orEmpty(),
      'deviceName': deviceId,
      'branchPlant': newLPNNumberRequest.branchPlant,
    });
  }

  // Process LPN
  @override
  Future<CombineSplitProcessLPNResponse> processCombineSplitLPN(
      CombineSplitProcessLPNRequest processLPNRequest) async {
    String? token = Get.find<AppPreferences>().getUserToken();
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return await appServiceClient.processCombineSplitLPN({
      'token': token.orEmpty(),
      'deviceName': deviceId,
      'fromLicensePlateNumber': processLPNRequest.fromLicensePlateNumber,
      'quantityMoved': processLPNRequest.quantityMoved,
      'toLicensePlateNumber': processLPNRequest.toLicensePlateNumber,
      'appVersion': "TEST0002",
    });
  }
}
