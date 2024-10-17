import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yourpadel/presentation_layer/resources/icons_app.dart';
import 'package:yourpadel/presentation_layer/resources/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final user = FirebaseAuth.instance.currentUser!;
  String userImage = "";
  String userFirstName = "";
  String postphoto = "assets/images/postphoto.png";
  String posttitle = "Your Padel";
  String postdescription =
      "Learn from the best specialists in various fields. Subscribe and learn without limits.";
  int counter = 100;
  String formattedDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/background.png',fit: BoxFit.cover,
                                width: double.infinity,),
              Positioned(
                  child: Image.asset('assets/images/front_background.png'),
                  top: 0,
                  left: 0),
              Positioned(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 60, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ConditionalBuilder(
                                      condition:
                                          userImage != null && userImage != '',
                                      builder: (context) => CircleAvatar(
                                          radius: 22.0,
                                          backgroundImage:
                                              NetworkImage(userImage)),
                                      fallback: (context) => CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: Color.fromRGBO(
                                              255, 255, 255, 179),
                                          backgroundImage: AssetImage(
                                              'assets/images/default_img.png'))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Welcome ',
                                            // ' Hi '+ user.email!,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: (18),
                                              letterSpacing: 0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                          Icon(
                                            Icons_app.hi_icon,
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 255, 214, 33),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 165,
                                  ),
                                  Row(children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                                  Routes.notficationsRoute);
                                      },
                                      child: Icon(
                                        Icons_app.notification_icon,
                                        size: 28,
                                        color: Color.fromRGBO(195, 253, 8, 1),
                                      ),
                                    )
                                  ]),
                                ],
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(37, 126, 0, 0),
                  child: Text(
                    'News',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0)),
                    color: Color.fromRGBO(245, 245, 245, 1),
                  ),
                  width: 450,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 15, 17, 0),
                        child: promoBooking(
                            Color.fromRGBO(255, 255, 255, 1),
                            posttitle,
                            postdescription,
                            postphoto,
                            576,
                            Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 15, 17, 0),
                        child: promoBooking(
                            Color.fromRGBO(255, 255, 255, 1),
                            posttitle,
                            postdescription,
                            postphoto,
                            250,
                            Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 15, 17, 0),
                        child: promoBooking(
                            Color.fromRGBO(255, 255, 255, 1),
                            posttitle,
                            postdescription,
                            postphoto,
                            10,
                            Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

Widget promoBooking(Color color, String title, String description, String photo,
    int count, Color iconColor) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Builder(
                    builder: (context) => CircleAvatar(
                        radius: 28,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 179),
                        backgroundImage:
                            AssetImage('assets/images/logo.png'))),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 90, 5),
                    child: Text(
                      "Your Padel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons_app.time_icon,
                        size: 17,
                        color: Color.fromRGBO(142, 142, 142, 1),
                      ),
                      Text(
                        // "${formattedDate}",
                        "  JAN 1.2024 , 12:00",
                        style: TextStyle(
                          color: Color.fromRGBO(142, 142, 142, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/postphoto.png",
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Learn from the best specialists in various fields. Subscribe and learn without limits.",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 0,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(250, 250, 250, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 7, 10),
                          child: Icon(Icons_app.like_icon,
                              size: 19, color: iconColor),
                        ),
                      ),
                      Text(
                        ' Like ',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '(${count})',
                        style: TextStyle(
                          color: Color.fromRGBO(142, 142, 142, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 7, 10),
                          child: Icon(
                            Icons_app.dislike_icon,
                            size: 19,
                          ),
                        ),
                      ),
                      Text(
                        'dislike ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '(${count})',
                        style: TextStyle(
                          color: Color.fromRGBO(142, 142, 142, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}