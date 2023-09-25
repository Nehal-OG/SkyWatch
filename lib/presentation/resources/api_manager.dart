class APIManager {
  // BASE URL
  static const String baseUrl = "http://upgweb.napconational.com:7778/jderest/";

  // END POINTS
  static const String login = "/tokenrequest";
  static const String logout = "/tokenrequest/logout";

  /// PO RECEIPT
  static const String getPOReceipt = "/v3/orchestrator/ORC_55_get_PO_Receipt";
  static const String processPOReceipt =
      "/v3/orchestrator/ORC_55_process_PO_Receipt";
// LPN Validate
  static const String validateLPN = "/v3/orchestrator/ORC_55_confirmLPNExists";

  // Branch Plant
  static const String branchPlantList =
      "/v3/orchestrator/ORC_55_get_PO_BranchPlant";

  // Pick Confirm Driver Details
  static const String getPickConfirmDriverDetails =
      "/v3/orchestrator/ORC_55_getPickConfirmOrders";

  // Pick Confirm Order
  static const String getPickConfirmOrder =
      "/v3/orchestrator/ORC_55_getLPNInformationForPickConfirm";

  // Pick Confirm
  static const String getPickConfirm =
      "/v3/orchestrator/ORC_55_processPickConfirm";
  // Branch Plant
  static const String searchAndSelectList =
      "/v3/orchestrator/ORC_55_SwapLocationLPN";

  /// PUT AWAY
  // Request Inquiry
  static const String getRequestInquiry = '/v3/orchestrator/ORC_55_get_PutAway';
  static const String processRequestInquiry =
      '/v3/orchestrator/ORC_55_process_Put_Away';

  /// COMBINE SPLIT
  static const String getCombineSplitLPNInfo =
      '/v3/orchestrator/ORCH_55_GetLPNInfoForCombineSplit';
  static const String getCombineSplitNewLPN =
      '/v3/orchestrator/ORCH_55_getNewLPNNumber';
  static const String processCombineSplitLPN =
      '/v3/orchestrator/ORCH_55_processCombineSplit';

  //Cycle Count
  static const String cycleCountInitialScreenList =
      '/v3/orchestrator/ORCH_55_getCycleCountItemDetails';
  static const String cycleCountList = '/v3/orchestrator/ORCH_55_getCycleCount';
  static const String cycleCountProcess =
      '/v3/orchestrator/ORC_55_processCycleCount';
  static const String cycleCountDisassociate =
      '/v3/orchestrator/ORCH_55_CycleCountDisassociateLPN';
  static const String cycleCountLotDetails =
      '/v3/orchestrator/ORCH_55_getCycleCountLotDetails';

  // Replenishment Inquiry
  static const String getReplenishmentInquiry =
      '/v3/orchestrator/ORC_55_get_PutAway';
  // "/v3/orchestrator/ORCH_55_getRequestEnquiry";

  static const String getReplenishmentFromLocation =
      "/v3/orchestrator/ORCH_55_getLocationManualReplenishments";
  static const String getReplenishmentProcess =
      "/v3/orchestrator/ORCH_55_processManualReplenishment2";

  // SHIP CONFIRM
  // FETCH
  static const String getOrdersForShipConfirmation =
      "/v3/orchestrator/ORCH_55_getOrdersForShipConfirmation";
  static const String getLPNForShipConfirmForOrder =
      "/v3/orchestrator/ORCH_55_getLPNForShipConfirmForOrder";
  static const String getshipConfirmationUKID =
      "v3/orchestrator/ORCH_55_getshipConfirmationUKID";

  /// WO PUTAWAY
  // // Order
  // static const String getWorkOrderDetails =
  //     "v3/orchestrator/ORCH_55_getWorkOrderDetails";
  // // Process
  // static const String woPutawayProcess =
  //     "v3/orchestrator/ORCH_toExecuteWorkOrderReport";
  // // Cancel
  // static const String woPutawayCancel =
  //     "v3/orchestrator/ORCH_55_processWOPutawayCancelRequest";
  // Fetch Details
  static const String getWOPutAwayFetchDetails =
      "v3/orchestrator/ORCH_55_getWOPutAwayFetchDetails";
  // change Location

  static const String getWOChangeLocation =
      "v3/orchestrator/ORC_55_processWOPutAway";

  /// WO PicKing
  // change Location

  static const String getWOPickingChangeLocation =
      "v3/orchestrator/ORC_55_processWOPicking";
}

class APIErrors {
  static const String userInfoObjectMissing =
      'UserInfo object missing in the response!';
  static const String tokenInvalid = 'Token Invalid';
  static const String tokenExpired = 'Token Expired. Logging you out!';
}
