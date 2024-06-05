class ErrorListModel {
  final String status;
  final List<String> message;

  ErrorListModel({
    required this.status,
    required this.message,
  });

  factory ErrorListModel.fromJson(Map<String, dynamic> json) {
    return ErrorListModel(
        status: json['status'], message: List<String>.from(json['message']));
  }
}
