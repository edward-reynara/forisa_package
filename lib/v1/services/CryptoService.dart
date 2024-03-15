import 'dart:convert';

import 'dart:math';

import 'package:crypto/crypto.dart';

class CryptoService {
  static const Base64Codec base64 = Base64Codec();

  static String maskInput(String? input) {
    if (input == null || input.isEmpty) {
      return '';
    }
    var bytes = utf8.encode(input); // data being hashed
    var base64encoded = base64.encode(bytes);

    String inputmask =
        base64.encode(utf8.encode(getRandString(30))).substring(0, 30) +
            base64encoded +
            base64.encode(utf8.encode(getRandString(10))).substring(0, 10);

    return base64.encode(utf8.encode(inputmask));
  }

  static demaskInput(String maskedInput){
    if (maskedInput.isEmpty) {
      return '';
    }

    var base64decoded = base64.decode(maskedInput);
    var demask = utf8.decode(base64decoded);

    return utf8.decode(base64.decode(demask.substring(30, 30+demask.length - 40)));
  }

  static String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  static String genAuthCodeHeader(String clientId, String appCode, String menuId, String reqTime){
    String rawAuthCode = (clientId + appCode + menuId + reqTime).toUpperCase();
    String hashAuthCode = sha256.convert(utf8.encode(rawAuthCode)).toString().toUpperCase();

    return base64.encode(utf8.encode(hashAuthCode));
  }
}
