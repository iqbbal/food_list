import 'package:dartz/dartz.dart';
import 'package:food_list/domain/entities/food_entity.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../entities/no_params.dart';
import '../repositories/food_repository.dart';
import 'usecase.dart';

class GetTrending extends UseCase<List<FoodEntity>, NoParams> {
  final FoodRepository repository;

  GetTrending(this.repository);

  @override
  Future<Either<AppError, List<FoodEntity>>> call(NoParams params) async {
    return await repository.getFoods();
  }

  // @override
  // Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
  //   return await repository.getTrending();
  // }
}
