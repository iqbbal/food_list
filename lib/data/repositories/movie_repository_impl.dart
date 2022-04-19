import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:food_list/data/data_source/movie_local_data_source.dart';
import 'package:food_list/data/data_source/movie_remote_data_source.dart';
import 'package:food_list/domain/entities/food_entity.dart';
import 'package:food_list/domain/repositories/movie_repository.dart';

import '../../domain/entities/app_error.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);

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
