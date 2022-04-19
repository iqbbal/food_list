import 'package:dartz/dartz.dart';
import 'package:food_list/domain/entities/food_entity.dart';

import '../entities/app_error.dart';
import '../entities/movie_detail_entity.dart';
import '../entities/movie_entity.dart';

abstract class FoodRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<FoodEntity>>> getFoods();
}
