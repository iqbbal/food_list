import 'package:equatable/equatable.dart';

import 'food_detail_entity.dart';
import 'movie_detail_entity.dart';

class FoodEntity extends Equatable {
  final String name;
  final String image;
  final String desc;

  const FoodEntity({
    required this.name,
    required this.image,
    required this.desc,
  });

  @override
  List<Object> get props => [name, desc, image];

  @override
  bool get stringify => true;

  factory FoodEntity.fromMovieDetailEntity(FoodDetailEntity foodDetailEntity) {
    return FoodEntity(
        name: foodDetailEntity.name,
        image: foodDetailEntity.image,
        desc: foodDetailEntity.desc);
  }
}
