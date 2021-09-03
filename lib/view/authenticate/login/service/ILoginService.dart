import '../../../../core/base/model/base_response_model.dart';
import '../model/login_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager manager;

  ILoginService(this.manager);

  Future<BaseResponseModel?> fetchUserControl(LoginModel model);
}
