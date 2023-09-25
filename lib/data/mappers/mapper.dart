import 'package:SkyWatch/application/extensions.dart';
import 'package:SkyWatch/data/responses/responses.dart';
import 'package:SkyWatch/domain/models/models.dart';

extension UserInfoResponseMapper on UserInfoResponse {
  //convert APIs response to model for domain layer
  UserInfo toDomain() {
    return UserInfo(token: token.orEmpty(), username: username.orEmpty());
  }
}

extension LoginResponseMapper on LoginResponse {
  //convert APIs response to model for domain layer
  Login toDomain() {
    return Login(userInfo: userInfo?.toDomain(), username: username.orEmpty());
  }
}

extension LogoutResponseMapper on LogoutResponse {
  //convert APIs response to model for domain layer
  Logout toDomain() {
    return Logout(status: status.orEmpty());
  }
}

// extension POReceiptWarehouseResponseMapper on POReceiptWarehouseResponse {
//   //convert APIs response to model for domain layer
//   POReceiptWarehouseOperations toDomain() {
//     List<WarehouseOperations> warehouseOperations = (warehouseReceipt
//                 ?.map((servicesResponse) => servicesResponse.toDomain()) ??
//             const Iterable.empty())
//         .cast<WarehouseOperations>()
//         .toList();

//     return POReceiptWarehouseOperations(
//       response: messageResponse?.toDomain(),
//       warehouseOperations: warehouseOperations,
//     );
//   }
// }

// extension WarehouseReceiptResponseMapper on WarehouseReceiptResponse {
//   //convert APIs response to model for domain layer
//   WarehouseOperations toDomain() {
//     return WarehouseOperations(
//       itemNumber: itemNumber.orEmpty(),
//       addressNumber: addressNumber.orZero(),
//       doorNumber: doorNumber.orEmpty(),
//       lotSerialNumber: lotSerialNumber.orEmpty(),
//       orderType: orderType.orEmpty(),
//       orderNumber: orderNumber.orZero(),
//       quantityReceived: quantityReceived.orZero(),
//       shipToNumber: shipToNumber.orZero(),
//       trailerNumber: trailerNumber.orZero(),
//       lineNumber: lineNumber.orZero(),
//       quantityOpen: quantityOpen.orZero(),
//       itemDescription: itemDescription.orEmpty(),
//       unitMeasure: unitMeasure.orEmpty(),
//     );
//   }
// }

// // Validate LPN
// extension POReceiptLPNValidateResponseMapper on LPNVAlidationMessageResponse {
//   //convert APIs response to model for domain layer
//   POReceiptLPNValidationOperations toDomain() {
//     return POReceiptLPNValidationOperations(
//       response: messageResponse?.toDomain(),
//     );
//   }
// }

// extension MessageResponseMapper on MessageResponse {
//   //convert APIs response to model for domain layer
//   ResponseModel toDomain() {
//     return ResponseModel(
//       output: output.orEmpty(),
//       success: success,
//       response: response,
//     );
//   }
// }

// extension ReceiptPurchaseResponseMapper on ProcessPoReceiptResponse {
//   //convert APIs response to model for domain layer
//   ProcessReceiptPurchase toDomain() {
//     return ProcessReceiptPurchase(
//       processReceiptPurchaseMessage:
//           processPoReceiptMessageResponse?.toDomain(),
//     );
//   }
// }

// extension POReceiptProcessResponseMapper on ProcessPoReceiptMessageResponse {
//   //convert APIs response to model for domain layer
//   ProcessReceiptPurchaseMessage toDomain() {
//     List<ProcessReceiptPurchaseList> processReceiptPurchaseList =
//         (processPoReceiptRecordResponse
//                     ?.map((response) => response.toDomain()) ??
//                 const Iterable.empty())
//             .cast<ProcessReceiptPurchaseList>()
//             .toList();
//     // print(pickingSuggestionsRecord);
//     // print('2');
//     return ProcessReceiptPurchaseMessage(
//       output: output.orEmpty(),
//       success: success.orFalse(),
//       response: response,
//       processReceiptPurchaseList: processReceiptPurchaseList,
//     );
//   }
// }

// extension ReceiptPurchaseRecordResponseMapper
//     on ProcessPoReceiptRecordResponse {
//   //convert APIs response to model for domain layer
//   ProcessReceiptPurchaseList toDomain() {
//     return ProcessReceiptPurchaseList(
//         orderType: orderType.orEmpty(),
//         orderDate: orderDate.orEmpty(),
//         description: description.orEmpty(),
//         lineNumber: lineNumber.orZero(),
//         orderNumber: orderNumber.orZero(),
//         quantityOpen: quantityOpen.orZero(),
//         itemNumber: itemNumber.orEmpty(),
//         supplier: supplier.orZero(),
//         shipTo: shipTo.orZero());
//   }
// }

// /// PICK CONFIRM
// extension PickConfirmDriverDetailsResponseMapper
//     on PickConfirmDirverDetailsResponse {
//   //convert APIs response to model for domain layer
//   PickConfirmOperation toDomain() {
//     return PickConfirmOperation(
//         requestPickConfirmMessage:
//             messageResponsePickConfirmDriverDetails?.toDomain());
//   }
// }

