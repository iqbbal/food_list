import 'package:flutter/material.dart';
import 'package:food_list/presentation/ui/home/home_screen.dart';
import '../common/constants/route_constants.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => HomeScreen(),
        RouteList.home: (context) => HomeScreen(),
      };
}
