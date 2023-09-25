class LoginRequest {
  String username;
  String password;
  LoginRequest(this.username, this.password);
}

class LogoutRequest {
  String token;
  LogoutRequest(
    this.token,
  );
}

// class POReceiptWarehouseRequest {
//   String orderNumber;
//   String trailer;
//   String doorNumber;

//   POReceiptWarehouseRequest(
//     this.orderNumber,
//     this.trailer,
//     this.doorNumber,
//   );
// }

// // LPN VAlidation
// class POReceiptLPNValidationRequest {
//   String lpn;

//   POReceiptLPNValidationRequest(
//     this.lpn,
//   );
// }

// class ReceiptPurchaseRequest {
//   String lineNumber;
//   String orderNumber;
//   String licensePlateNumber;
//   String quantity;
//   String lotExpirationDate;
//   String branchPlant;
//   String supplierLot;
//   String productionDate;
//   String receiptDate;
//   String supplierRemark;
//   String appVersion;

//   ReceiptPurchaseRequest(
//     this.lineNumber,
//     this.orderNumber,
//     this.licensePlateNumber,
//     this.quantity,
//     this.lotExpirationDate,
//     this.branchPlant,
//     this.supplierLot,
//     this.productionDate,
//     this.receiptDate,
//     this.supplierRemark,
//     this.appVersion,
//   );
// }

// // Request for pick confirm Dirver number
// class PickingSuggestionsDashboardRequest {
//   String driverID;
//   String orderNumber;

//   PickingSuggestionsDashboardRequest(
//     this.driverID,
//     this.orderNumber,
//   );
// }

/// COMBINE SPLIT
class CombineSplitLPNInfoRequest {
  String fromLicensePlateNumber;

  CombineSplitLPNInfoRequest(this.fromLicensePlateNumber);
}

class CombineSplitNewLPNNumberRequest {
  String branchPlant;

  CombineSplitNewLPNNumberRequest(this.branchPlant);
}

class CombineSplitProcessLPNRequest {
  String fromLicensePlateNumber;
  String quantityMoved;
  String toLicensePlateNumber;

  CombineSplitProcessLPNRequest(
    this.fromLicensePlateNumber,
    this.quantityMoved,
    this.toLicensePlateNumber,
  );
}
