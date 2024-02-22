// To parse this JSON data, do
//
//     final appModel = appModelFromJson(jsonString);

import 'dart:convert';

AppModel appModelFromJson(String str) => AppModel.fromJson(json.decode(str));

String appModelToJson(AppModel data) => json.encode(data.toJson());

class AppModel {
    AppModel({
        this.responseCode,
        this.responseMsg,
        this.data,
    });

    String? responseCode;
    String? responseMsg;
    AppModelData? data;

    factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
        responseCode: json["response_code"],
        responseMsg: json["response_msg"],
        data: json["data"] == null ? null : AppModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "response_msg": responseMsg,
        "data": data?.toJson(),
    };
}

class AppModelData {
    AppModelData({
        this.appcode,
        this.minVersion,
        this.latestVersion,
        this.storeUrl,
    });

    String? appcode;
    String? minVersion;
    String? latestVersion;
    String? storeUrl;

    factory AppModelData.fromJson(Map<String, dynamic> json) => AppModelData(
        appcode: json["appcode"],
        minVersion: json["min_version"],
        latestVersion: json["latest_version"],
        storeUrl: json["store_url"],
    );

    Map<String, dynamic> toJson() => {
        "appcode": appcode,
        "min_version": minVersion,
        "latest_version": latestVersion,
        "store_url": storeUrl,
    };
}
