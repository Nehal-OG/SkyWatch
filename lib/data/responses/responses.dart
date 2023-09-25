import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "deprecated")
  bool? deprecated;

  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class BaseMessageResponse {
  @JsonKey(name: "message")
  MessageResponse? messageResponse;
}

@JsonSerializable()
class MessageResponse {
  @JsonKey(name: "output")
  String? output;

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "response")
  dynamic response;

  MessageResponse({
    required this.output,
    required this.success,
    required this.response,
  });

  // from json
  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}

// @JsonSerializable()
// class CommonMessageResponse {
//   @JsonKey(name: "output")
//   String? output;

//   @JsonKey(name: "success")
//   bool? success;

//   @JsonKey(name: "response")
//   String response;

//   CommonMessageResponse({
//     required this.output,
//     required this.success,
//     required this.response,
//   });

//   // from json
//   factory CommonMessageResponse.fromJson(Map<String, dynamic> json) =>
//       _$CommonMessageResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$CommonMessageResponseToJson(this);
// }

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: "userInfo")
  UserInfoResponse? userInfo;

  @JsonKey(name: "username")
  String? username;

  LoginResponse({
    required this.userInfo,
    required this.username,
  });

  // from json
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserInfoResponse {
  @JsonKey(name: "token")
  String? token;

  @JsonKey(name: "username")
  String? username;

  UserInfoResponse({
    required this.token,
    required this.username,
  });

  // from json
  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable()
class LogoutResponse extends BaseResponse {
  @JsonKey(name: "status")
  String? status;

  LogoutResponse({required this.status});

  // from json
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}

/// Sample

// @JsonSerializable()
// class POReceiptWarehouseResponse {
//   @JsonKey(name: "message")
//   MessageResponse? messageResponse;

//   @JsonKey(name: "P554311B_W554311BA")
//   List<WarehouseReceiptResponse>? warehouseReceipt;

//   POReceiptWarehouseResponse({
//     required this.messageResponse,
//     required this.warehouseReceipt,
//   });

//   // from json
//   factory POReceiptWarehouseResponse.fromJson(Map<String, dynamic> json) =>
//       _$POReceiptWarehouseResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$POReceiptWarehouseResponseToJson(this);
// }

// @JsonSerializable()
// class WarehouseReceiptResponse {
//   @JsonKey(name: "itemNumber")
//   String? itemNumber;

//   @JsonKey(name: "addressNumber")
//   int? addressNumber;

//   @JsonKey(name: "doorNumber")
//   String? doorNumber;

//   @JsonKey(name: "lotSerialNumber")
//   String? lotSerialNumber;

//   @JsonKey(name: "orderType")
//   String? orderType;

//   @JsonKey(name: "orderNumber")
//   int? orderNumber;

//   @JsonKey(name: "qunatityReceived")
//   double? quantityReceived;

//   @JsonKey(name: "shipToNumber")
//   int? shipToNumber;

//   @JsonKey(name: "trailerNumber")
//   int? trailerNumber;

//   @JsonKey(name: "lineNumber")
//   int? lineNumber;

//   @JsonKey(name: "quantityOpen")
//   int? quantityOpen;

//   @JsonKey(name: "itemDescription")
//   String? itemDescription;

//   @JsonKey(name: "unitMeasure")
//   String? unitMeasure;

//   WarehouseReceiptResponse({
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

//   // from json
//   factory WarehouseReceiptResponse.fromJson(Map<String, dynamic> json) =>
//       _$WarehouseReceiptResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$WarehouseReceiptResponseToJson(this);
// }

// // LPN VALIDATION

// @JsonSerializable()
// class LPNVAlidationMessageResponse {
//   @JsonKey(name: "message")
//   MessageResponse? messageResponse;

//   LPNVAlidationMessageResponse({
//     required this.messageResponse,
//   });
//   // from json
//   factory LPNVAlidationMessageResponse.fromJson(Map<String, dynamic> json) =>
//       _$LPNVAlidationMessageResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$LPNVAlidationMessageResponseToJson(this);
// }

// // Po Receipt Process
// @JsonSerializable()
// class ProcessPoReceiptResponse {
//   @JsonKey(name: "message")
//   ProcessPoReceiptMessageResponse? processPoReceiptMessageResponse;

//   ProcessPoReceiptResponse({
//     required this.processPoReceiptMessageResponse,
//   });

//   // from json
//   factory ProcessPoReceiptResponse.fromJson(Map<String, dynamic> json) =>
//       _$ProcessPoReceiptResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$ProcessPoReceiptResponseToJson(this);
// }

// @JsonSerializable()
// class ProcessPoReceiptMessageResponse {
//   @JsonKey(name: "output")
//   String? output;

//   @JsonKey(name: "success")
//   bool? success;

//   @JsonKey(name: "response")
//   dynamic response;

//   @JsonKey(name: "record")
//   List<ProcessPoReceiptRecordResponse>? processPoReceiptRecordResponse;

//   ProcessPoReceiptMessageResponse({
//     required this.output,
//     required this.success,
//     required this.response,
//     required this.processPoReceiptRecordResponse,
//   });

//   // from json
//   factory ProcessPoReceiptMessageResponse.fromJson(Map<String, dynamic> json) =>
//       _$ProcessPoReceiptMessageResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() =>
//       _$ProcessPoReceiptMessageResponseToJson(this);
// }

// @JsonSerializable()
// class ProcessPoReceiptRecordResponse {
//   @JsonKey(name: "orderType")
//   String? orderType;

//   @JsonKey(name: "orderDate")
//   String? orderDate;

//   @JsonKey(name: "description")
//   String? description;

//   @JsonKey(name: "lineNumber")
//   int? lineNumber;

//   @JsonKey(name: "orderNumber")
//   int? orderNumber;

//   @JsonKey(name: "quantityOpen")
//   int? quantityOpen;

//   @JsonKey(name: "itemNumber")
//   String? itemNumber;

//   @JsonKey(name: "supplier")
//   int? supplier;

//   @JsonKey(name: "shipTo")
//   int? shipTo;

//   ProcessPoReceiptRecordResponse({
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

//   // from json
//   factory ProcessPoReceiptRecordResponse.fromJson(Map<String, dynamic> json) =>
//       _$ProcessPoReceiptRecordResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$ProcessPoReceiptRecordResponseToJson(this);
// }

// /// Pick Confirm
// // Pick  Confirm Driver Details
// @JsonSerializable()
// class PickConfirmDirverDetailsResponse {
//   @JsonKey(name: "message")
//   MessageResponsePickConfirm? messageResponsePickConfirmDriverDetails;

//   PickConfirmDirverDetailsResponse({
//     required this.messageResponsePickConfirmDriverDetails,
//   });

//   // from json
//   factory PickConfirmDirverDetailsResponse.fromJson(
//           Map<String, dynamic> json) =>
//       _$PickConfirmDirverDetailsResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() =>
//       _$PickConfirmDirverDetailsResponseToJson(this);
// }

// @JsonSerializable()
// class MessageResponsePickConfirm {
//   @JsonKey(name: "output")
//   String? output;

//   @JsonKey(name: "success")
//   bool? success;

//   @JsonKey(name: "response")
//   String? response;

//   @JsonKey(name: "record")
//   List<PickConfirmReceiptRecordResponse>? pickConfirmReceiptRecordResponse;

//   MessageResponsePickConfirm({
//     required this.output,
//     required this.success,
//     required this.response,
//     required this.pickConfirmReceiptRecordResponse,
//   });

//   // from json
//   factory MessageResponsePickConfirm.fromJson(Map<String, dynamic> json) =>
//       _$MessageResponsePickConfirmFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$MessageResponsePickConfirmToJson(this);
// }

// @JsonSerializable()
// class PickConfirmReceiptRecordResponse {
//   @JsonKey(name: "orderCompany")
//   String? orderCompany;

//   @JsonKey(name: "orderNumber")
//   int? orderNumber;

//   @JsonKey(name: "orderType")
//   String? orderType;

//   @JsonKey(name: "lineNumber")
//   double? lineNumber;

//   @JsonKey(name: "itemNumber")
//   String? itemNumber;

//   @JsonKey(name: "unitMeasure")
//   String? unitMeasure;

//   @JsonKey(name: "pickQuantity")
//   int? pickQuantity;

//   @JsonKey(name: "fromLocation")
//   String? fromLocation;

//   @JsonKey(name: "fromLot")
//   String? fromLot;

//   @JsonKey(name: "itemDescription")
//   String? itemDescription;

//   @JsonKey(name: "pickDate")
//   String? pickDate;

//   @JsonKey(name: "driverNumber")
//   int? driverNumber;

//   @JsonKey(name: "fromLicensePlateNumber")
//   String? fromLicensePlateNumber;

//   PickConfirmReceiptRecordResponse({
//     required this.orderCompany,
//     required this.orderNumber,
//     required this.orderType,
//     required this.lineNumber,
//     required this.itemNumber,
//     required this.unitMeasure,
//     required this.pickQuantity,
//     required this.fromLocation,
//     required this.fromLot,
//     required this.itemDescription,
//     required this.pickDate,
//     required this.fromLicensePlateNumber,
//   });

//   // from json
//   factory PickConfirmReceiptRecordResponse.fromJson(
//           Map<String, dynamic> json) =>
//       _$PickConfirmReceiptRecordResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() =>
//       _$PickConfirmReceiptRecordResponseToJson(this);
// }

// // PICK CONFIRM ORDER
// @JsonSerializable()
// class PickConfirmResponseOrder {
//   @JsonKey(name: "message")
//   MessageResponsePickConfirmOrder? messageResponsePickConfirmOrder;

//   PickConfirmResponseOrder({
//     required this.messageResponsePickConfirmOrder,
//   });

//   // from json
//   factory PickConfirmResponseOrder.fromJson(Map<String, dynamic> json) =>
//       _$PickConfirmResponseOrderFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$PickConfirmResponseOrderToJson(this);
// }

// @JsonSerializable()
// class MessageResponsePickConfirmOrder {
//   @JsonKey(name: "output")
//   String? output;

//   @JsonKey(name: "success")
//   bool? success;

//   @JsonKey(name: "response")
//   String? response;

//   @JsonKey(name: "record")
//   List<PickConfirmOrderRecordResponse>? pickConfirmOrderRecordResponse;

//   MessageResponsePickConfirmOrder({
//     required this.output,
//     required this.success,
//     required this.response,
//     required this.pickConfirmOrderRecordResponse,
//   });

//   // from json
//   factory MessageResponsePickConfirmOrder.fromJson(Map<String, dynamic> json) =>
//       _$MessageResponsePickConfirmOrderFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() =>
//       _$MessageResponsePickConfirmOrderToJson(this);
// }

// @JsonSerializable()
// class PickConfirmOrderRecordResponse {
//   PickConfirmOrderRecordResponse({

//   });

//   // from json
//   factory PickConfirmOrderRecordResponse.fromJson(Map<String, dynamic> json) =>
//       _$PickConfirmOrderRecordResponseFromJson(json);

//   // to json
//   Map<String, dynamic> toJson() => _$PickConfirmOrderRecordResponseToJson(this);
// }

/// COMBINE SPLIT
// Get LPN Info
@JsonSerializable()
class CombineSplitLPNInfoResponse {
  @JsonKey(name: "message")
  CombineSplitLPNInfoMessageResponse? messageResponse;

  CombineSplitLPNInfoResponse({
    required this.messageResponse,
  });

  // from json
  factory CombineSplitLPNInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$CombineSplitLPNInfoResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$CombineSplitLPNInfoResponseToJson(this);
}

@JsonSerializable()
class CombineSplitLPNInfoMessageResponse {
  @JsonKey(name: "output")
  String? output;

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "response")
  dynamic response;

  @JsonKey(name: "record")
  List<CombineSplitLPNInfoRecordResponse>? recordResponse;

  CombineSplitLPNInfoMessageResponse({
    required this.output,
    required this.success,
    required this.response,
    required this.recordResponse,
  });

  // from json
  factory CombineSplitLPNInfoMessageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CombineSplitLPNInfoMessageResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() =>
      _$CombineSplitLPNInfoMessageResponseToJson(this);
}

