import 'package:go_router/go_router.dart';
import 'package:ouchie_snuggles/screens/enterpin_screen.dart';
import 'package:ouchie_snuggles/screens/grownup_mode.dart';
import 'package:ouchie_snuggles/screens/grownup_screen.dart';
import 'package:ouchie_snuggles/screens/home_screen.dart';
import 'package:ouchie_snuggles/screens/intro_screen.dart';
import 'package:ouchie_snuggles/screens/introkosmo_screen.dart';
import 'package:ouchie_snuggles/screens/introlilly_screen.dart';
import 'package:ouchie_snuggles/screens/introtulip_screen.dart';
import 'package:ouchie_snuggles/screens/logcap_screen.dart';
import 'package:ouchie_snuggles/screens/manage_cap_screen.dart';
import 'package:ouchie_snuggles/screens/math_problem_screen.dart';
import 'package:ouchie_snuggles/screens/pincode_screen.dart';
import 'package:ouchie_snuggles/screens/registercap_screen.dart';
import 'package:ouchie_snuggles/screens/registeredcap_screen.dart';
import 'package:ouchie_snuggles/screens/reminders_screen.dart';

import 'package:ouchie_snuggles/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

    GoRoute(path: '/intro', builder: (context, state) => const IntroScreen()),
    GoRoute(
      path: '/introtulip',
      builder: (context, state) => const IntroTulipScreen(),
    ),
    GoRoute(
      path: '/introlily',
      builder: (context, state) => const IntroLilyScreen(),
    ),
    GoRoute(
      path: '/introkosmo',
      builder: (context, state) => const IntroKosmoScreen(),
    ),
    GoRoute(
      path: '/grownup',
      builder: (context, state) => const GrownUpScreen(),
    ),
    GoRoute(
      path: '/pincode',
      builder: (context, state) => const SetPinCodeScreen(),
    ),
    GoRoute(
      path: '/grownupmode',
      builder: (context, state) => const GrownUpModeScreen(),
    ),
    GoRoute(
      path: '/enterpin',
      builder: (context, state) => const EnterPinScreen(),
    ),
    GoRoute(
      path: '/math',
      builder: (context, state) => const MathProblemScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/registercap',
      builder: (context, state) => const RegisterCapScreen(),
    ),
    GoRoute(
      path: '/registeredcap',
      builder: (context, state) => const RegisteredCapScreen(),
    ),
    GoRoute(
      path: '/reminders',
      builder: (context, state) => const RemindersScreen(),
    ),
    GoRoute(
      path: '/logcap',
      builder: (context, state) => const LogCapUseScreen(),
    ),
    GoRoute(
      path: '/managecap',
      builder: (context, state) => const ManageCapScreen(),
    ),
  ],
);
