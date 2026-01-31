import 'package:flutter/material.dart';
import 'package:food/core/caching.dart';
import 'package:food/core/colors.dart';
import 'package:food/core/style.dart';
import 'package:food/screen/home_screen/homescreen.dart';
import 'package:food/screen/onboarding_screen/onboardingscreen.dart';

class LocalizeScreen extends StatelessWidget {
  const LocalizeScreen({super.key});
  static const String routeName = 'LocalizeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Image.asset("assets/images/food.png",width: 200,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/chef.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Wide Selection",
                  textAlign: TextAlign.start,
                  style: AppStyle.titleStyle.copyWith(color: AppColors.brandingColor),),
                Text("Waslak is a smart food delivery app that connects\n you to your favorite restaurants in minutes!Pick your\n  meal,track it in real time, and enjoy it hot and fresh\n right at your doorstep.Fast, secure, and with flexible\n payment options — because your comfort comes first!",
                  style: AppStyle.bodyIntroStyle,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Language",
                    style:AppStyle.titleStyle.copyWith(color: AppColors.brandingColor) ,),
                ),
               Row(
                 spacing: 10,
                    children: [
                     Container(
                       width: 60,
                       height: 40,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: AppColors.brandingColor,
                       ),
                       child: Text("En"
                         ,textAlign: TextAlign.center
                         ,style: AppStyle.bodyIntroStyle.copyWith(color: AppColors.whiteColor,fontSize: 30),),
                     ),
                      Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:Colors.white,
                          border: Border.all(color: AppColors.brandingColor)
                        ),
                        child: Text("Ar"
                          ,textAlign: TextAlign.center
                          ,style: AppStyle.bodyIntroStyle.copyWith(color:AppColors.brandingColor ,fontSize: 30),),
                      ),
                    ]
                  ),

              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Theming",
                    style:AppStyle.titleStyle.copyWith(color: AppColors.brandingColor) ,),
                ),
                Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.brandingColor,
                        ),
                        child:Icon(Icons.light_mode,size: 30,color: Colors.white,)
                      ),
                      Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Colors.white,
                            border: Border.all(color: AppColors.brandingColor)
                        ),
                        child: Icon(Icons.dark_mode,size: 30,color:AppColors.brandingColor,)
                      ),
                    ]
                ),

              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandingColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: (){

                 Navigator.pushNamed(context, OnboardingScreen.routeName);
            }, child: Text("Get Started",style: AppStyle.bodyIntroStyle.copyWith(color: AppColors.whiteColor,fontSize: 25),)),
          ],
        ),
      ),
    );
  }
}
