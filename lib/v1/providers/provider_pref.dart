import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PrefProvider {
  static const String IS_DONE_INTRO_KEY = 'isDoneOnboarding';
  static const String TOKEN_KEY = 'token';
  static const String USERNAME_KEY = 'username';
  static const String PRODUCT_SEARCHED_LIST = 'productSearchedList';
  static const String USER_DATA = 'userData';
  static const String ENABLE_NOTIFICATION = 'enableNotif';
  static const String ID_NOTIFICATION = 'idNotif';
  static const String REDIRECT_DATA = 'redirectData';

  static final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static resetAfterLogin(){
    List<String> willReset = [TOKEN_KEY, USERNAME_KEY, PRODUCT_SEARCHED_LIST, USER_DATA, ENABLE_NOTIFICATION, ID_NOTIFICATION];
    willReset.forEach((element) async {
      await secureStorage.delete(key: element);
    });
  }
}