@JsonSerializable()
class CombineSplitLPNInfoRecordResponse {
  @JsonKey(name: "productFrom")
  String? productFrom;

  @JsonKey(name: "productSizeFrom")
  String? productSizeFrom;

  @JsonKey(name: "productPackFrom")
  String? productPackFrom;

  @JsonKey(name: "lotNumberFrom")
  String? lotNumberFrom;

  @JsonKey(name: "locationFrom")
  String? locationFrom;

  @JsonKey(name: "originalQuantityFrom")
  int? originalQuantityFrom;

  CombineSplitLPNInfoRecordResponse({
    required this.productFrom,
    required this.productSizeFrom,
    required this.productPackFrom,
    required this.lotNumberFrom,
    required this.locationFrom,
    required this.originalQuantityFrom,
  });

  // from json
  factory CombineSplitLPNInfoRecordResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CombineSplitLPNInfoRecordResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() =>
      _$CombineSplitLPNInfoRecordResponseToJson(this);
}

// New LPN
@JsonSerializable()
class CombineSplitNewLPNResponse {
  @JsonKey(name: "message")
  CombineSplitNewLPNMessageResponse? messageResponse;

  CombineSplitNewLPNResponse({
    required this.messageResponse,
  });

  // from json
  factory CombineSplitNewLPNResponse.fromJson(Map<String, dynamic> json) =>
      _$CombineSplitNewLPNResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$CombineSplitNewLPNResponseToJson(this);
}

