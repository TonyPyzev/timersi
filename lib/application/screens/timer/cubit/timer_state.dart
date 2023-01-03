part of 'timer_cubit.dart';

class TimerState extends Equatable {
  final Color backgroundColor;
  final bool isHoodVisible;

  const TimerState({
    this.backgroundColor = AppColors.kSoftBlack,
    this.isHoodVisible = true,
  });

  @override
  List<Object> get props => [
        backgroundColor,
        isHoodVisible,
      ];

  TimerState copyWith({
    Color? backgroundColor,
    bool? isHoodVisible,
  }) {
    return TimerState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isHoodVisible: isHoodVisible ?? this.isHoodVisible,
    );
  }
}
