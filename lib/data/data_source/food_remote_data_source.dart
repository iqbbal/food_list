import 'dart:convert';

import 'package:food_list/data/models/food_model.dart';
import 'package:food_list/data/models/foods_result_model.dart';
import 'package:food_list/data/models/movie_model.dart';
import 'package:food_list/data/models/movies_result_model.dart';

import '../core/api_client.dart';

abstract class FoodRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<FoodModel>> getFoods();
}

class FoodRemoteDataSourceImpl extends FoodRemoteDataSource {
  final ApiClient _client;

  FoodRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('foods');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<FoodModel>> getFoods() async {
    var movies = List<MovieModel>.empty(growable: true);
    final response = await _client.get('foods');
    // movies = (jsonDecode(response.body) as List)
    //     .map((i) => FoodModel.fromJson(i))
    //     .toList();

    //print(myModels);
    return List<FoodModel>.from(response.map((x) => FoodModel.fromJson(x)));
    //return response.map((m) => new FoodModel.fromJson(m)).toList();
  }
}