@JsonSerializable()
class CombineSplitNewLPNMessageResponse {
  @JsonKey(name: "output")
  String? output;

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "response")
  dynamic response;

  @JsonKey(name: "record")
  List<CombineSplitNewLPNRecordResponse>? recordResponse;

  CombineSplitNewLPNMessageResponse({
    required this.output,
    required this.success,
    required this.response,
    required this.recordResponse,
  });

  // from json
  factory CombineSplitNewLPNMessageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CombineSplitNewLPNMessageResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() =>
      _$CombineSplitNewLPNMessageResponseToJson(this);
}

@JsonSerializable()
class CombineSplitNewLPNRecordResponse {
  @JsonKey(name: "errorCode")
  String? errorCode;

  @JsonKey(name: "errorMessageID")
  String? errorMessageID;

  @JsonKey(name: "licensePlateNumber")
  String? licensePlateNumber;

  CombineSplitNewLPNRecordResponse({
    required this.errorCode,
    required this.errorMessageID,
    required this.licensePlateNumber,
  });

  // from json
  factory CombineSplitNewLPNRecordResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CombineSplitNewLPNRecordResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() =>
      _$CombineSplitNewLPNRecordResponseToJson(this);
}

// Process LPN - Combine Split
@JsonSerializable()
class CombineSplitProcessLPNResponse {
  @JsonKey(name: "message")
  CombineSplitProcessLPNMessageResponse? messageResponse;

  CombineSplitProcessLPNResponse({
    required this.messageResponse,
  });

  // from json
  factory CombineSplitProcessLPNResponse.fromJson(Map<String, dynamic> json) =>
      _$CombineSplitProcessLPNResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$CombineSplitProcessLPNResponseToJson(this);
}

@JsonSerializable()
class CombineSplitProcessLPNMessageResponse {
  @JsonKey(name: "output")
  String? output;

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "response")
  dynamic response;

  CombineSplitProcessLPNMessageResponse({
    required this.output,
    required this.success,
    required this.response,
  });

  // from json
  factory CombineSplitProcessLPNMessageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CombineSplitProcessLPNMessageResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() =>
      _$CombineSplitProcessLPNMessageResponseToJson(this);
}
