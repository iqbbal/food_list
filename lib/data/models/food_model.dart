import 'package:food_list/domain/entities/food_entity.dart';

class FoodModel extends FoodEntity {
  final String name;
  final String image;
  final String desc;

  FoodModel({
    required this.name,
    required this.image,
    required this.desc,
  }) : super(name: name, image: image, desc: desc);

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['desc'] = this.desc;
    return data;
  }
}
