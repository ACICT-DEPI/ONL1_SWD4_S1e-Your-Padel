import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
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
                      'Terms & Conditions',
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
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    width: 450,
                    height: 647.2856,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(33, 22, 32, 0),
                            child: Text(
                              'this is a Terms & Conditions screen',
                              style: TextStyle(
                                  color: Color.fromRGBO(142, 142, 142, 1),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600),
                            ),
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
