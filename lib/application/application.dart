import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timersi/application/navigation/navigation.dart';
import 'package:timersi/application/screens/home/cubit/bottomSheet/bottom_sheet_cubit.dart';
import 'package:timersi/application/screens/home/cubit/home/home_cubit.dart';
import 'package:timersi/application/screens/timer/cubit/timer_cubit.dart';
import 'package:timersi/application/theme/app_theme.dart';

class Application extends StatelessWidget {
  final String _title = 'Timersi';

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<TimerCubit>(
          create: (context) => TimerCubit()..startTimer(),
        ),
        BlocProvider<BottomSheetCubit>(
          create: (context) => BottomSheetCubit(),
        ),
      ],
      child: MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        initialRoute: Navigation.initialRoute,
        routes: Navigation.routes,
      ),
    );
  }
}
