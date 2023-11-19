import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/enums.dart';


OperationResult operationResultFromJson(String str) =>
    OperationResult.fromJson(json.decode(str));

String operationResultToJson(OperationResult data) =>
    json.encode(data.toJson());

@JsonSerializable(
  explicitToJson: true,
)
class OperationResult {
  ApiStatus? apiStatus;
  String? message;
  String? errorCode;

  OperationResult();
  factory OperationResult.fromJson(Map<String, dynamic> json) =>
      OperationResult()
        ..apiStatus = json['apiStatus'] as ApiStatus?
        ..message = json['message'] as String?
        ..errorCode = json['errorCode'] as String?;

  Map<String, dynamic> toJson() => {
    'apiStatus': apiStatus,
    'message': message,
    'errorCode': errorCode,
  };
}
