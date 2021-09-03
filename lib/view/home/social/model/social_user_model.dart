import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'social_user_model.g.dart';

@JsonSerializable()
class SocialUserModel extends INetworkModel<SocialUserModel> {
  @JsonKey(name: "_id")
  String? sId;
  String? name;
  String? company;
  String? image;
  int? iV;

  SocialUserModel({this.sId, this.name, this.company, this.image, this.iV});

  @override
  SocialUserModel fromJson(Map<String, dynamic> json) {
    return _$SocialUserModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SocialUserModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SocialUserModel &&
        other.sId == sId &&
        other.name == name &&
        other.company == company &&
        other.image == image &&
        other.iV == iV;
  }

  @override
  int get hashCode {
    return sId.hashCode ^
        name.hashCode ^
        company.hashCode ^
        image.hashCode ^
        iV.hashCode;
  }
}
