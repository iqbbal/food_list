import 'package:food_list/data/models/food_model.dart';

import 'movie_model.dart';

class FoodsResultModel {
  late final List<FoodModel> foods;

  FoodsResultModel({required this.foods});

  factory FoodsResultModel.fromJson(Map<String, dynamic> json) {
    var mFoods = List<FoodModel>.empty(growable: true);
    if (json['results'] != null) {
      json['results'].forEach((v) {
        final movieModel = FoodModel.fromJson(v);
        if (_isValidMovie(movieModel)) {
          mFoods.add(movieModel);
        }
      });
    }
    return FoodsResultModel(foods: mFoods);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.foods.map((v) => v.toJson()).toList();
    return data;
  }
}

bool _isValidMovie(FoodModel foodModel) {
  return foodModel.name.isNotEmpty &&
      foodModel.image.isNotEmpty &&
      foodModel.desc.isNotEmpty;
}
