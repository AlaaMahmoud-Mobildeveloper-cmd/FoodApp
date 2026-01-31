import 'package:flutter/material.dart';
import 'package:food/core/caching.dart';
import 'package:food/screen/home_screen/homescreen.dart';
import 'package:food/screen/localiztion_screen/localizScreen.dart';
import 'package:food/screen/onboarding_screen/onboardingscreen.dart';
import 'package:food/screen/splash_screen/splashscreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachingHelper.init();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LocalizeScreen.routeName: (context) => LocalizeScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        Homescreen.routeName: (context) => Homescreen(),

      }
      ,
    );
  }
}



