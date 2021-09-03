import '../../../../core/base/model/base_response_model.dart';
import '../../../_product/enum/network_route.enum.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import 'ILoginService.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';
import '../../../../core/extension/string_extension.dart';

class LoginService extends ILoginService {
  LoginService(INetworkManager manager) : super(manager);

  @override
  Future<BaseResponseModel?> fetchUserControl(LoginModel model) async {
    var response = await manager.send<BaseResponseModel, BaseResponseModel>(
      NetworkRoutes.LOGIN.rawValue,
      parseModel: BaseResponseModel(),
      method: RequestType.POST,
      data: model,
    );

    if (response.data is BaseResponseModel) {
      response.data!.data =
          _responseParser<LoginResponseModel, LoginResponseModel>(
              LoginResponseModel(), response.data!.data);
      print(response.data!.toJson());
      print(response.data!.data.toJson());
      return response.data;
    } else {
      final errorModel = _errorParser<BaseResponseModel, BaseResponseModel>(
          BaseResponseModel(), response.error!.description);

      return errorModel;
    }
  }
}

extension _ParseOperations on LoginService {
  R? _responseParser<R, T>(LoginResponseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      print('#########data######');
      print(data);
      return model.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R?;
  }

  R? _errorParser<R, T>(BaseResponseModel model, dynamic data) {
    var dataSp = data.replaceAll('{', '').replaceAll('}', '').split(',');

    var mapData = <String, dynamic>{};
    dataSp.forEach((element) {
      mapData[element.split(':')[0].replaceAll(' ', '')] =
          element.split(':')[0].replaceAll(' ', '') == 'status'
              ? element.split(':')[1].replaceAll(' ', '').toString().parseBool
              : element.split(':')[1];
    });

    return model.fromJson(mapData) as R;
  }
}
