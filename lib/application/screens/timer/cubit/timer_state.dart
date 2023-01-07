part of 'timer_cubit.dart';

class TimerState extends Equatable {
  final Color backgroundColor;
  final bool isHoodVisible;
  final Duration duration;
  final TimerStatus timerStatus;

  const TimerState({
    this.backgroundColor = AppColors.kSoftBlack,
    this.isHoodVisible = true,
    required this.duration,
    this.timerStatus = TimerStatus.playing,
  });

  @override
  List<Object> get props => [
        backgroundColor,
        isHoodVisible,
        duration,
        timerStatus,
      ];

  TimerState copyWith({
    Color? backgroundColor,
    bool? isHoodVisible,
    Duration? duration,
    TimerStatus? timerStatus,
  }) {
    return TimerState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isHoodVisible: isHoodVisible ?? this.isHoodVisible,
      duration: duration ?? this.duration,
      timerStatus: timerStatus ?? this.timerStatus,
    );
  }
}

enum TimerStatus {
  playing,
  pause,
  completed,
}
