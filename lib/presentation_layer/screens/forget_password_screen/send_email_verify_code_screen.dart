import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendEmailCodeScreen extends StatefulWidget {
  const SendEmailCodeScreen({Key? key}) : super(key: key);

  @override
  State<SendEmailCodeScreen> createState() => _SendEmailCodeScreen();
}

class _SendEmailCodeScreen extends State<SendEmailCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text("password reset link send! Check your email"),
        );
      });
    } on FirebaseAuthException catch (e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
            return Scaffold(
              body: StreamBuilder(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
                  print('snapshot ${snapshot.toString()}');
                  if (snapshot.hasData) {
                    ConnectivityResult? result = snapshot.data;
                    if (result == ConnectivityResult.wifi ||
                        result == ConnectivityResult.mobile) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                    'assets/images/background.png'
                                    ,fit: BoxFit.cover,
                                width: double.infinity,),
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
                                        padding: EdgeInsets.only(right: 2.0),
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
                                  child: SizedBox(
                                    height: 65,
                                    width: 229,
                                    child: Text(
                                      'Forget Password ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          height: 1.5,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  top: 139,
                                  left: 22,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 240.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40)),
                                      color: Colors.white,
                                    ),
                                    height: 600,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 23),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 50),
                                            Image.asset(
                                                'assets/images/forgetpass_img.png'),
                                            SizedBox(height: 10,),
                                            Form(
                                              key: _formKey,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        2, 0, 30, 0),
                                                    child: Text(
                                                      'Did you forget your password?',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'WE will send a recovery code to your email so you can reset your password',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Container(
                                                    height:60,
                                                    width:500,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.1),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.fromLTRB(
                                                        6,
                                                        0,
                                                        0,
                                                        0,
                                                      ),
                                                      child: TextFormField(
                                                        controller:
                                                        emailController,
                                                        keyboardType: TextInputType.emailAddress,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'please enter your Email';
                                                          }
                                                        },
                                                        decoration:
                                                        InputDecoration(
                                                          hintText:
                                                          'Email Address',
                                                          prefixIcon: Icon(
                                                            Icons.email_outlined,
                                                            color: Color.fromRGBO(
                                                                181, 181, 181, 1),
                                                            size: 30,
                                                          ),
                                                          border:
                                                          InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 40),
                                            SizedBox(
                                              width: 383,
                                              height: 60,
                                              child: GestureDetector(
          onTap: passwordReset,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  spreadRadius: 6.0,
                  // other shadow properties...
                ),
              ],
              borderRadius: BorderRadius.circular(100),
              color: Color.fromRGBO(195, 253, 8, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(125,0,0,0),
                child: Text(
                  "Send Code",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    } else {
                      return buildMissConnection();
                    }
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                  'assets/images/background.png',
                                  fit: BoxFit.cover,
                                width: double.infinity,),
                          
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
                                      padding: EdgeInsets.only(right: 2.0),
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
                                child: SizedBox(
                                  height: 65,
                                  width: 229,
                                  child: Text(
                                    'Forget Password ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: 1.5,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                top: 139,
                                left: 22,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 240.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        topLeft: Radius.circular(40)),
                                    color: Colors.white,
                                  ),
                                  height: 600,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 23),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 50),
                                          Image.asset(
                                              'assets/images/forgetpass_img.png'),
                                          SizedBox(height: 10,),
                                          Form(
                                            key: _formKey,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.fromLTRB(
                                                      2, 0, 30, 0),
                                                  child: Text(
                                                    'Did you forget your password?',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'WE will send a recovery code to your email so you can reset your password',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(height: 30),
                                                Container(
                                                  height: 60,
                                                  width: 500,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                      6,
                                                      0,
                                                      0,
                                                      0,
                                                    ),
                                                    child: TextFormField(
                                                      controller:
                                                      emailController,
                                                      keyboardType: TextInputType.emailAddress,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'please enter your Email';
                                                        }
                                                      },
                                                      decoration:
                                                      InputDecoration(
                                                        hintText:
                                                        'Email Address',

                                                        prefixIcon: Icon(
                                                          Icons.email_outlined,
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1),
                                                          size: 30,
                                                        ),
                                                        border:
                                                        InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          SizedBox(
                                            width: 383,
                                            height: 60,
                                            child: GestureDetector(
          onTap: passwordReset,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  spreadRadius: 6.0,
                  // other shadow properties...
                ),
              ],
              borderRadius: BorderRadius.circular(100),
              color: Color.fromRGBO(195, 253, 8, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(125,0,0,0),
                child: Text(
                  "Send Code",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            );
  }

  Widget buildMissConnection() => SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/background.png'),
                Image.asset('assets/images/background_color.png'),
                Positioned(
                    child: Image.asset('assets/images/racket.png'),
                    top: 66,
                    left: 189.27),
                Positioned(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.31),
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
                Padding(
                  padding: const EdgeInsets.only(top: 130.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    height: 702,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/miss_connection.png'),
                              Text(
                                'No internet connection',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'Failed to connect to Your Padel, please check your device’s network connection.',
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
