import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoadingState());
      try {
        WeatherFactory weatherFactory = WeatherFactory(
          '30e4f0252967875707b21431723c00c6',
          language: Language.ENGLISH,
        );

        Weather weather = await weatherFactory.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        print(weather);
        emit(WeatherBlocSuccessState(weather));
      } catch (e) {
        emit(WeatherBlocFailureState());
      }
    });
  }
}
