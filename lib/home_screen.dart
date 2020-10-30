import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';
import 'package:yogatimer/widgets/circle.dart';
import 'package:yogatimer/widgets/progress.dart';
import 'package:yogatimer/widgets/time_set.dart';

import 'application/time_cubit/timer_cubit.dart';
import 'helpers/format_time.dart';

class HomeScreen extends StatefulWidget {
  static double radius = 100;
  static double size = radius * sqrt(2);
  static double strokeWidth = 10;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Progress> _progressAnimation;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(listener: (_, state) {
      _progressAnimation =
          ProgressTween(_progressAnimation.value, state.progress)
              .animate(_controller);
      _controller.forward(from: 0.0);
    }, builder: (_, state) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            brightness: Brightness.light,
            title: Text(
                "Total Spent Time: ${formatTimeInWords(state.totalSpentTime)}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            backgroundColor: Colors.white,
            elevation: 0,
            textTheme: Theme.of(context).textTheme),
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Circle(
                    progress: Progress(1),
                    colors: [Colors.grey[200], Colors.grey[200]],
                    radius: HomeScreen.radius,
                    strokeWidth: HomeScreen.strokeWidth,
                  ),
                  AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (_, __) {
                        return Circle(
                          progress: _progressAnimation.value,
                          radius: HomeScreen.radius,
                          strokeWidth: HomeScreen.strokeWidth,
                        );
                      }),
                  buildTimer(state.currentTime),
                  AnimatedOpacity(
                      opacity: state.isPaused ? 1 : 0,
                      duration: Duration(milliseconds: 300),
                      child: buildPlayButton(context)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TimeSet(
                title: "Session",
                time: state.totalYogaTime,
                onTimeChanged: (time) => _onMainTimeChanged(context, time),
              ),
              SizedBox(
                height: 20,
              ),
              TimeSet(
                title: "Break",
                time: state.totalRestTime,
                onTimeChanged: (time) => _onBreakTimeChanged(context, time),
              ),
              buildTimerController(context, state),
            ],
          ),
        ),
      );
    });
  }

  Widget buildTimerController(BuildContext context, TimerState state) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: state.isPaused ? 0 : 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.pause, color: Colors.green),
            onPressed: () => _onPauseButtonPressed(context),
          ),
          IconButton(
            icon: Icon(Icons.stop, color: Colors.red),
            onPressed: () => _onStopButtonPressed(context),
          ),
        ],
      ),
    );
  }

  Widget buildTimer(Duration time) {
    return Container(
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            formatTime(time),
            style: TextStyle(fontSize: 56),
          ),
        ),
        width: HomeScreen.size,
        height: HomeScreen.size);
  }

  Widget buildPlayButton(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.8),
        child: IconButton(
          icon: Icon(
            Icons.play_arrow,
            color: Colors.deepOrange,
          ),
          iconSize: 60,
          onPressed: () => _onPlayButtonPressed(context),
        ),
        radius: HomeScreen.radius - HomeScreen.strokeWidth);
  }

  void _onPlayButtonPressed(BuildContext context) {
    BlocProvider.of<TimerCubit>(context).play();
  }

  void _onPauseButtonPressed(BuildContext context) {
    BlocProvider.of<TimerCubit>(context).pause();
  }

  void _onStopButtonPressed(BuildContext context) {
    BlocProvider.of<TimerCubit>(context).stop();
  }

  void _onMainTimeChanged(BuildContext context, Duration duration) {
    BlocProvider.of<TimerCubit>(context).changedYogaTime(duration);
  }

  void _onBreakTimeChanged(BuildContext context, Duration duration) {
    BlocProvider.of<TimerCubit>(context).changeRestTime(duration);
  }

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _progressAnimation =
        ProgressTween(Progress(0), Progress(1)).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    Wakelock.disable();
    super.dispose();
  }
}
