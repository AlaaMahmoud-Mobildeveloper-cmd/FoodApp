import 'package:flutter/material.dart';
import 'package:food/core/caching.dart';
import 'package:food/screen/home_screen/homescreen.dart';
import 'package:food/screen/localiztion_screen/localizScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName ="SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //call function to navigate to next screen
    getNext();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Stack(
           clipBehavior: Clip.none,
           children: [
             SizedBox(
               width: double.infinity,
               height: 200,

             ),
             Positioned(
               top: -150,
                 child:  Image.asset("assets/images/hed.png",
                   width: 300,
                   fit: BoxFit.cover,
                 )
             )

           ],
         ),
          Image.asset("assets/images/food.png",width: 200,),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,

              ),
             Positioned(
                 right: 0,
                 bottom: -160,
                 child: Image.asset("assets/images/fot.png",
                   width: 300,
                   fit: BoxFit.cover,
                 )
             )
            ],
          ),
        ],
      ),
    );
  }
  //function to navigate to next screen
  void getNext(){
    Future.delayed(Duration(seconds: 10),(){
      Navigator.pushReplacementNamed(context,CachingHelper.getBool("intro") == true
          ? Homescreen.routeName
          : LocalizeScreen.routeName);
    });

  }
}
