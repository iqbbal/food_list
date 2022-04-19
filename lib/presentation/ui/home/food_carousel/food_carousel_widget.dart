import 'package:flutter/material.dart';
import 'package:food_list/domain/entities/food_entity.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../widgets/movie_app_bar.dart';
import '../../../widgets/separator.dart';
import 'food_backdrop_widget.dart';
import 'food_data_widget.dart';
import 'food_page_view.dart';

class FoodCarouselWidget extends StatelessWidget {
  final List<FoodEntity> movies;
  final int defaultIndex;

  const FoodCarouselWidget({
    Key? key,
    required this.movies,
    this.defaultIndex = 0,
  })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FoodBackdropWidget(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MovieAppBar(),
            Expanded(
              flex: 3,
              child: FoodPageView(
                foods: movies,
                initialPage: defaultIndex,
              ),
            ),
            Expanded(
              flex: 1,
              child: FoodDataWidget(),
            ),
          ],
        ),
      ],
    );
  }
}
