import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tracker_app2/collections/diet_isar.dart';
import 'package:tracker_app2/collections/emotion_isar.dart';
import 'package:tracker_app2/collections/recording_isar.dart';
import 'package:tracker_app2/collections/workout_isar.dart';
import 'package:tracker_app2/db_connection.dart';
import 'package:tracker_app2/providers/diet_provider.dart';
import 'package:tracker_app2/providers/emotion_provider.dart';
import 'package:tracker_app2/providers/recording_provider.dart';
import 'package:tracker_app2/providers/workout_provider.dart';
import 'package:tracker_app2/repositories/diet_repo.dart';
import 'package:tracker_app2/repositories/emotion_repo.dart';
import 'package:tracker_app2/repositories/recording_repo.dart';
import 'package:tracker_app2/repositories/workout_repo.dart';
//import 'package:tracker_app2/widget/bottom_sheet.dart';
import 'widget/emotion_widget.dart';
import 'widget/diet_widget.dart';
import 'widget/workout_widget.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: '/emotion',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellA'),
          routes: [
            GoRoute(
              path: '/emotion',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: EmotionWidget(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellB'),
          routes: [
            GoRoute(
              path: '/diet',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DietWidget(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellC'),
          routes: [
            GoRoute(
              path: '/workout',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: WorkoutWidget(),
              ),
            ),
          ],
        ),
        // StatefulShellBranch(
        //   navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellD'),
        //   routes: [
        //     GoRoute(
        //       path: '/recording_info',
        //       pageBuilder: (context, state) => const NoTransitionPage(
        //         child: BottomSheetWidget(isEnglish: _isEnglish),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  final isar = Database.isar;
  usePathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                EmotionProvider(EmotionRepository(isar.emotionRecords))),
        ChangeNotifierProvider(
            create: (_) => DietProvider(DietRepository(isar.dietRecords))),
        ChangeNotifierProvider(
            create: (_) =>
                WorkoutProvider(WorkoutRepository(isar.workoutRecords))),
        ChangeNotifierProvider(
            create: (_) =>
                RecordingProvider(RecordingRepository(isar.recordingRecords))),
      ],
      child: const MyApp(),
    ),
  );
}

void usePathUrlStrategy() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
          key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'),
        );

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return ScaffoldWithNavigationBar(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      } else {
        return ScaffoldWithNavigationRail(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      }
    });
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    Key? key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'Emotion', icon: Icon(Icons.mood)),
          NavigationDestination(label: 'Diet', icon: Icon(Icons.restaurant)),
          NavigationDestination(
              label: 'Workout', icon: Icon(Icons.fitness_center)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    Key? key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                label: Text('Emotion'),
                icon: Icon(Icons.mood),
              ),
              NavigationRailDestination(
                label: Text('Diet'),
                icon: Icon(Icons.restaurant),
              ),
              NavigationRailDestination(
                label: Text('Workout'),
                icon: Icon(Icons.fitness_center),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
