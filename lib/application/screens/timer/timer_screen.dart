import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/screens/timer/cubit/timer_cubit.dart';
import 'package:timersi/data/models/category.dart';
import 'package:timersi/data/models/timer_data.dart';

class TimerScreen extends StatefulWidget {
  static const String pageRoute = '/timer';

  final BuildContext parentContext;

  const TimerScreen({
    super.key,
    required this.parentContext,
  });

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late final TimerCubit cubit;

  final TimerData timer = TimerData(
    titie: 'Fix the car',
    category: Category(
      name: 'Tasks',
      icon: Icons.timer,
    ),
    creationDateTime: DateTime.now(),
    time: DateTime.now(),
  );

  @override
  void initState() {
    cubit = widget.parentContext.read<TimerCubit>();
    cubit.setHoodHideTimer();
    super.initState();
  }

  @override
  void dispose() {
    cubit.resetState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              cubit.switchHoodVisibility();
            },
            child: Container(
              color: state.backgroundColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${timer.time.hour}',
                          style: const TextStyle(
                            height: 1.0,
                            fontFamily: 'Poppins',
                            fontSize: 180,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '${timer.time.minute}',
                          style: const TextStyle(
                            height: 1.0,
                            fontFamily: 'Poppins',
                            fontSize: 180,
                          ),
                        ),
                        Text(
                          '${timer.time.second}',
                          style: const TextStyle(
                            height: 1.0,
                            fontFamily: 'Poppins',
                            fontSize: 180,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: state.isHoodVisible,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: AppPadings.kMedium),
                          Text(
                            timer.titie,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppPadings.kBig,
                              horizontal: AppPadings.kBig,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const FeatherIcon(
                                    FeatherIcons.arrowLeftCircle,
                                    size: 84,
                                    color: AppColors.kSoftWhite,
                                    strokeWidth: 0.75,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //TODO back
                                  },
                                  child: const FeatherIcon(
                                    FeatherIcons.pauseCircle,
                                    size: 84,
                                    color: Color(0xFFB91515),
                                    strokeWidth: 0.75,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //TODO back
                                  },
                                  child: const FeatherIcon(
                                    FeatherIcons.checkCircle,
                                    size: 84,
                                    color: Color(0xFF108F23),
                                    strokeWidth: 0.75,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
