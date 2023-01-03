import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/screens/timer/timer_screen.dart';
import 'package:timersi/data/models/timer_data.dart';

class TimerCard extends StatelessWidget {
  final TimerData timer;
  final Widget description;
  final LinearGradient gradient;

  const TimerCard({
    super.key,
    required this.timer,
    required this.gradient,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadings.kMedium,
        right: AppPadings.kMedium,
        bottom: AppPadings.kSmall,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(TimerScreen.pageRoute);
        },
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            minHeight: 132,
            minWidth: 300,
            maxWidth: 450,
          ),
          decoration: BoxDecoration(
            color: AppColors.kSoftBlack,
            borderRadius: BorderRadius.circular(
              AppPadings.kDefault,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              AppPadings.kDefault,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(
                          AppPadings.kSmall,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          timer.category.icon,
                          size: 36,
                          color: AppColors.kSoftWhite,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppPadings.kDefault,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timer.titie,
                          style: const TextStyle(
                            color: AppColors.kSoftWhite,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          timer.category.name,
                          style: const TextStyle(
                            color: AppColors.kSoftWhite,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppPadings.kTiny),
                description,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
