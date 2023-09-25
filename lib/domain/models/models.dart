class DashboardItem {
  late String name;
  late String iconPath;

  DashboardItem({
    required this.name,
    required this.iconPath,
  });
}

// Sample
// class RequestInquiryItem {
//   late String lpn;
//   late String lot;
//   late String qty;
//   late String status;
//   late String from;
//   late String to;
//   late String size;
//   late String lastValue;

//   RequestInquiryItem({
//     required this.lpn,
//     required this.lot,
//     required this.qty,
//     required this.status,
//     required this.from,
//     required this.to,
//     required this.size,
//     required this.lastValue,
//   });

//   static List<RequestInquiryItem> requestInquiryList = [
//     RequestInquiryItem(
//       lpn: 'B1BOOO3024',
//       lot: '02/03/2022',
//       qty: '66',
//       status: 'Ready to Confirm',
//       from: 'YD2',
//       to: 'GS38',
//       size: '5.0L/4PK CE..',
//       lastValue: 'P10484-040ALMADEN PG/COLOM AM IBNV',
//     ),
//     RequestInquiryItem(
//       lpn: 'B1BOOO3024',
//       lot: '02/03/2023',
//       qty: '63',
//       status: 'Ready to Confirm',
//       from: 'YD3',
//       to: 'GS37',
//       size: '5.0L/41PK CE..',
//       lastValue: 'P10484-041ALMADEN PG/COLOM AM IBNV',
//     ),
//     RequestInquiryItem(
//       lpn: 'B1BOOO3024',
//       lot: '02/04/2023',
//       qty: '67',
//       status: 'Ready to Confirm',
//       from: 'YD1',
//       to: 'GS36',
//       size: '5.0L/42PK CE..',
//       lastValue: 'P10484-042ALMADEN PG/COLOM AM IBNV',
//     ),
//     RequestInquiryItem(
//       lpn: 'B1BOOO3024',
//       lot: '02/06/2023',
//       qty: '61',
//       status: 'Ready to Confirm',
//       from: 'YD5',
//       to: 'GS39',
//       size: '5.0L/4PK CE..',
//       lastValue: 'P10484-049ALMADEN PG/COLOM AM IBNV',
//     ),
//   ];
// }

// API CALLS
class Login {
  UserInfo? userInfo;
  String? username;
  Login({
    required this.userInfo,
    required this.username,
  });
}

class UserInfo {
  String? token;
  String? username;
  UserInfo({
    required this.token,
    required this.username,
  });
}

class Logout {
  String? status;
  Logout({
    required this.status,
  });
}
//   Sample

// class POReceiptWarehouseOperations {
//   ResponseModel? response;
//   List<WarehouseOperations>? warehouseOperations;
//   POReceiptWarehouseOperations({
//     required this.response,
//     required this.warehouseOperations,
//   });
// }

// class WarehouseOperations {
//   String? itemNumber;
//   int? addressNumber;
//   String? doorNumber;
//   String? lotSerialNumber;
//   String? orderType;
//   int? orderNumber;
//   double? quantityReceived;
//   int? shipToNumber;
//   int? trailerNumber;
//   int? lineNumber;
//   int? quantityOpen;
//   String? itemDescription;
//   String? unitMeasure;

//   WarehouseOperations({
//     required this.itemNumber,
//     required this.addressNumber,
//     required this.doorNumber,
//     required this.lotSerialNumber,
//     required this.orderType,
//     required this.orderNumber,
//     required this.quantityReceived,
//     required this.shipToNumber,
//     required this.trailerNumber,
//     required this.lineNumber,
//     required this.quantityOpen,
//     required this.itemDescription,
//     required this.unitMeasure,
//   });
// }

// Sample

// class POReceiptLPNValidationOperations {
//   ResponseModel? response;
//   POReceiptLPNValidationOperations({
//     required this.response,
//   });
// }

