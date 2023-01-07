import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_colors.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  late Timer timer;
  late Timer hoodTimer;

  TimerCubit() : super(const TimerState(duration: Duration()));

  void startTimer() {
    emit(state.copyWith(
      timerStatus: TimerStatus.playing,
    ));
    timer = _createTimer();
  }

  void pauseTimer() {
    emit(state.copyWith(
      timerStatus: TimerStatus.pause,
    ));
    timer.cancel();
  }

  void completeTimer() {
    emit(state.copyWith(
      timerStatus: TimerStatus.completed,
    ));
    timer.cancel();
  }

  void restartTimer() {
    emit(state.copyWith(
      duration: const Duration(days: 3),
      timerStatus: TimerStatus.pause,
    ));
  }

  void setHoodHideTimer() {
    const Duration duration = Duration(
      seconds: 5,
    );
    hoodTimer = Timer(
      duration,
      () => _hideHood(),
    );
  }

  void resetState() {
    hoodTimer.cancel();
  }

  void switchHoodVisibility() {
    if (hoodTimer.isActive) {
      hoodTimer.cancel();
      _hideHood();
    } else {
      _showHood();
    }
  }

  void _showHood() {
    emit(state.copyWith(
      backgroundColor: AppColors.kSoftBlack,
      isHoodVisible: true,
    ));
    setHoodHideTimer();
  }

  void _hideHood() {
    emit(state.copyWith(
      backgroundColor: AppColors.kBackgroundBlack,
      isHoodVisible: false,
    ));
  }

  void _addTime() {
    emit(state.copyWith(
      duration: Duration(seconds: state.duration.inSeconds + 1),
    ));
  }

  Timer _createTimer() {
    return Timer.periodic(
      const Duration(seconds: 1),
      (_) => _addTime(),
    );
  }
}
