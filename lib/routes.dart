import 'package:go_router/go_router.dart';
import 'package:ouchie_snuggles/screens/article_screen.dart';
import 'package:ouchie_snuggles/screens/book_selection.dart';
import 'package:ouchie_snuggles/screens/character_selection.dart';
import 'package:ouchie_snuggles/screens/child_profile.dart';
import 'package:ouchie_snuggles/screens/coloring_screen.dart';
import 'package:ouchie_snuggles/screens/coloring_selection.dart';
import 'package:ouchie_snuggles/screens/enterpin_screen.dart';
import 'package:ouchie_snuggles/screens/grownup_mode.dart';
import 'package:ouchie_snuggles/screens/grownup_screen.dart';
import 'package:ouchie_snuggles/screens/home_screen.dart';
import 'package:ouchie_snuggles/screens/intro_screen.dart';
import 'package:ouchie_snuggles/screens/introkosmo_screen.dart';
import 'package:ouchie_snuggles/screens/introlilly_screen.dart';
import 'package:ouchie_snuggles/screens/introtulip_screen.dart';
import 'package:ouchie_snuggles/screens/journey_screen.dart';
import 'package:ouchie_snuggles/screens/kidsdashboard.dart';
import 'package:ouchie_snuggles/screens/lesson_complete.dart';
import 'package:ouchie_snuggles/screens/logcap_screen.dart';
import 'package:ouchie_snuggles/screens/manage_cap_screen.dart';
import 'package:ouchie_snuggles/screens/math_problem_screen.dart';
import 'package:ouchie_snuggles/screens/otp_verification.dart';
import 'package:ouchie_snuggles/screens/parent_signup.dart';
import 'package:ouchie_snuggles/screens/parent_verification.dart';
import 'package:ouchie_snuggles/screens/pincode_screen.dart';
import 'package:ouchie_snuggles/screens/registercap_screen.dart';
import 'package:ouchie_snuggles/screens/registeredcap_screen.dart';
import 'package:ouchie_snuggles/screens/reminders_screen.dart';
import 'package:ouchie_snuggles/screens/reward_screen.dart';

import 'package:ouchie_snuggles/screens/splash_screen.dart';
import 'package:ouchie_snuggles/screens/story_screen.dart';
import 'package:ouchie_snuggles/screens/storyplayer_screen.dart';
import 'package:ouchie_snuggles/screens/storyvideos_screen.dart';

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
    GoRoute(
      path: '/article',
      builder: (context, state) => const ArticleDetailScreen(),
    ),
    GoRoute(
      path: '/parent',
      builder: (context, state) => const ParentSignUpScreen(),
    ),
    GoRoute(
      path: '/parentverification',
      builder: (context, state) => const ParentVerificationScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OtpVerificationScreen(),
    ),
    GoRoute(
      path: '/child',
      builder: (context, state) => const ChildProfileScreen(),
    ),
    GoRoute(
      path: '/selection',
      builder: (context, state) => const CharacterSelectionScreen(),
    ),
    GoRoute(
      path: '/kids',
      builder: (context, state) => const KidsDashboardScreen(),
    ),
    GoRoute(
      path: '/journey',
      builder: (context, state) => const JourneyScreen(),
    ),
    GoRoute(
      path: '/book',
      builder: (context, state) => const BookSelectionScreen(),
    ),
    GoRoute(path: '/story', builder: (context, state) => const StoryScreen()),
    GoRoute(
      path: '/lesson',
      builder: (context, state) => const LessonCompleteScreen(),
    ),
    GoRoute(
      path: '/coloring',
      builder: (context, state) => const ColoringSelectionScreen(),
    ),
    GoRoute(
      path: '/color',
      builder: (context, state) => const ColoringScreen(),
    ),
    GoRoute(
      path: '/videos',
      builder: (context, state) => const StoryVideosScreen(),
    ),
    GoRoute(
      path: '/player',
      builder: (context, state) => const StoryPlayerScreen(),
    ),
    GoRoute(path: '/reward', builder: (context, state) => const RewardScreen()),
  ],
);
