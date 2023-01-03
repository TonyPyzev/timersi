import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_colors.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  late Timer hoodTimer;

  TimerCubit() : super(const TimerState());

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
    emit(const TimerState());
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
}
