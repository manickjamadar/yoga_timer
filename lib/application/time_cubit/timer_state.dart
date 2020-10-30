part of 'timer_cubit.dart';

@freezed
abstract class TimerState implements _$TimerState {
  const TimerState._();
  const factory TimerState(
      {@required Duration currentTime,
      @required Duration totalYogaTime,
      @required Duration totalRestTime,
      @required Duration totalSpentTime,
      @required bool isResting,
      @required bool isPaused}) = _TimerState;

  factory TimerState.initial() {
    return TimerState(
        currentTime: Duration(seconds: 30),
        totalYogaTime: Duration(seconds: 30),
        totalRestTime: Duration(seconds: 10),
        totalSpentTime: Duration(seconds: 0),
        isResting: false,
        isPaused: true);
  }

  Progress get progress {
    final divider =
        isResting ? totalRestTime.inSeconds : totalYogaTime.inSeconds;
    return divider == 0
        ? Progress(0)
        : Progress(currentTime.inSeconds / divider);
  }
}
