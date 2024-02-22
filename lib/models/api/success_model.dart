// To parse this JSON data, do
//
//     final successModel = successModelFromJson(jsonString);

import 'dart:convert';

SuccessModel successModelFromJson(String str) => SuccessModel.fromJson(json.decode(str));

String successModelToJson(SuccessModel data) => json.encode(data.toJson());

class SuccessModel {
    SuccessModel({
        this.responseCode,
        this.responseMsg,
    });

    String? responseCode;
    String? responseMsg;

    factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        responseCode: json["response_code"],
        responseMsg: json["response_msg"],
    );

    Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "response_msg": responseMsg,
    };
}
