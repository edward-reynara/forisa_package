import '../models/app_model.dart';

abstract class IAppService{
  Future<AppModel> getAppVersion();
}