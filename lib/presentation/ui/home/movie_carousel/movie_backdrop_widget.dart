import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_list/domain/entities/food_entity.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/screenutil/screenutil.dart';
import '../../../../data/core/api_constants.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../blocs/movie_backdrop/movie_backdrop_cubit.dart';

class MovieBackdropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: BlocBuilder<MovieBackdropCubit, FoodEntity?>(
            builder: (context, food) {
              //return fadeNetworkImage(url: '${ApiConstants.BASE_IMAGE_URL}${movie?.backdropPath}', height: height);
              return CachedNetworkImage(
                  imageUrl: '${food?.image}',
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error));
            },
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            width: ScreenUtil.screenWidth,
            height: height,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

Widget fadeNetworkImage({url: String, height: double}) {
  return FadeInImage.memoryNetwork(
    key: ValueKey(url),
    height: height,
    fit: BoxFit.cover,
    image: "https://image.tmdb.org/t/p/original$url",
    placeholder: kTransparentImage,
  );
}
