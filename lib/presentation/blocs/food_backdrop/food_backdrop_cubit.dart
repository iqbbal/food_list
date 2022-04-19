import 'package:bloc/bloc.dart';
import 'package:food_list/domain/entities/food_entity.dart';

import '../../../domain/entities/movie_entity.dart';

class FoodBackdropCubit extends Cubit<FoodEntity?> {
  FoodBackdropCubit() : super(null);

  void backdropChanged(FoodEntity food) {
    emit(food);
  }
}
