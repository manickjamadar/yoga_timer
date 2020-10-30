import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogatimer/application/time_cubit/timer_cubit.dart';
import 'package:yogatimer/home_screen.dart';

void main() {
  runApp(BlocProvider(create: (_) => TimerCubit(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
