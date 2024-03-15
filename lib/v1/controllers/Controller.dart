import 'package:get/get.dart';

import '../models/api/api_response_plain.dart';

class Controller extends GetxController {
  RxBool isPageLoading = false.obs;
  Rx<APIResponsePlain> errorPageLoading = APIResponsePlain().obs;
  RxBool isSubmitting = false.obs;

  void startSubmit(){
    isSubmitting.value = true;
  }

  void stopSubmit(){
    isSubmitting.value = false;
  }

  void startLoader(){
    isPageLoading.value = true;
    errorPageLoading.value = APIResponsePlain();
  }

  void stopLoader(){
    isPageLoading.value = false;
  }
}