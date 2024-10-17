import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourpadel/presentation_layer/resources/routes.dart';
class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class BoardingModel {
  final String? image;
  final String? title;
  final String? smoothPageIndicator;

  BoardingModel({required this.image, required this.title,required this.smoothPageIndicator});
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boardingList = [
    BoardingModel(
        image: 'assets/images/onboarding_1.png',
        title:
            'Create your profile with more features and get notifications for your activities',
      smoothPageIndicator: 'assets/images/page_1.png'
    ),
    // BoardingModel(image: 'assets/images/splash4.json',
    //     title: 'On Board 1 Title', body: 'On Board 1 Body '),
    BoardingModel(
        image: 'assets/images/onboarding_2.png',
        title:
            'Book the court at any time and get the confirmation and reminders',
        smoothPageIndicator: 'assets/images/page_2.png'),
    BoardingModel(
        image: 'assets/images/onboarding_3.png',
        title: 'Join our community, and get more news and updates',
        smoothPageIndicator: 'assets/images/page_3.png'),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: boardController,
        onPageChanged: (int index) {
          if (index == boardingList.length - 1) {
            setState(() {
              isLast = true;
            });
          } else {
            setState(() {
              isLast = false;
            });
          }
        },
        itemBuilder: (context, index) => buildBoardingItem(boardingList[index]),
        itemCount: boardingList.length,
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Stack(
        children: [
          Image.asset(
            '${model.image}',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/background_color.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: InkWell(
              onTap: (){
                subMit();
              },
              child: Container(
                  width: 83,
                  height: 83,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 242, 242, 0.24),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 1.5, color: Color.fromRGBO(195, 253, 8, 1))),
                  child: Center(
                      child: Text(
                    'Skip',
                    style: TextStyle(
                        color: Color.fromRGBO(195, 253, 8, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ))),
            ),
            top: 60,
            left: 290,
          ),
          Positioned(
            child: Image.asset('assets/images/icon_onboarding.png'),
            top: 550,
            left: 25,
          ),
          Positioned(
            child: Container(
              width: 335,
              height: 142,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('${model.title}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 26.0,
                        color: Colors.white,
                        height: 1.2,
                        fontWeight: FontWeight.w700),
                    maxLines: 4,
                    textAlign: TextAlign.start),
              ),
            ),
            top: 550,
            left: 43,
          ),
          Positioned(
              child: isLast ? InkWell(
                onTap: (){
                  subMit();
                },
                child: Container(
                    width: 81,
                    height: 81,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(195, 253, 8, 1),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            width: 1.5, color: Color.fromRGBO(195, 253, 8, 1)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(195, 253, 8, 1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],),
                    child: Center(
                        child: Text(
                          'Start',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),)),
              ):
              InkWell(
                onTap: (){
                  boardController.nextPage(duration: Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn);
                },
                child: Container(
                    width: 81,
                    height: 81,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(195, 253, 8, 1),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            width: 1.5, color: Color.fromRGBO(195, 253, 8, 1)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(195, 253, 8, 1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],),
                    child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,),
                    )),
              ),
            top: 700,
            left: 290,
          ),
          Positioned(
              child:  Image.asset('${model.smoothPageIndicator}',),
              // SmoothPageIndicator(controller: boardController,
              //     effect: JumpingDotEffect(
              //
              //         dotColor: Colors.grey,
              //         activeDotColor: Color.fromRGBO(195, 253, 8, 1),
              //         dotHeight: 15,
              //         //expansionFactor: 4,
              //         dotWidth: 15,
              //
              //         spacing: 20.0
              //     )
              //     ,count: boardingList.length
              // ),
            top: 730,
            left: 50,)
        ],
      );
  void subMit() {
     Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (Route<dynamic> route)=>false,);

    //     navigateAndFinish(context,
    //         ShopLoginScreen());
  }
}
