import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_list/domain/entities/food_entity.dart';
import 'package:food_list/presentation/blocs/food_backdrop/food_backdrop_cubit.dart';

import '../../../../domain/entities/movie_entity.dart';

class FoodDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBackdropCubit, FoodEntity?>(
      builder: (context, movie) {
        return Text(
          movie?.name ?? '',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.headline6,
        );
      },
    );
  }
}
