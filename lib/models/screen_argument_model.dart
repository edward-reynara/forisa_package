// To parse this JSON data, do
//
//     final screenArgument = screenArgumentFromJson(jsonString);

import 'dart:convert';

ScreenArgument screenArgumentFromJson(String str) => ScreenArgument.fromJson(json.decode(str));

String screenArgumentToJson(ScreenArgument data) => json.encode(data.toJson());

class ScreenArgument {
    ScreenArgument({
        this.id,
        this.stringPayload,
        this.pageTitle,
        this.link,
        this.objectPayload,
        this.listPayload,
    });

    String? id;
    String? stringPayload;
    String? pageTitle;
    String? link;
    dynamic objectPayload;
    List<dynamic>? listPayload;

    factory ScreenArgument.fromJson(Map<String, dynamic> json) => ScreenArgument(
        id: json["id"] == null ? null : json["id"] is int ? json["id"].toString():json["id"],
        stringPayload: json["stringPayload"] == null ? null : json["stringPayload"],
        pageTitle: json["pageTitle"] == null ? null : json["pageTitle"],
        link: json["link"] == null ? null : json["link"],
        objectPayload: json["objectPayload"],
        listPayload: json["listPayload"] == null ? null : List<dynamic>.from(json["listPayload"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "stringPayload": stringPayload == null ? null : stringPayload,
        "pageTitle": pageTitle == null ? null : pageTitle,
        "link": link == null ? null : link,
        "objectPayload": objectPayload,
        "listPayload": listPayload == null ? null : List<dynamic>.from(listPayload!.map((x) => x)),
    };
}
