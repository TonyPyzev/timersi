import 'package:flutter/material.dart';

import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/screens/home/components/components.dart';
import 'package:timersi/application/screens/home/models/custom_tab.dart';
import 'package:timersi/application/theme/font_theme.dart';
import 'package:timersi/application/widgets/widgets.dart';
import 'package:timersi/data/models/category.dart';
import 'package:timersi/data/models/timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(
          title: 'Timersi',
        ),
        _Body(),
      ],
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with TickerProviderStateMixin {
  late final TabController _tabController;
  final int initialIndex = 0;

  final List<CustomTab> tabs = [
    CustomTab(
      title: 'In Progress',
      color: const Color(0xFF3268D1),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF749EF1), Color(0xFF3268D1)],
      ),
      card: UncompletedCard(
        timer: Timer(
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
          colors: [Color(0xFF749EF1), Color(0xFF3268D1)],
        ),
      ),
    ),
    CustomTab(
      title: 'Categories',
      color: const Color(0xFFFFC700),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE8CF76), Color(0xFFFFC700)],
      ),
      card: CategoryCard(
        category: Category(
          name: 'Work',
          icon: Icons.computer_outlined,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE8CF76), Color(0xFFFFC700)],
        ),
        iconColor: AppColors.kSoftBlack,
      ),
    ),
    CustomTab(
      title: 'Completed',
      color: const Color(0xFF108F23),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF6DC37A), Color(0xFF108F23)],
      ),
      card: CategoryCard(
        category: Category(
          name: 'Work',
          icon: Icons.computer_outlined,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6DC37A), Color(0xFF108F23)],
        ),
        iconColor: AppColors.kSoftWhite,
      ),
    ),
    CustomTab(
      title: 'History',
      color: const Color(0xFFB91515),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE93939), Color(0xFFB91515)],
      ),
      card: CompletedCard(
        timer: Timer(
          titie: 'Add validation',
          category: Category(
            name: 'Work',
            icon: Icons.computer_outlined,
          ),
          creationDateTime: DateTime.now(),
          completedDateTime: DateTime.now(),
          time: DateTime.now(),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE93939), Color(0xFFB91515)],
        ),
      ),
    ),
  ];

  late int activeTabIndex;

  @override
  void initState() {
    activeTabIndex = initialIndex;
    _initTabController();
    super.initState();
    _tabController.animation!.addListener(() {
      if (_tabController.animation!.status == AnimationStatus.forward) {
        setState(() {
          activeTabIndex = _tabController.index;
        });
      }
    });
  }

  void _initTabController() {
    _tabController = TabController(
      initialIndex: initialIndex,
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadings.kMedium,
            ),
            labelPadding: const EdgeInsets.only(
              right: 24,
            ),
            indicator: const BoxDecoration(),
            unselectedLabelStyle: FontTheme.tabLabel,
            labelStyle: FontTheme.tabLabel.copyWith(
              color: AppColors.kSoftWhite,
              fontWeight: FontWeight.w700,
            ),
            tabs: List.generate(
              _tabController.length,
              (index) {
                return _tab(
                  isActive: index == activeTabIndex,
                  text: tabs[index].title,
                  color: tabs[index].color,
                );
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                _tabController.length,
                (pageIndex) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadings.kMedium,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, itemIndex) {
                      return tabs[pageIndex].card;
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab({
    required bool isActive,
    required String text,
    required Color color,
  }) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: const Duration(
        milliseconds: 150,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: isActive ? color : Colors.transparent,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 4,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
