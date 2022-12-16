import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/data/models/category.dart';
import 'package:timersi/data/models/timer.dart';

class TimerScreen extends StatefulWidget {
  static const String pageRoute = '/timer';

  const TimerScreen({
    super.key,
  });

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final Timer timer = Timer(
    titie: 'Fix the car',
    category: Category(
      name: 'Tasks',
      icon: Icons.timer,
    ),
    creationDateTime: DateTime.now(),
    time: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${timer.time.minute}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 200,
                ),
              ),
              Text(
                '${timer.time.second}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 200,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          SafeArea(
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
                          size: 64,
                          color: AppColors.kSoftWhite,
                          strokeWidth: 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO back
                        },
                        child: const FeatherIcon(
                          FeatherIcons.pauseCircle,
                          size: 64,
                          color: Color(0xFFB91515),
                          strokeWidth: 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO back
                        },
                        child: const FeatherIcon(
                          FeatherIcons.checkCircle,
                          size: 64,
                          color: Color(0xFF108F23),
                          strokeWidth: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
