import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:yourpadel/presentation_layer/resources/icons_app.dart';
import 'package:yourpadel/presentation_layer/resources/routes.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  String userImage = "";
  String userFirstName = "";
  String UserName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                    padding:  EdgeInsets.fromLTRB(37, 126, 0, 0),
                    child: Text(
                      'About',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(0, 190, 0, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                      ),
                      color: Colors.white,
                    ),
                    width: 450,
                    height: 627.2856,
                    child: Column(
                      children: [
                        promoBooking(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget promoBooking(context) {
  return Padding(
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
                          .privacyPolicyRoute);
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 90, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 248, 255, 1),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            width: 70,
                            height: 70,
                            child: Icon(
                              Icons_app.privacypolicy_icon,
                              size: 28,
                              color: Color.fromRGBO(34, 99, 227, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(width: 150,child: Text('Privacy Policy',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
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
                          .termsConditionsRoute);
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 90, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 248, 255, 1),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            width: 70,
                            height: 70,
                            child: Icon(
                              Icons_app.terms_conditions_icon,
                              size: 28,
                              color: Color.fromRGBO(34, 99, 227, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(child: Text('Terms & Conditions',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
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
                          .cancellationPolicyRoute);
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 90, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 248, 255, 1),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            width: 70,
                            height: 70,
                            child: Icon(
                              Icons_app.cancellation_policy_icon,
                              size: 28,
                              color: Color.fromRGBO(34, 99, 227, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(child: Text('Cancellation Policy',
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
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
                          .FAQRoute);
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 90, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 248, 255, 1),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            width: 70,
                            height: 70,
                            child: Icon(
                              Icons_app.faq_icon,
                              size: 28,
                              color: Color.fromRGBO(34, 99, 227, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(child: Text('FAQ',
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
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
                          .contactUsRoute);
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 90, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 248, 255, 1),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            width: 70,
                            height: 70,
                            child: Icon(
                              Icons_app.contact_us_icon,
                              size: 28,
                              color: Color.fromRGBO(34, 99, 227, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(child: Text('Contact Us',
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
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
                          .supportRoute);
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 90, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 248, 255, 1),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            width: 70,
                            height: 70,
                            child: Icon(
                              Icons_app.support_icon,
                              size: 28,
                              color: Color.fromRGBO(34, 99, 227, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(child: Text('Support',
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color.fromRGBO(10, 15, 26, 1)),maxLines: 2,)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

      ],
    ),
  );
}
