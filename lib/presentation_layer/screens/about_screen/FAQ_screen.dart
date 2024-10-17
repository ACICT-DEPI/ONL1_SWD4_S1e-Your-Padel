import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  _FAQScreen createState() => _FAQScreen();
}

class _FAQScreen extends State<FAQScreen> {
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
                        child:
                            Image.asset('assets/images/front_background.png'),
                        top: 0,
                        left: 0,
                      ),
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor:
                                Color.fromRGBO(255, 255, 255, 0.31),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        top: 57,
                        left: 22,
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 120, 0, 0),
                          child: Text(
                            'FAQ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            ),
                            color: Color.fromRGBO(245, 245, 245, 1),
                          ),
                          width: 450,
                          height: 647.2856,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                  child: GFAccordion(
                                      titleBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      contentBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      title:
                                          'title',
                                      collapsedIcon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      expandedIcon: Icon(
                                          Icons.keyboard_arrow_right,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      content:
                                          'description'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: GFAccordion(
                                      titleBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      contentBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      title: 'title',
                                      collapsedIcon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      expandedIcon: Icon(
                                          Icons.keyboard_arrow_right,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      content:
                                          'description'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: GFAccordion(
                                      titleBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      contentBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      title: 'title',
                                      collapsedIcon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      expandedIcon: Icon(
                                          Icons.keyboard_arrow_right,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      content:
                                          'description'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: GFAccordion(
                                      titleBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      contentBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      title: 'title',
                                      collapsedIcon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      expandedIcon: Icon(
                                          Icons.keyboard_arrow_right,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      content:
                                          'description'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: GFAccordion(
                                      titleBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      contentBorderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      title: 'title',
                                      collapsedIcon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      expandedIcon: Icon(
                                          Icons.keyboard_arrow_right,
                                          color:
                                              Color.fromRGBO(34, 99, 227, 1)),
                                      content:
                                          'description'),
                                ),
                              ],
                            ),
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
