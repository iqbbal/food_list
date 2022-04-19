import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:food_list/data/data_source/food_local_data_source.dart';
import 'package:food_list/data/data_source/food_remote_data_source.dart';
import 'package:food_list/domain/entities/food_entity.dart';
import 'package:food_list/domain/repositories/food_repository.dart';

import '../../domain/entities/app_error.dart';
import '../models/movie_model.dart';

class FoodRepositoryImpl extends FoodRepository {
  final FoodRemoteDataSource remoteDataSource;
  final FoodLocalDataSource localDataSource;

  FoodRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<FoodEntity>>> getFoods() async {
    try {
      final foods = await remoteDataSource.getFoods();
      print(foods);
      return Right(foods);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  // @override
  // Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId) async {
  //   try {
  //     final response = await localDataSource.checkIfMovieFavorite(movieId);
  //     return Right(response);
  //   } on Exception {
  //     return Left(AppError(AppErrorType.database));
  //   }
  // }

  // @override
  // Future<Either<AppError, void>> deleteFavoriteMovie(int movieId) async {
  //   try {
  //     final response = await localDataSource.deleteMovie(movieId);
  //     return Right(response);
  //   } on Exception {
  //     return Left(AppError(AppErrorType.database));
  //   }
  // }
}
