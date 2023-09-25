import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sky_watch/presentation/resources/api_manager.dart';

import '../responses/responses.dart';

part 'app_api.g.dart';

// RETROFIT AUTO CODE GENERATOR COMMAND
// flutter pub run build_runner build

@RestApi(baseUrl: APIManager.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(APIManager.login)
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> map,
  );

  @POST(APIManager.logout)
  Future<LogoutResponse> logout(
    @Body() Map<String, dynamic> map,
  );

  // @POST(APIManager.getPOReceipt)
  // Future<POReceiptWarehouseResponse> getOrderDetails(
  //   @Body() Map<String, dynamic> map,
  // );

  // // Validate LPN
  // @POST(APIManager.validateLPN)
  // Future<LPNVAlidationMessageResponse> validateLPN(
  //   @Body() Map<String, dynamic> map,
  // );

  // @POST(APIManager.processPOReceipt)
  // Future<ProcessPoReceiptResponse> processPOReceipt(
  //   @Body() Map<String, dynamic> map,
  // );

  // // Branch Plant
  // @POST(APIManager.branchPlantList)
  // Future<BranchPlantResponse> getBranchPlant(
  //   @Body() Map<String, dynamic> map,
  // );

  // /// Pick confirm
  // // Pick Confirm Driver Details
  // @POST(APIManager.getPickConfirmDriverDetails)
  // Future<PickConfirmDirverDetailsResponse> getDriverDetailsPickConfirm(
  //   @Body() Map<String, dynamic> map,
  // );

  // // Search And Select
  // @POST(APIManager.searchAndSelectList)
  // Future<SearchAndSelectResponse> getSearchAndSelect(
  //   @Body() Map<String, dynamic> map,
  // );

  // // Pick Confirm Procss
  // @POST(APIManager.getPickConfirm)
  // Future<PickConfirmResponse> processPickConfirm(
  //   @Body() Map<String, dynamic> map,
  // );

  /// COMBINE SPLIT
  // Get LPN Info
  @POST(APIManager.getCombineSplitLPNInfo)
  Future<CombineSplitLPNInfoResponse> getCombineSplitLPNInfo(
    @Body() Map<String, dynamic> map,
  );

  // New LPN
  @POST(APIManager.getCombineSplitNewLPN)
  Future<CombineSplitNewLPNResponse> getCombineSplitNewLPN(
    @Body() Map<String, dynamic> map,
  );

  // Process LPN
  @POST(APIManager.processCombineSplitLPN)
  Future<CombineSplitProcessLPNResponse> processCombineSplitLPN(
    @Body() Map<String, dynamic> map,
  );
}
