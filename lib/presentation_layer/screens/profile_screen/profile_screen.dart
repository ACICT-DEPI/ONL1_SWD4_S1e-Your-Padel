import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:share_plus/share_plus.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:provider/provider.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourpadel/presentation_layer/resources/icons_app.dart';
import 'package:yourpadel/presentation_layer/resources/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  DateTime currentDateTime = DateTime.now();

  String userFirstName = "";
  String userImage = "";
  String UserName = "";
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
              Image.asset('assets/images/background1.2.png',fit: BoxFit.cover,
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
                    'My Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(
                                  context,
                                  Routes
                                      .personalInfoRoute);
                            },
                            child: Container(
                              height:157,
                              decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(22),
                                border: Border.all(color: Color.fromRGBO(239, 239, 239, 1),width: 2)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.0,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/personal_info_icon.png',width: 64,height: 64),
                                    SizedBox(height: 15,),
                                    Container(width: 150,child: Text('Personal Information',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(
                                  context,
                                  Routes
                                      .changePassRoute);
                            },
                            child: Container(
                              height:157,
                              decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(22),
                                border: Border.all(color: Color.fromRGBO(239, 239, 239, 1),width: 2)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(left: 15.0,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/change_pass_icon.png',width: 64,height: 64),
                                    SizedBox(height: 15,),
                                    Container(child: Text('Change Password',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(
                                  context,
                                  Routes
                                      .notifySettingRoute);
                            },
                            child: Container(
                              height:157,
                              decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(22),
                                border: Border.all(color: Color.fromRGBO(239, 239, 239, 1),width: 2)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.0,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/notifiy_icon.png',width: 64,height: 64),
                                    SizedBox(height: 15,),
                                    Container(width: 150,child: Text('Notification Settings',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(
                                  context,
                                  Routes
                                      .paymentMethodRoute);
                            },
                            child: Container(
                              height:157,
                              decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(22),
                                border: Border.all(color: Color.fromRGBO(239, 239, 239, 1),width: 2)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(left: 15.0,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/payment_method_icon.png',width: 64,height: 64,),
                                    SizedBox(height: 15,),
                                    Container(child: Text('Payment Methods ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              FirebaseAuth.instance.signOut();
                              Navigator.pushNamed(
                                  context,
                                  Routes
                                      .loginRoute);
                            },
                            child: Container(
                              height:157,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(color: Color.fromRGBO(239, 239, 239, 1),width: 2)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.0,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(child: Icon(Icons.logout,size: 33,color: Colors.blue[500],),backgroundColor: Colors.grey[50]),

                                    //Image.asset('assets/images/notifiy_icon.png',width: 64.w,height: 64.h),
                                    SizedBox(height: 15,),
                                    Container(width: 150,child: Text('Logout',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),

                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         Share.share(
                    //             "padel up reservation: https://d8s5xq4qtse2n.cloudfront.net/account/auth/login?returnUrl=%2F");
                    //       },
                    //       child: Padding(
                    //         padding: const EdgeInsets.fromLTRB(25, 50, 0, 0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Color.fromRGBO(195, 253, 8, 1),
                    //             borderRadius: BorderRadius.circular(40),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.fromLTRB(25, 15, 20, 15),
                    //             child: Text(
                    //               'Share',
                    //               style: TextStyle(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w400,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         downloadSchedule(
                    //             context);
                    //       },
                    //       child: Padding(
                    //         padding: const EdgeInsets.fromLTRB(25, 50, 0, 0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Color.fromRGBO(195, 253, 8, 1),
                    //             borderRadius: BorderRadius.circular(40),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.fromLTRB(25, 15, 20, 15),
                    //             child: Text(
                    //               ' Add To Calender',
                    //               style: TextStyle(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w400,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     getLocation("30.07413093180851", "31.43287181854248");
                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.fromLTRB(25, 50, 0, 0),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         color: Color.fromRGBO(195, 253, 8, 1),
                    //         borderRadius: BorderRadius.circular(40),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.fromLTRB(25, 15, 20, 15),
                    //         child: Text(
                    //           ' Get Location',
                    //           style: TextStyle(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w400,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> getLocation(String lat, String long) async {
    String googleURL =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    await canLaunch(googleURL)
        ? await launch(googleURL)
        : throw "Could not launch $googleURL";
  }
}
