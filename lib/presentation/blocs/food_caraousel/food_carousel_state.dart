part of 'food_carousel_cubit.dart';

abstract class FoodCarouselState extends Equatable {
  const FoodCarouselState();

  @override
  List<Object> get props => [];
}

class FoodCarouselInitial extends FoodCarouselState {}

class FoodCarouselError extends FoodCarouselState {
  final AppErrorType errorType;

  const FoodCarouselError(this.errorType);
}

class FoodCarouselLoaded extends FoodCarouselState {
  final List<FoodEntity> foods;
  final int defaultIndex;

  const FoodCarouselLoaded({
    required this.foods,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [foods, defaultIndex];
}
