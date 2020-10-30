import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:yogatimer/widgets/progress.dart';

part 'timer_state.dart';
part 'timer_cubit.freezed.dart';

class TimerCubit extends Cubit<TimerState> {
  static AudioCache cachePlayer = AudioCache(prefix: "music/");
  static const String timerMusicPath = "countdown_timer.mp3";
  StreamSubscription<int> _timer;
  StreamSubscription<int> _spentTimer;
  AudioPlayer _player;
  TimerCubit() : super(TimerState.initial()) {
    cachePlayer.load(timerMusicPath);
  }

  @override
  void onChange(Change<TimerState> change) {
    if (!state.isPaused && change.currentState.currentTime.inSeconds == 4) {
      _playTimerMusic();
    }
    super.onChange(change);
  }

  void _startSpentTimer() {
    _spentTimer =
        Stream.periodic(Duration(seconds: 1), (i) => i).listen((value) {
      emit(state.copyWith(
          totalSpentTime:
              Duration(seconds: state.totalSpentTime.inSeconds + 1)));
    });
  }

  void _cancelSpentTimer() {
    _spentTimer?.cancel();
  }

  void _startTimer(
      {@required int maxCount,
      @required void Function(int) onTick,
      @required void Function() onTimerEnd}) {
    _cancelTimer();
    _timer = Stream.periodic(Duration(seconds: 1), (i) => i)
        .take(maxCount)
        .listen((value) {
      onTick(value);
    }, onDone: () {
      onTimerEnd();
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  void _startYogaTimer(int maxCount) {
    if (maxCount <= 0) {
      _startRestTimer(state.totalRestTime.inSeconds);
    }
    _startTimer(
        maxCount: maxCount + 1,
        onTick: (tick) {
          emit(state.copyWith(
              isResting: false,
              currentTime: Duration(seconds: maxCount - tick)));
        },
        onTimerEnd: () {
          _startRestTimer(state.totalRestTime.inSeconds);
        });
  }

  void _startRestTimer(int maxCount) {
    if (maxCount <= 0) {
      _startYogaTimer(state.totalYogaTime.inSeconds);
    }
    _startTimer(
        maxCount: maxCount + 1,
        onTick: (tick) {
          emit(state.copyWith(
              isResting: true,
              currentTime: Duration(seconds: maxCount - tick)));
        },
        onTimerEnd: () {
          _startYogaTimer(state.totalYogaTime.inSeconds);
        });
  }

  //events
  void play() {
    if (!state.isPaused) {
      return;
    }
    _startSpentTimer();
    emit(state.copyWith(isPaused: false));
    if (state.isResting) {
      _startRestTimer(state.currentTime.inSeconds);
    } else {
      _startYogaTimer(state.currentTime.inSeconds);
    }
  }

  void pause() {
    _stopTimerMusic();
    _cancelTimer();
    _cancelSpentTimer();
    emit(state.copyWith(isPaused: true));
  }

  void stop() {
    _stopTimerMusic();
    _cancelTimer();
    _cancelSpentTimer();
    emit(TimerState.initial().copyWith(
        totalYogaTime: state.totalYogaTime,
        totalRestTime: state.totalRestTime,
        currentTime: state.totalYogaTime));
  }

  void changedYogaTime(Duration duration) {
    stop();
    emit(state.copyWith(totalYogaTime: duration, currentTime: duration));
  }

  void changeRestTime(Duration duration) {
    stop();
    emit(state.copyWith(totalRestTime: duration));
  }

  void _playTimerMusic() async {
    if (_player == null || _player.state != AudioPlayerState.PLAYING) {
      _player = await cachePlayer.play(timerMusicPath);
    }
  }

  void _stopTimerMusic() {
    if (_player == null) {
      return;
    }
    if (_player.state == AudioPlayerState.PLAYING) {
      _player.stop();
    }
  }

  @override
  Future<void> close() {
    _cancelTimer();
    _cancelSpentTimer();
    _player.dispose();
    cachePlayer.clearCache();
    return super.close();
  }
}
