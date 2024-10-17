import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:yourpadel/presentation_layer/resources/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool isPassword = false;
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  Future sginIn () async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword
    (email: emailController.text.trim(), password: passController.text.trim());
    Navigator.pushNamed(
                                  context,
                                  Routes
                                      .navigationRoute);
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
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }


  @override
  Widget build(BuildContext context) {
            return Scaffold(
              key: _scaffoldKey,
              body: StreamBuilder(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
                  print('snapshot ${snapshot.toString()}');
                  if (snapshot.hasData) {
                    ConnectivityResult? result = snapshot.data;
                    if (result == ConnectivityResult.wifi ||
                        result == ConnectivityResult.mobile) {
                      return SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/background.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
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
                                  height: 932,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 23),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 31),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Login to your ',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color.fromRGBO(
                                                        10, 15, 26, 1)),
                                              ),
                                              Text(
                                                'account',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color.fromRGBO(
                                                        34, 99, 227, 1)),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Form(
                                          key: formKey,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: emailController,
                                                keyboardType:
                                                  TextInputType.emailAddress,
                                                cursorColor: Colors.grey,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'please enter your Email';
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.email_outlined,
                                                      color: Color.fromRGBO(
                                                          181, 181, 181, 1),
                                                    ),
                                                    border:
                                                        UnderlineInputBorder(),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            241,
                                                                            241,
                                                                            241,
                                                                            1),
                                                                    width:
                                                                        2)),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        2)),
                                                    labelText: "Email",
                                                    labelStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            181, 181, 181, 1))),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                controller: passController,
                                                cursorColor: Colors.grey,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'please enter your Password';
                                                  }
                                                },
                                                obscureText:
                                                    !isPassword, //This will obscure text dynamically
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.lock_open_sharp,
                                                      color: Color.fromRGBO(
                                                          181, 181, 181, 1),
                                                    ),
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        // Based on passwordVisible state choose the icon
                                                        isPassword
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                      ),
                                                      onPressed: () {
                                                        // Update the state i.e. toogle the state of passwordVisible variable
                                                        setState(() {
                                                          isPassword =
                                                              !isPassword;
                                                        });
                                                      },
                                                    ),
                                                    border:
                                                        UnderlineInputBorder(),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            241,
                                                                            241,
                                                                            241,
                                                                            1),
                                                                    width:
                                                                        2)),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        2)),
                                                    labelText: "Password",
                                                    labelStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            181, 181, 181, 1))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          child: InkWell(
                                            onTap: () {
                                              print(
                                                  'test ${emailController.text}');
                                              Navigator.pushNamed(context,
                                                  Routes.sendEmailCodeRoute);
                                            },
                                            child: Text(
                                              'Forget Password ?',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      10, 15, 26, 1)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 383,
                                          height: 60,
                                          child: GestureDetector(
          onTap: sginIn,
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
                padding: const EdgeInsets.fromLTRB(145,0,0,0),
                child: Text(
                  "Login",
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
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Divider(
                                                  color: Color.fromRGBO(
                                                      244, 244, 244, 1),
                                                  thickness: 2),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              'Or',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      10, 15, 26, 1),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Divider(
                                                  color: Color.fromRGBO(
                                                      244, 244, 244, 1),
                                                  thickness: 2),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Don’t have account ? ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      181, 181, 181, 1)),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    Routes.signupRoute);
                                              },
                                              child: Text(
                                                'Create New account',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return buildMissConnection();
                    }
                  } else {
                    return SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/background.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
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
                                height: 932,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 23),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 31),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Login to your ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                      10, 15, 26, 1)),
                                            ),
                                            Text(
                                              'account',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                      34, 99, 227, 1)),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: emailController,
                                              cursorColor: Colors.grey,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'please enter your Email';
                                                }
                                              },
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.email_outlined,
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1),
                                                  ),
                                                  border:
                                                      UnderlineInputBorder(),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          241,
                                                                          241,
                                                                          241,
                                                                          1),
                                                                  width: 2)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 2)),
                                                  labelText: "Email",
                                                  labelStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          181, 181, 181, 1))),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              controller: passController,
                                              cursorColor: Colors.grey,
                                              // validator: (value) {
                                              //   if (value!.isEmpty) {
                                              //     return 'please enter your Password';
                                              //   }
                                              // },
                                              obscureText:
                                                  isPassword, //This will obscure text dynamically
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.lock_open_sharp,
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1),
                                                  ),
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      // Based on passwordVisible state choose the icon
                                                      !isPassword
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                    ),
                                                    onPressed: () {
                                                      // Update the state i.e. toogle the state of passwordVisible variable
                                                      setState(() {
                                                        isPassword =
                                                            !isPassword;
                                                      });
                                                    },
                                                  ),
                                                  border:
                                                      UnderlineInputBorder(),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          241,
                                                                          241,
                                                                          241,
                                                                          1),
                                                                  width: 2)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 2)),
                                                  labelText: "Password",
                                                  labelStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          181, 181, 181, 1))),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: InkWell(
                                          onTap: () {
                                            print(
                                                'test ${emailController.text}');
                                            Navigator.pushNamed(context,
                                                Routes.sendEmailCodeRoute);
                                          },
                                          child: Text(
                                            'Forget Password ?',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    10, 15, 26, 1)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 383,
                                        height: 60,
                                        child: GestureDetector(
          onTap: sginIn,
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
                padding: const EdgeInsets.fromLTRB(145,0,0,0),
                child: Text(
                  "Login",
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
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                                color: Color.fromRGBO(
                                                    244, 244, 244, 1),
                                                thickness: 2),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'Or',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    10, 15, 26, 1),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Divider(
                                                color: Color.fromRGBO(
                                                    244, 244, 244, 1),
                                                thickness: 2),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Don’t have account ? ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    181, 181, 181, 1)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, Routes.signupRoute);
                                            },
                                            child: Text(
                                              'Create New account',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            );
  }

  Future buildBottomSheet() => showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          width: 430,
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Failed to connect to Your Padel , please check your device’s network connection.',
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
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
                                  'Failed to connect to Your Padel , please check your device’s network connection.',
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
