import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';

import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/data/models/timer_data.dart';

import 'timer_card.dart';

class UncompletedCard extends StatelessWidget {
  final TimerData time;
  final LinearGradient gradient;

  const UncompletedCard({
    super.key,
    required this.time,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return TimerCard(
      timer: time,
      gradient: gradient,
      description: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const FeatherIcon(
                FeatherIcons.playCircle,
                color: AppColors.kSoftWhite,
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
                        text: '${time.time.hour}:',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.kSoftWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '${time.time.minute}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.kSoftWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ':${time.time.second}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.kSoftWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
