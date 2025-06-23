import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

import 'package:weather_app3/bloc/weather_bloc_bloc.dart';
import 'package:weather_app3/data/weather_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarBrightness: Brightness.dark,
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 45, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccessState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.weather.areaName?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Good Morning',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}\u00B0C',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherDescription!.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          Center(
                            child: Text(
                              DateFormat(
                                'EEE dd ,',
                              ).add_jm().format(state.weather.date!),

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/11.png', scale: 10.0),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(
                                        'Sunrise',
                                        style: TextStyle(
                                          color: Colors.white,

                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),

                                      Text(
                                        DateFormat().add_jm().format(
                                          state.weather.sunrise!,
                                        ),
                                        style: TextStyle(
                                          color: Colors.white,

                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/12.png', scale: 10.0),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(
                                        'Sunset',
                                        style: TextStyle(
                                          color: Colors.white,

                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),

                                      Text(
                                        DateFormat().add_jm().format(
                                          state.weather.sunset!,
                                        ),
                                        style: TextStyle(
                                          color: Colors.white,

                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(color: Colors.grey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/13.png', scale: 10.0),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(
                                        'Temp. Max',
                                        style: TextStyle(
                                          color: Colors.white,

                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),

                                      Text(
                                        '${state.weather.tempMax!.celsius!.round()}\u00B0C',
                                        style: TextStyle(
                                          color: Colors.white,

                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/14.png', scale: 10.0),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(
                                        'Temp. Min',
                                        style: TextStyle(
                                          color: Colors.white,

                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),

                                      Text(
                                        '${state.weather.tempMin!.celsius!.round()}\u00B0C',
                                        style: TextStyle(
                                          color: Colors.white,

                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
