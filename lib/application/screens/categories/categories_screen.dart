import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/widgets/categories/categories_widgets.dart';
import 'package:timersi/application/widgets/header.dart';
import 'package:timersi/application/widgets/home/uncompleted_card.dart';
import 'package:timersi/data/models/category.dart';
import 'package:timersi/data/models/timer_data.dart';

class CategoriesScreen extends StatefulWidget {
  static const String pageRoute = '/categories';

  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const FeatherIcon(
                FeatherIcons.arrowLeft,
                strokeWidth: 1,
                size: 36,
              ),
            ),
            title: 'Sport',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  const InfoTextBox(
                    leading: 'Completed timers',
                    trail: '9',
                  ),
                  const InfoTextBox(
                    leading: 'Total time',
                    trail: '03:14:12',
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadings.kMedium,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return UncompletedCard(
                        time: TimerData(
                          titie: 'Wash my car',
                          category: Category(
                            name: 'Routine',
                            icon: Icons.date_range_outlined,
                          ),
                          creationDateTime: DateTime.now(),
                          time: DateTime.now(),
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFE8CF76), Color(0xFFFFC700)],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
