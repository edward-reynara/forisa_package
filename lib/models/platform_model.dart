class PlatformModel {
  String appName;
  String packageName;
  String version;
  String buildNumber;

  PlatformModel({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['packageName'] = this.packageName;
    data['version'] = this.version;
    data['buildNumber'] = this.buildNumber;
    return data;
  }
}
