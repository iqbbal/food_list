import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_list/presentation/blocs/food_backdrop/food_backdrop_cubit.dart';
import 'package:food_list/presentation/blocs/food_caraousel/food_carousel_cubit.dart';

import '../../../di/get_it.dart';
import '../../widgets/app_error_widget.dart';
import 'food_carousel/food_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FoodCarouselCubit movieCarouselCubit;
  late FoodBackdropCubit movieBackdropCubit;
  //late MovieTabbedCubit movieTabbedCubit;
  //late SearchMovieCubit searchMovieCubit;

  @override
  void initState() {
    super.initState();
    movieCarouselCubit = getItInstance<FoodCarouselCubit>();
    movieBackdropCubit = movieCarouselCubit.movieBackdropCubit;
    //movieTabbedCubit = getItInstance<MovieTabbedCubit>();
    //searchMovieCubit = getItInstance<SearchMovieCubit>();
    movieCarouselCubit.loadCarousel();
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselCubit.close();
    movieBackdropCubit.close();
    //movieTabbedCubit.close();
    //searchMovieCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselCubit,
        ),
        BlocProvider(
          create: (context) => movieBackdropCubit,
        ),
        // BlocProvider(
        //   create: (context) => movieTabbedCubit,
        // ),
        // BlocProvider.value(
        //   value: searchMovieCubit,
        // ),
      ],
      child: Scaffold(
        //drawer: const NavigationDrawer(),
        body: BlocBuilder<FoodCarouselCubit, FoodCarouselState>(
          builder: (context, state) {
            if (state is FoodCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FoodCarouselWidget(
                    movies: state.foods,
                    defaultIndex: state.defaultIndex,
                  )
                ],
              );
            } else if (state is FoodCarouselError) {
              return AppErrorWidget(
                onPressed: () => movieCarouselCubit.loadCarousel(),
                errorType: state.errorType,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
