import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';

import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/screens/home/pages/home_page.dart';
import 'package:timersi/application/screens/home/pages/settings_page.dart';
import 'package:timersi/application/theme/font_theme.dart';
import 'package:timersi/application/widgets/home/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String pageRoute = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _initPageController();
    super.initState();
  }

  void _initPageController() {
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomePage(),
                SettingsPage(),
              ],
            ),
          ),
          _CustomBottomBar(
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}

class _CustomBottomBar extends StatefulWidget {
  final PageController pageController;

  const _CustomBottomBar({
    required this.pageController,
  });

  @override
  State<_CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<_CustomBottomBar> {
  late double _activePage;

  @override
  void initState() {
    _activePage = widget.pageController.page ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      decoration: const BoxDecoration(
        color: AppColors.kSoftWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppPadings.kDefault),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadings.kDefault,
          horizontal: AppPadings.kMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _navigateToPage(0);
                  },
                  child: FeatherIcon(
                    FeatherIcons.clock,
                    color: _activePage == .0
                        ? AppColors.kSoftBlack
                        : const Color(0xFF707070),
                    strokeWidth: _activePage == .0 ? 1 : 0.75,
                    size: 42,
                  ),
                ),
                const SizedBox(width: AppPadings.kMedium),
                GestureDetector(
                  onTap: () {
                    _navigateToPage(1);
                  },
                  child: FeatherIcon(
                    FeatherIcons.settings,
                    color: _activePage == 1.0
                        ? AppColors.kSoftBlack
                        : const Color(0xFF707070),
                    strokeWidth: _activePage == 1.0 ? 1 : 0.75,
                    size: 42,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Container(
                width: 144,
                height: 48,
                decoration: const BoxDecoration(
                  color: AppColors.kSoftBlack,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppPadings.kMedium,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      color: AppColors.kSoftWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(int destinationPageIndex) {
    if (widget.pageController.page != destinationPageIndex.toDouble()) {
      widget.pageController.animateToPage(
        destinationPageIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
    _setActivePage(destinationPageIndex);
  }

  void _setActivePage(int pageIndex) {
    setState(() {
      _activePage = pageIndex.toDouble();
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const CustomBottomSheet();
      },
    );
  }
}
