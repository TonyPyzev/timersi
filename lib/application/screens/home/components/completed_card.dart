import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';

import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/screens/home/components/timer_card.dart';
import 'package:timersi/data/models/timer.dart';

class CompletedCard extends StatelessWidget {
  final Timer timer;
  final LinearGradient gradient;

  const CompletedCard({
    super.key,
    required this.timer,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return TimerCard(
      timer: timer,
      gradient: gradient,
      description: Column(
        children: [
          Row(
            children: [
              const FeatherIcon(
                FeatherIcons.checkCircle,
                color: Color(0xFF108F23),
                strokeWidth: 0.75,
              ),
              const SizedBox(width: AppPadings.kTiny),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 29,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${timer.time.hour}:',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.kSoftWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '${timer.time.minute}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.kSoftWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ':${timer.time.second}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.kSoftWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppPadings.kTiny / 2),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 29,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const FeatherIcon(
                      FeatherIcons.clock,
                      color: AppColors.kSoftWhite,
                      strokeWidth: 0.75,
                    ),
                    const SizedBox(width: AppPadings.kTiny),
                    Text(
                      '${timer.creationDateTime.day}.${timer.creationDateTime.month}.${timer.creationDateTime.year} - ${timer.completedDateTime!.day}.${timer.completedDateTime!.month}.${timer.completedDateTime!.year}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.kSoftWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const FeatherIcon(
                  FeatherIcons.arrowRightCircle,
                  color: AppColors.kSoftWhite,
                  strokeWidth: 0.75,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
