import 'base_model.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel extends INetworkModel<BaseResponseModel>
    implements BaseModel {
  final bool? status;
  final String? message;
  var data;

  BaseResponseModel({this.status, this.message, this.data});

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BaseResponseModelToJson(this);
  }
}
