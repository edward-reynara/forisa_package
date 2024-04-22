// To parse this JSON data, do
//
//     final defaultList = defaultListFromJson(jsonString);

import 'dart:convert';

DefaultList defaultListFromJson(String str) =>
    DefaultList.fromJson(json.decode(str));

String defaultListToJson(DefaultList data) => json.encode(data.toJson());

class DefaultList {
  int status;
  String msg;
  List<ArrData> arrData;

  DefaultList({
    required this.status,
    required this.msg,
    required this.arrData,
  });

  factory DefaultList.fromJson(Map<String, dynamic> json) => DefaultList(
        status: json["status"],
        msg: json["msg"],
        arrData: List<ArrData>.from(
            json["arr_data"].map((x) => ArrData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "arr_data": List<dynamic>.from(arrData.map((x) => x.toJson())),
      };
}

class ArrData {
  DateTime trxDate;
  String trxStatus;
  String inTime;
  String inPhoto;
  String outTime;
  String outPhoto;
  String statusCode;
  String statusType;
  String statusName;
  DateTime startDate;
  DateTime endDate;
  String workingHour;

  ArrData({
    required this.trxDate,
    required this.trxStatus,
    required this.inTime,
    required this.inPhoto,
    required this.outTime,
    required this.outPhoto,
    required this.statusCode,
    required this.statusType,
    required this.statusName,
    required this.startDate,
    required this.endDate,
    required this.workingHour,
  });

  factory ArrData.fromJson(Map<String, dynamic> json) => ArrData(
        trxDate: DateTime.parse(json["TrxDate"]),
        trxStatus: json["TrxStatus"],
        inTime: json["InTime"],
        inPhoto: json["InPhoto"],
        outTime: json["OutTime"],
        outPhoto: json["OutPhoto"],
        statusCode: json["StatusCode"],
        statusType: json["StatusType"],
        statusName: json["StatusName"],
        startDate: DateTime.parse(json["StartDate"]),
        endDate: DateTime.parse(json["EndDate"]),
        workingHour: json["WorkingHour"],
      );

  Map<String, dynamic> toJson() => {
        "TrxDate":
            "${trxDate.year.toString().padLeft(4, '0')}-${trxDate.month.toString().padLeft(2, '0')}-${trxDate.day.toString().padLeft(2, '0')}",
        "TrxStatus": trxStatus,
        "InTime": inTime,
        "InPhoto": inPhoto,
        "OutTime": outTime,
        "OutPhoto": outPhoto,
        "StatusCode": statusCode,
        "StatusType": statusType,
        "StatusName": statusName,
        "StartDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "EndDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "WorkingHour": workingHour,
      };
}
