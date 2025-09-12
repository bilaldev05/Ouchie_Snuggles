import 'package:go_router/go_router.dart';
import 'package:ouchie_snuggles/screens/grownup_screen.dart';
import 'package:ouchie_snuggles/screens/intro_screen.dart';
import 'package:ouchie_snuggles/screens/introkosmo_screen.dart';
import 'package:ouchie_snuggles/screens/introlilly_screen.dart';
import 'package:ouchie_snuggles/screens/introtulip_screen.dart';
import 'package:ouchie_snuggles/screens/pincode_screen.dart';

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
      builder: (context, state) => const GrownUpModeScreen(),
    ),
    GoRoute(
      path: '/pincode',
      builder: (context, state) => const SetPinCodeScreen(),
    ),
  ],
);
