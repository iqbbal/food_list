import 'package:food_list/data/data_source/language_local_data_source.dart';
import 'package:food_list/data/data_source/movie_local_data_source.dart';
import 'package:food_list/data/data_source/movie_remote_data_source.dart';
import 'package:food_list/presentation/blocs/movie_caraousel/movie_carousel_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import '../domain/usecases/get_preferred_theme.dart';
import '../domain/usecases/update_theme.dart';
import '../presentation/blocs/movie_caraousel/movie_carousel_cubit.dart';
import '../presentation/blocs/theme/theme_cubit.dart';

import '../data/core/api_client.dart';
import '../data/repositories/app_repository_impl.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/app_repository.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_preferred_language.dart';
import '../domain/usecases/get_trending.dart';
import '../domain/usecases/update_language.dart';
import '../presentation/blocs/language/language_cubit.dart';
import '../presentation/blocs/loading/loading_cubit.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());

  // getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
  //     () => AuthenticationRemoteDataSourceImpl(getItInstance()));

  // getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
  //     () => AuthenticationLocalDataSourceImpl());

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  // getItInstance
  //     .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  // getItInstance.registerLazySingleton<GetPlayingNow>(
  //     () => GetPlayingNow(getItInstance()));
  // getItInstance.registerLazySingleton<GetComingSoon>(
  //     () => GetComingSoon(getItInstance()));

  // getItInstance.registerLazySingleton<GetMovieDetail>(
  //     () => GetMovieDetail(getItInstance()));

  // getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  // getItInstance
  //     .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  // getItInstance
  //     .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));

  // getItInstance
  //     .registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));

  // getItInstance.registerLazySingleton<GetFavoriteMovies>(
  //     () => GetFavoriteMovies(getItInstance()));

  // getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
  //     () => DeleteFavoriteMovie(getItInstance()));

  // getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
  //     () => CheckIfFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  getItInstance
      .registerLazySingleton<UpdateTheme>(() => UpdateTheme(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredTheme>(
      () => GetPreferredTheme(getItInstance()));

  // getItInstance
  //     .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));

  // getItInstance
  //     .registerLazySingleton<LogoutUser>(() => LogoutUser(getItInstance()));

  getItInstance
      .registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
            getItInstance(),
            getItInstance(),
          ));

  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        getItInstance(),
      ));

  // getItInstance.registerLazySingleton<AuthenticationRepository>(
  //     () => AuthenticationRepositoryImpl(getItInstance(), getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropCubit());

  getItInstance.registerFactory(
    () => MovieCarouselCubit(
      loadingCubit: getItInstance(),
      getTrending: getItInstance(),
      movieBackdropCubit: getItInstance(),
    ),
  );

  // getItInstance.registerFactory(
  //   () => MovieTabbedCubit(
  //     getPopular: getItInstance(),
  //     getComingSoon: getItInstance(),
  //     getPlayingNow: getItInstance(),
  //   ),
  // );

  // getItInstance.registerFactory(
  //   () => MovieDetailCubit(
  //     loadingCubit: getItInstance(),
  //     getMovieDetail: getItInstance(),
  //     castBloc: getItInstance(),
  //     videosCubit: getItInstance(),
  //     favoriteCubit: getItInstance(),
  //   ),
  // );

  // getItInstance.registerFactory(
  //   () => CastCubit(
  //     getCast: getItInstance(),
  //   ),
  // );

  // getItInstance.registerFactory(
  //   () => VideosCubit(
  //     getVideos: getItInstance(),
  //   ),
  // );

  // getItInstance.registerFactory(
  //   () => SearchMovieCubit(
  //     loadingCubit: getItInstance(),
  //     searchMovies: getItInstance(),
  //   ),
  // );

  getItInstance.registerSingleton<LanguageCubit>(LanguageCubit(
    updateLanguage: getItInstance(),
    getPreferredLanguage: getItInstance(),
  ));

  // getItInstance.registerFactory(() => FavoriteCubit(
  //       saveMovie: getItInstance(),
  //       checkIfFavoriteMovie: getItInstance(),
  //       deleteFavoriteMovie: getItInstance(),
  //       getFavoriteMovies: getItInstance(),
  //     ));

  // getItInstance.registerFactory(() => LoginCubit(
  //       loginUser: getItInstance(),
  //       logoutUser: getItInstance(),
  //       loadingCubit: getItInstance(),
  //     ));

  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
    getPreferredTheme: getItInstance(),
    updateTheme: getItInstance(),
  ));
}
