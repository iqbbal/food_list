import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_list/domain/entities/food_entity.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/screenutil/screenutil.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<FoodEntity> foods;
  final int initialPage;

  const MoviePageView({
    Key? key,
    required this.foods,
    this.initialPage = 0,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
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
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController!,
            //movieId: movie.id,
            posterPath: movie.image,
          );
        },
        pageSnapping: true,
        itemCount: widget.foods.length,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropCubit>(context)
              .backdropChanged(widget.foods[index]);
        },
      ),
    );
  }
}
