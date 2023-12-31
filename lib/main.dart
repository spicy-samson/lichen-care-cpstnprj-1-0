import 'package:get/get.dart';
import 'package:lichen_care/pages/user/stream_example.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lichen_care/pages/guest/login.dart';
import 'package:lichen_care/pages/user/profile.dart';
import 'package:lichen_care/pages/user/home_page.dart';
import 'package:lichen_care/pages/user/lichenHub.dart';
import 'package:lichen_care/pages/user/lichenNotif.dart';
import 'package:lichen_care/pages/user/lichenpedia.dart';
import 'package:lichen_care/pages/user/lichenCheck.dart';
import 'package:lichen_care/pages/guest/home_sliders.dart';
import 'package:lichen_care/pages/guest/registration.dart';
import 'package:lichen_care/pages/user/profile/account.dart';
import 'package:lichen_care/pages/user/profile/about_us.dart';
import 'package:lichen_care/pages/user/profile/scan_history.dart';
import 'package:lichen_care/pages/user/profile/user_feedback.dart';
import 'package:lichen_care/pages/user/profile/privacy_policy.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:lichen_care/pages/user/profile/terms_and_conditions.dart';
import 'package:lichen_care/pages/user/lichenpedia/lichenpedia_vault.dart';
import 'package:lichen_care/pages/user/lichenpedia/lichenpedia_archives.dart';
import 'package:lichen_care/pages/user/lichenpedia/lichenpedia_variants.dart';
import 'package:lichen_care/pages/user/lichenpedia/lichenpedia_reference.dart';

import 'pages/user/profile/user_manual.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Root of Application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LichenCare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ABeeZee',
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'ABeeZee',
            ),
      ),
      home: MyCarousel(),
      onGenerateRoute: (route) {
        switch (route.name) {
          case '/login':
            return pageRoute(route, LoginPage(), 0);
          case '/registration':
            return pageRoute(route, RegistrationPage(), 0);
          case '/home':
            return pageRoute(route, HomePage(), 0);
          case '/lichenpedia':
            return pageRoute(route, LichenPedia(), 0);
          case '/lichenpedia/lichenpedia_archive':
            return pageRoute(route, LichenPediaArchive(), 0);
          case '/lichenpedia/lichenpedia_variant':
            return pageRoute(route, LichenPediaVariant(), 0);
          case '/lichenpedia/lichenpedia_vault':
            return pageRoute(route, LichenPediaVault(), 0);
          case '/lichenpedia/lichenpedia_reference':
            return pageRoute(route, LichenPediaReferences(), 0);
          case '/lichenHub':
            return pageRoute(route, LichenHub(), 0);
          case '/lichenNotif':
            return pageRoute(route, LichenNotif(), 0);
          case '/lichenCheck':
            return pageRoute(route, LichenCheck(), 100);
          case '/profile':
            return pageRoute(route, Profile(), 0);
          case '/profile/account':
            return pageRoute(route, Account(), 0);
          case '/profile/scan_history':
            return pageRoute(route, ScanHistory(), 0);
          case '/profile/user_feedback':
            return pageRoute(route, UserFeedback(), 0);
          case '/profile/about_us':
            return pageRoute(route, AboutUs(), 0);
          case '/profile/terms_and_conditions':
            return pageRoute(route, TermsAndConditions(), 0);
          case '/profile/privacy_policy':
            return pageRoute(route, PrivacyPolicy(), 0);
          case '/profile/terms_and_conditions-boot':
            return pageRoute(route, TermsAndConditions(onBoot: true,), 0);
          case '/profile/privacy_policy-boot':
            return pageRoute(route, PrivacyPolicy(onBoot: true), 0);
          case '/profile/user_manual':
            return pageRoute(route, UserManual(), 0);
          case '/stream_example':
            return pageRoute(route, LichenCareNotifications(), 0);
        }
      },
    );
  }
}

Route pageRoute(route, page, transitionDuration) {
  const beginZoom = 0.5;
  const endZoom = 1.0;
  final tween = Tween(begin: beginZoom, end: endZoom)
      .chain(CurveTween(curve: Curves.ease));
  return PageRouteBuilder(
    settings: route,
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation.drive(tween),
        child: ScaleTransition(
          scale: animation.drive(tween),
          child: child,
        ),
      );
    },
    transitionDuration: Duration(milliseconds: transitionDuration),
    reverseTransitionDuration: Duration(milliseconds: 10),
  );
}