// extension PickConfirmReceiptResponseMapper on MessageResponsePickConfirm {
//   //convert APIs response to model for domain layer
//   RequestPickConfirmMessage toDomain() {
//     List<PickingSuggestionsRecord> pickingSuggestionsRecord =
//         (pickConfirmReceiptRecordResponse
//                     ?.map((response) => response.toDomain()) ??
//                 const Iterable.empty())
//             .cast<PickingSuggestionsRecord>()
//             .toList();
//     // print(pickingSuggestionsRecord);
//     // print('2');
//     return RequestPickConfirmMessage(
//       output: output.orEmpty(),
//       success: success.orFalse(),
//       response: response.orEmpty(),
//       pickingSuggestionsRecord: pickingSuggestionsRecord,
//     );
//   }
// }

// extension PickConfirmRecordResponseMapper on PickConfirmReceiptRecordResponse {
//   //convert APIs response to model for domain layer
//   PickingSuggestionsRecord toDomain() {
//     return PickingSuggestionsRecord(
//       orderCompany: orderCompany.orEmpty(),
//       orderNumber: orderNumber.orZero(),
//       orderType: orderType.orEmpty(),
//       lineNumber: lineNumber.orZero(),
//       itemNumber: itemNumber.orEmpty(),
//       unitMeasure: unitMeasure.orEmpty(),
//       pickQuantity: pickQuantity.orZero(),
//       fromLocation: fromLocation.orEmpty(),
//       fromLot: fromLot.orEmpty(),
//       itemDescription: itemDescription.orEmpty(),
//       pickDate: pickDate.orEmpty(),
//       driverNumber: driverNumber.orZero(),
//       fromLicensePlateNumber: fromLicensePlateNumber.orEmpty(),
//     );
//   }
// }

/// COMBINE SPLIT
// Get LPN Info
extension CombineSplitLPNInfoResponseMapper on CombineSplitLPNInfoResponse {
  //convert APIs response to model for domain layer
  CombineSplitLPNInfo toDomain() {
    return CombineSplitLPNInfo(message: messageResponse?.toDomain());
  }
}

extension CombineSplitLPNInfoMessageResponseMapper
    on CombineSplitLPNInfoMessageResponse {
  //convert APIs response to model for domain layer
  CombineSplitLPNInfoMessage toDomain() {
    List<CombineSplitLPNInfoRecord> recordList =
        (recordResponse?.map((response) => response.toDomain()) ??
                const Iterable.empty())
            .cast<CombineSplitLPNInfoRecord>()
            .toList();

    return CombineSplitLPNInfoMessage(
      output: output.orEmpty(),
      success: success.orFalse(),
      response: response,
      record: recordList,
    );
  }
}

extension CombineSplitLPNInfoRecordResponseMapper
    on CombineSplitLPNInfoRecordResponse {
  //convert APIs response to model for domain layer
  CombineSplitLPNInfoRecord toDomain() {
    return CombineSplitLPNInfoRecord(
      productFrom: productFrom.orEmpty(),
      productSizeFrom: productSizeFrom.orEmpty(),
      productPackFrom: productPackFrom.orEmpty(),
      lotNumberFrom: lotNumberFrom.orEmpty(),
      locationFrom: locationFrom.orEmpty(),
      originalQuantityFrom: originalQuantityFrom.orZero(),
    );
  }
}

// New LPN
extension CombineSplitNewLPNResponseMapper on CombineSplitNewLPNResponse {
  //convert APIs response to model for domain layer
  CombineSplitNewLPN toDomain() {
    return CombineSplitNewLPN(message: messageResponse?.toDomain());
  }
}

extension CombineSplitNewLPNMessageResponseMapper
    on CombineSplitNewLPNMessageResponse {
  //convert APIs response to model for domain layer
  CombineSplitNewLPNMessage toDomain() {
    List<CombineSplitNewLPNRecord> recordList =
        (recordResponse?.map((response) => response.toDomain()) ??
                const Iterable.empty())
            .cast<CombineSplitNewLPNRecord>()
            .toList();

    return CombineSplitNewLPNMessage(
      output: output.orEmpty(),
      success: success.orFalse(),
      response: response,
      record: recordList,
    );
  }
}

extension CombineSplitNewLPNRecordResponseMapper
    on CombineSplitNewLPNRecordResponse {
  //convert APIs response to model for domain layer
  CombineSplitNewLPNRecord toDomain() {
    return CombineSplitNewLPNRecord(
      errorCode: errorCode.orEmpty(),
      errorMessageID: errorMessageID.orEmpty(),
      licensePlateNumber: licensePlateNumber.orEmpty(),
    );
  }
}

// Process LPN
extension CombineSplitProcessLPNResponseMapper
    on CombineSplitProcessLPNResponse {
  //convert APIs response to model for domain layer
  CombineSplitProcessLPN toDomain() {
    return CombineSplitProcessLPN(message: messageResponse?.toDomain());
  }
}

extension CombineSplitProcessLPNMessageResponseMapper
    on CombineSplitProcessLPNMessageResponse {
  //convert APIs response to model for domain layer
  CombineSplitProcessLPNMessage toDomain() {
    return CombineSplitProcessLPNMessage(
      output: output.orEmpty(),
      success: success.orFalse(),
      response: response,
    );
  }
}