// //
// class ResponseModel {
//   String? output;
//   bool? success;
//   dynamic response;
//   ResponseModel({
//     required this.output,
//     required this.success,
//     required this.response,
//   });
// }

// class MessageResponseModel {
//   String? output;
//   bool? success;
//   String? response;
//   MessageResponseModel({
//     required this.output,
//     required this.success,
//     required this.response,
//   });
// }

// Sample

// class ProcessReceiptPurchase {
//   ProcessReceiptPurchaseMessage? processReceiptPurchaseMessage;
//   ProcessReceiptPurchase({
//     required this.processReceiptPurchaseMessage,
//   });
// }

// class ProcessReceiptPurchaseMessage {
//   String? output;
//   bool? success;
//   dynamic response;
//   List<ProcessReceiptPurchaseList>? processReceiptPurchaseList;

//   ProcessReceiptPurchaseMessage({
//     required this.output,
//     required this.success,
//     required this.response,
//     required this.processReceiptPurchaseList,
//   });
// }

// class ProcessReceiptPurchaseList {
//   String? orderType;
//   String? orderDate;
//   String? description;
//   int? lineNumber;
//   int? orderNumber;
//   int? quantityOpen;
//   String? itemNumber;
//   int? supplier;
//   int? shipTo;

//   ProcessReceiptPurchaseList({
//     required this.orderType,
//     required this.orderDate,
//     required this.description,
//     required this.lineNumber,
//     required this.orderNumber,
//     required this.quantityOpen,
//     required this.itemNumber,
//     required this.supplier,
//     required this.shipTo,
//   });
// }

/// COMBINE SPLIT
// Get LPN Info
class CombineSplitLPNInfo {
  CombineSplitLPNInfoMessage? message;

  CombineSplitLPNInfo({
    required this.message,
  });
}

class CombineSplitLPNInfoMessage {
  String? output;
  bool? success;
  dynamic response;
  List<CombineSplitLPNInfoRecord>? record;

  CombineSplitLPNInfoMessage({
    required this.output,
    required this.success,
    required this.response,
    required this.record,
  });
}

class CombineSplitLPNInfoRecord {
  String? productFrom;
  String? productSizeFrom;
  String? productPackFrom;
  String? lotNumberFrom;
  String? locationFrom;
  int? originalQuantityFrom;

  CombineSplitLPNInfoRecord({
    required this.productFrom,
    required this.productSizeFrom,
    required this.productPackFrom,
    required this.lotNumberFrom,
    required this.locationFrom,
    required this.originalQuantityFrom,
  });
}

final emptyCombineSplitLPNInfoRecord = CombineSplitLPNInfoRecord(
  productFrom: '',
  productSizeFrom: '',
  productPackFrom: '',
  lotNumberFrom: '',
  locationFrom: '',
  originalQuantityFrom: 0,
);

// New LPN
class CombineSplitNewLPN {
  CombineSplitNewLPNMessage? message;

  CombineSplitNewLPN({
    required this.message,
  });
}

class CombineSplitNewLPNMessage {
  String? output;
  bool? success;
  dynamic response;
  List<CombineSplitNewLPNRecord>? record;

  CombineSplitNewLPNMessage({
    required this.output,
    required this.success,
    required this.response,
    required this.record,
  });
}

class CombineSplitNewLPNRecord {
  String? errorCode;
  String? errorMessageID;
  String? licensePlateNumber;

  CombineSplitNewLPNRecord({
    required this.errorCode,
    required this.errorMessageID,
    required this.licensePlateNumber,
  });
}

// Process LPN - Combine Split
class CombineSplitProcessLPN {
  CombineSplitProcessLPNMessage? message;

  CombineSplitProcessLPN({
    required this.message,
  });
}

class CombineSplitProcessLPNMessage {
  String? output;
  bool? success;
  dynamic response;

  CombineSplitProcessLPNMessage({
    required this.output,
    required this.success,
    required this.response,
  });
}
