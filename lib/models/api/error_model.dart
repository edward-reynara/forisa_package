// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
    ErrorModel({
        this.responseCode,
        this.responseMsg,
        this.error,
    });

    String? responseCode;
    String? responseMsg;
    Error? error;

    factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        responseCode: json["response_code"] == null ? null : json["response_code"],
        responseMsg: json["response_msg"] == null ? null : json["response_msg"],
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "response_code": responseCode == null ? null : responseCode,
        "response_msg": responseMsg == null ? null : responseMsg,
        "error": error == null ? null : error!.toJson(),
    };
}

class Error {
    Error({
        this.status,
        this.isWarning,
        this.message,
        this.arrMessage,
    });

    bool? status;
    bool? isWarning;
    String? message;
    List<String>? arrMessage;

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        status: json["Status"] == null ? null : json["Status"],
        isWarning: json["IsWarning"] == null ? null : json["IsWarning"],
        message: json["Message"] == null ? null : json["Message"],
        arrMessage: json["ArrMessage"] == null ? null : List<String>.from(json["ArrMessage"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Status": status == null ? null : status,
        "IsWarning": isWarning == null ? null : isWarning,
        "Message": message == null ? null : message,
        "ArrMessage": arrMessage == null ? null : List<dynamic>.from(arrMessage!.map((x) => x)),
    };
}
