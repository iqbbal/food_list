import 'package:flutter/material.dart';
import 'package:food_list/presentation/ui/home/home_screen.dart';
// import 'package:movieapp/presentation/journeys/movie_detail/movie_detail_arguments.dart';
// import 'package:movieapp/presentation/journeys/watch_video/watch_video_arguments.dart';

import '../common/constants/route_constants.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => HomeScreen(),
        RouteList.home: (context) => HomeScreen(),
        // RouteList.movieDetail: (context) => MovieDetailScreen(
        //       movieDetailArguments: setting.arguments as MovieDetailArguments,
        //     ),
        // RouteList.watchTrailer: (context) => WatchVideoScreen(
        //       watchVideoArguments: setting.arguments as WatchVideoArguments,
        //     ),
        // RouteList.favorite: (context) => FavoriteScreen(),
      };
}
