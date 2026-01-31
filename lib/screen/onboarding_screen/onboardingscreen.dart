import 'package:flutter/material.dart';
import 'package:food/core/caching.dart';
import 'package:food/core/colors.dart';
import 'package:food/core/style.dart';
import 'package:food/screen/home_screen/homescreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName="OnboardingScreen";
   OnboardingScreen({super.key});
   var  listPagesViewModel=[
     PageViewModel(
       titleWidget:Text( "All your favorites",style: AppStyle.titleStyle,),
       bodyWidget: Text("Get all your loved foods in one once place,you just place the orer we do the rest",
         textAlign: TextAlign.center,
         style: AppStyle.bodyIntroStyle,),
       image: Center(
         child:Image.asset("assets/images/t.png"),
       ),
     ),
     PageViewModel(
       titleWidget:Text( "Order from choosen chef",style: AppStyle.titleStyle,),
       bodyWidget: Text("Get all your loved foods in one once place,you just place the orer we do the rest",
         textAlign: TextAlign.center,
         style: AppStyle.bodyIntroStyle,),
       image: Center(
         child:Image.asset("assets/images/order2.png"),
       ),
     ),
     PageViewModel(
       titleWidget:Text( "Free delivery offers",style: AppStyle.titleStyle,),
       bodyWidget: Text("Get all your loved foods in one once place,you just place the orer we do the rest",
         textAlign: TextAlign.center,
         style: AppStyle.bodyIntroStyle,),
       image: Center(
         child:Image.asset("assets/images/d.png"),
       ),
     ),

   ];
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,

      bodyPadding: EdgeInsets.only(top: 200),
      isProgress: true,
      showNextButton: true,
      showBackButton: true,
      showSkipButton: true,

      skip:  Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  AppColors.brandingColor,
        ),
        child: Text("Skip",
          textAlign: TextAlign.center,
          style: AppStyle.bodyIntroStyle.copyWith(
              color: AppColors.whiteColor
          ),
        ),
      ),
      onSkip: ()async{
        await CachingHelper.saveBool(true);
        Navigator.pushNamed(context, Homescreen.routeName);
      },
      back: Icon(Icons.arrow_back_ios_rounded),
      next:  Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  AppColors.brandingColor,
        ),
        child: Text("Next",
        textAlign: TextAlign.center,
          style: AppStyle.bodyIntroStyle.copyWith(
            color: AppColors.whiteColor
          ),
        ),
      ),
      done:  Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  AppColors.brandingColor,
        ),
        child: Text("Done",
          textAlign: TextAlign.center,
          style: AppStyle.bodyIntroStyle.copyWith(
              color: AppColors.whiteColor
          ),
        ),
      ),
      onDone: () async{
        await CachingHelper.saveBool(true);
        Navigator.pushNamed(context, Homescreen.routeName);
      },
     dotsDecorator: DotsDecorator(
         size:  Size.square(10.0),
         activeSize:  Size(40.0, 10.0),
       activeColor: AppColors.brandingColor,
         spacing: const EdgeInsets.symmetric(horizontal: 3.0),
      activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
      ),
     ),
    );
  }
}
