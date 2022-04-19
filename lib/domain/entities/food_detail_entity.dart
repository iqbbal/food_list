import 'package:equatable/equatable.dart';

class FoodDetailEntity extends Equatable {
  final String name;
  final String image;
  final String desc;

  const FoodDetailEntity({
    required this.name,
    required this.image,
    required this.desc,
  });

  @override
  List<Object> get props => [name, desc, image];
}
