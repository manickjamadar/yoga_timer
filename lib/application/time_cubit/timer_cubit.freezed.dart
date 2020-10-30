// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'timer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TimerStateTearOff {
  const _$TimerStateTearOff();

// ignore: unused_element
  _TimerState call(
      {@required Duration currentTime,
      @required Duration totalYogaTime,
      @required Duration totalRestTime,
      @required Duration totalSpentTime,
      @required bool isResting,
      @required bool isPaused}) {
    return _TimerState(
      currentTime: currentTime,
      totalYogaTime: totalYogaTime,
      totalRestTime: totalRestTime,
      totalSpentTime: totalSpentTime,
      isResting: isResting,
      isPaused: isPaused,
    );
  }
}

// ignore: unused_element
const $TimerState = _$TimerStateTearOff();

mixin _$TimerState {
  Duration get currentTime;
  Duration get totalYogaTime;
  Duration get totalRestTime;
  Duration get totalSpentTime;
  bool get isResting;
  bool get isPaused;

  $TimerStateCopyWith<TimerState> get copyWith;
}

abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res>;
  $Res call(
      {Duration currentTime,
      Duration totalYogaTime,
      Duration totalRestTime,
      Duration totalSpentTime,
      bool isResting,
      bool isPaused});
}

class _$TimerStateCopyWithImpl<$Res> implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  final TimerState _value;
  // ignore: unused_field
  final $Res Function(TimerState) _then;

  @override
  $Res call({
    Object currentTime = freezed,
    Object totalYogaTime = freezed,
    Object totalRestTime = freezed,
    Object totalSpentTime = freezed,
    Object isResting = freezed,
    Object isPaused = freezed,
  }) {
    return _then(_value.copyWith(
      currentTime:
          currentTime == freezed ? _value.currentTime : currentTime as Duration,
      totalYogaTime: totalYogaTime == freezed
          ? _value.totalYogaTime
          : totalYogaTime as Duration,
      totalRestTime: totalRestTime == freezed
          ? _value.totalRestTime
          : totalRestTime as Duration,
      totalSpentTime: totalSpentTime == freezed
          ? _value.totalSpentTime
          : totalSpentTime as Duration,
      isResting: isResting == freezed ? _value.isResting : isResting as bool,
      isPaused: isPaused == freezed ? _value.isPaused : isPaused as bool,
    ));
  }
}

abstract class _$TimerStateCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory _$TimerStateCopyWith(
          _TimerState value, $Res Function(_TimerState) then) =
      __$TimerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Duration currentTime,
      Duration totalYogaTime,
      Duration totalRestTime,
      Duration totalSpentTime,
      bool isResting,
      bool isPaused});
}

class __$TimerStateCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements _$TimerStateCopyWith<$Res> {
  __$TimerStateCopyWithImpl(
      _TimerState _value, $Res Function(_TimerState) _then)
      : super(_value, (v) => _then(v as _TimerState));

  @override
  _TimerState get _value => super._value as _TimerState;

  @override
  $Res call({
    Object currentTime = freezed,
    Object totalYogaTime = freezed,
    Object totalRestTime = freezed,
    Object totalSpentTime = freezed,
    Object isResting = freezed,
    Object isPaused = freezed,
  }) {
    return _then(_TimerState(
      currentTime:
          currentTime == freezed ? _value.currentTime : currentTime as Duration,
      totalYogaTime: totalYogaTime == freezed
          ? _value.totalYogaTime
          : totalYogaTime as Duration,
      totalRestTime: totalRestTime == freezed
          ? _value.totalRestTime
          : totalRestTime as Duration,
      totalSpentTime: totalSpentTime == freezed
          ? _value.totalSpentTime
          : totalSpentTime as Duration,
      isResting: isResting == freezed ? _value.isResting : isResting as bool,
      isPaused: isPaused == freezed ? _value.isPaused : isPaused as bool,
    ));
  }
}

class _$_TimerState extends _TimerState {
  const _$_TimerState(
      {@required this.currentTime,
      @required this.totalYogaTime,
      @required this.totalRestTime,
      @required this.totalSpentTime,
      @required this.isResting,
      @required this.isPaused})
      : assert(currentTime != null),
        assert(totalYogaTime != null),
        assert(totalRestTime != null),
        assert(totalSpentTime != null),
        assert(isResting != null),
        assert(isPaused != null),
        super._();

  @override
  final Duration currentTime;
  @override
  final Duration totalYogaTime;
  @override
  final Duration totalRestTime;
  @override
  final Duration totalSpentTime;
  @override
  final bool isResting;
  @override
  final bool isPaused;

  @override
  String toString() {
    return 'TimerState(currentTime: $currentTime, totalYogaTime: $totalYogaTime, totalRestTime: $totalRestTime, totalSpentTime: $totalSpentTime, isResting: $isResting, isPaused: $isPaused)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimerState &&
            (identical(other.currentTime, currentTime) ||
                const DeepCollectionEquality()
                    .equals(other.currentTime, currentTime)) &&
            (identical(other.totalYogaTime, totalYogaTime) ||
                const DeepCollectionEquality()
                    .equals(other.totalYogaTime, totalYogaTime)) &&
            (identical(other.totalRestTime, totalRestTime) ||
                const DeepCollectionEquality()
                    .equals(other.totalRestTime, totalRestTime)) &&
            (identical(other.totalSpentTime, totalSpentTime) ||
                const DeepCollectionEquality()
                    .equals(other.totalSpentTime, totalSpentTime)) &&
            (identical(other.isResting, isResting) ||
                const DeepCollectionEquality()
                    .equals(other.isResting, isResting)) &&
            (identical(other.isPaused, isPaused) ||
                const DeepCollectionEquality()
                    .equals(other.isPaused, isPaused)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentTime) ^
      const DeepCollectionEquality().hash(totalYogaTime) ^
      const DeepCollectionEquality().hash(totalRestTime) ^
      const DeepCollectionEquality().hash(totalSpentTime) ^
      const DeepCollectionEquality().hash(isResting) ^
      const DeepCollectionEquality().hash(isPaused);

  @override
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);
}

abstract class _TimerState extends TimerState {
  const _TimerState._() : super._();
  const factory _TimerState(
      {@required Duration currentTime,
      @required Duration totalYogaTime,
      @required Duration totalRestTime,
      @required Duration totalSpentTime,
      @required bool isResting,
      @required bool isPaused}) = _$_TimerState;

  @override
  Duration get currentTime;
  @override
  Duration get totalYogaTime;
  @override
  Duration get totalRestTime;
  @override
  Duration get totalSpentTime;
  @override
  bool get isResting;
  @override
  bool get isPaused;
  @override
  _$TimerStateCopyWith<_TimerState> get copyWith;
}
