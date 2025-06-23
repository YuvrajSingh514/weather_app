part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoadingState extends WeatherBlocState {}

final class WeatherBlocSuccessState extends WeatherBlocState {
  final Weather weather;

  const WeatherBlocSuccessState(this.weather);

  @override
  List<Object> get props => [weather];
}

final class WeatherBlocFailureState extends WeatherBlocState {}
