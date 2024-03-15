class APIResponsePlain {
  String? code;
  String? title;
  String? msg;
  String? payload;
  dynamic stackTraces;

  APIResponsePlain({
    this.code,
    this.title,
    this.msg,
    this.payload,
    this.stackTraces,
  });

  @override
  String toString() {
    return '($code) $msg';
  }
}
