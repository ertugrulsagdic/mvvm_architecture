import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'burger_model.g.dart';

@JsonSerializable()
class BurgerModel extends INetworkModel<BurgerModel> {
  @JsonKey(name: '_id')
  String? sId;
  String? image;
  String? name;
  int? price;
  int? rates;
  bool? isFavorite;
  String? updated;

  BurgerModel({
    this.sId,
    this.image,
    this.name,
    this.price,
    this.rates,
    this.isFavorite,
    this.updated,
  });

  @override
  BurgerModel fromJson(Map<String, dynamic> json) {
    return _$BurgerModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BurgerModelToJson(this);
  }
}
