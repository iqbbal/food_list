import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_list/domain/entities/food_entity.dart';
import 'package:food_list/presentation/blocs/food_backdrop/food_backdrop_cubit.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/screenutil/screenutil.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'animated_food_card_widget.dart';

class FoodPageView extends StatefulWidget {
  final List<FoodEntity> foods;
  final int initialPage;

  const FoodPageView({
    Key? key,
    required this.foods,
    this.initialPage = 0,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _FoodPageViewState createState() => _FoodPageViewState();
}

class _FoodPageViewState extends State<FoodPageView> {
  late PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.4,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final FoodEntity movie = widget.foods[index];
          return AnimatedFoodCardWidget(
            index: index,
            pageController: _pageController!,
            //movieId: movie.id,
            posterPath: movie.image,
          );
        },
        pageSnapping: true,
        itemCount: widget.foods.length,
        onPageChanged: (index) {
          BlocProvider.of<FoodBackdropCubit>(context)
              .backdropChanged(widget.foods[index]);
        },
      ),
    );
  }
}
