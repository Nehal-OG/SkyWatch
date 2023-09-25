// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..deprecated = json['deprecated'] as bool?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'deprecated': instance.deprecated,
      'message': instance.message,
    };

BaseMessageResponse _$BaseMessageResponseFromJson(Map<String, dynamic> json) =>
    BaseMessageResponse()
      ..messageResponse = json['message'] == null
          ? null
          : MessageResponse.fromJson(json['message'] as Map<String, dynamic>);

Map<String, dynamic> _$BaseMessageResponseToJson(
        BaseMessageResponse instance) =>
    <String, dynamic>{
      'message': instance.messageResponse,
    };

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      output: json['output'] as String?,
      success: json['success'] as bool?,
      response: json['response'],
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'output': instance.output,
      'success': instance.success,
      'response': instance.response,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      userInfo: json['userInfo'] == null
          ? null
          : UserInfoResponse.fromJson(json['userInfo'] as Map<String, dynamic>),
      username: json['username'] as String?,
    )
      ..deprecated = json['deprecated'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'deprecated': instance.deprecated,
      'message': instance.message,
      'userInfo': instance.userInfo,
      'username': instance.username,
    };

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      token: json['token'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponse(
      status: json['status'] as String?,
    )
      ..deprecated = json['deprecated'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'deprecated': instance.deprecated,
      'message': instance.message,
      'status': instance.status,
    };

CombineSplitLPNInfoResponse _$CombineSplitLPNInfoResponseFromJson(
        Map<String, dynamic> json) =>
    CombineSplitLPNInfoResponse(
      messageResponse: json['message'] == null
          ? null
          : CombineSplitLPNInfoMessageResponse.fromJson(
              json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CombineSplitLPNInfoResponseToJson(
        CombineSplitLPNInfoResponse instance) =>
    <String, dynamic>{
      'message': instance.messageResponse,
    };

CombineSplitLPNInfoMessageResponse _$CombineSplitLPNInfoMessageResponseFromJson(
        Map<String, dynamic> json) =>
    CombineSplitLPNInfoMessageResponse(
      output: json['output'] as String?,
      success: json['success'] as bool?,
      response: json['response'],
      recordResponse: (json['record'] as List<dynamic>?)
          ?.map((e) => CombineSplitLPNInfoRecordResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CombineSplitLPNInfoMessageResponseToJson(
        CombineSplitLPNInfoMessageResponse instance) =>
    <String, dynamic>{
      'output': instance.output,
      'success': instance.success,
      'response': instance.response,
      'record': instance.recordResponse,
    };

CombineSplitLPNInfoRecordResponse _$CombineSplitLPNInfoRecordResponseFromJson(
        Map<String, dynamic> json) =>
    CombineSplitLPNInfoRecordResponse(
      productFrom: json['productFrom'] as String?,
      productSizeFrom: json['productSizeFrom'] as String?,
      productPackFrom: json['productPackFrom'] as String?,
      lotNumberFrom: json['lotNumberFrom'] as String?,
      locationFrom: json['locationFrom'] as String?,
      originalQuantityFrom: json['originalQuantityFrom'] as int?,
    );

Map<String, dynamic> _$CombineSplitLPNInfoRecordResponseToJson(
        CombineSplitLPNInfoRecordResponse instance) =>
    <String, dynamic>{
      'productFrom': instance.productFrom,
      'productSizeFrom': instance.productSizeFrom,
      'productPackFrom': instance.productPackFrom,
      'lotNumberFrom': instance.lotNumberFrom,
      'locationFrom': instance.locationFrom,
      'originalQuantityFrom': instance.originalQuantityFrom,
    };

CombineSplitNewLPNResponse _$CombineSplitNewLPNResponseFromJson(
        Map<String, dynamic> json) =>
    CombineSplitNewLPNResponse(
      messageResponse: json['message'] == null
          ? null
          : CombineSplitNewLPNMessageResponse.fromJson(
              json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CombineSplitNewLPNResponseToJson(
        CombineSplitNewLPNResponse instance) =>
    <String, dynamic>{
      'message': instance.messageResponse,
    };

CombineSplitNewLPNMessageResponse _$CombineSplitNewLPNMessageResponseFromJson(
        Map<String, dynamic> json) =>
    CombineSplitNewLPNMessageResponse(
      output: json['output'] as String?,
      success: json['success'] as bool?,
      response: json['response'],
      recordResponse: (json['record'] as List<dynamic>?)
          ?.map((e) => CombineSplitNewLPNRecordResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CombineSplitNewLPNMessageResponseToJson(
        CombineSplitNewLPNMessageResponse instance) =>
    <String, dynamic>{
      'output': instance.output,
      'success': instance.success,
      'response': instance.response,
      'record': instance.recordResponse,
    };

CombineSplitNewLPNRecordResponse _$CombineSplitNewLPNRecordResponseFromJson(
        Map<String, dynamic> json) =>
    CombineSplitNewLPNRecordResponse(
      errorCode: json['errorCode'] as String?,
      errorMessageID: json['errorMessageID'] as String?,
      licensePlateNumber: json['licensePlateNumber'] as String?,
    );

Map<String, dynamic> _$CombineSplitNewLPNRecordResponseToJson(
        CombineSplitNewLPNRecordResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessageID': instance.errorMessageID,
      'licensePlateNumber': instance.licensePlateNumber,
    };

CombineSplitProcessLPNResponse _$CombineSplitProcessLPNResponseFromJson(
        Map<String, dynamic> json) =>
    CombineSplitProcessLPNResponse(
      messageResponse: json['message'] == null
          ? null
          : CombineSplitProcessLPNMessageResponse.fromJson(
              json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CombineSplitProcessLPNResponseToJson(
        CombineSplitProcessLPNResponse instance) =>
    <String, dynamic>{
      'message': instance.messageResponse,
    };

CombineSplitProcessLPNMessageResponse
    _$CombineSplitProcessLPNMessageResponseFromJson(
            Map<String, dynamic> json) =>
        CombineSplitProcessLPNMessageResponse(
          output: json['output'] as String?,
          success: json['success'] as bool?,
          response: json['response'],
        );

Map<String, dynamic> _$CombineSplitProcessLPNMessageResponseToJson(
        CombineSplitProcessLPNMessageResponse instance) =>
    <String, dynamic>{
      'output': instance.output,
      'success': instance.success,
      'response': instance.response,
    };
