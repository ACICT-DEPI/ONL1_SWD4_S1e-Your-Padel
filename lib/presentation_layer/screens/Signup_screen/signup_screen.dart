import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:yourpadel/presentation_layer/resources/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  TextEditingController firstName_Controller=TextEditingController();
  TextEditingController lastName_Controller=TextEditingController();
  TextEditingController userName_Controller=TextEditingController();
  TextEditingController phoneNumber_Controller=TextEditingController();
  TextEditingController email_Controller=TextEditingController();
  TextEditingController password_Controller=TextEditingController();
  TextEditingController confirmPassword_Controller=TextEditingController();
  String? signupGender;
  String? countryNameSignup;
  String? countryCodeSignup;
  String? dialCodeSignup;
  bool isPassword = false;
  bool isRePassword = false;
  String? message;
  var formKey = GlobalKey<FormState>();
  Future sginUp () async{
    try {
      if (passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword
    (email: email_Controller.text.trim(), password: password_Controller.text.trim());
    Navigator.pushNamed(
                                  context,
                                  Routes
                                      .loginRoute);
    }
    } on FirebaseAuthException catch (e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
    
  }
  bool passwordConfirmed() {
    if (password_Controller.text.trim() == confirmPassword_Controller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
  @override
  void dispose() {
    super.dispose();
    email_Controller.dispose();
    password_Controller.dispose();
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
                                    'assets/images/background.png',
                                    fit: BoxFit.cover,
                                width: double.infinity,),
                                Positioned(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      radius: 25.0,
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
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  top: 129,
                                  left: 22,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 203.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40)),
                                      color: Colors.white,
                                    ),
                                    height: 1000,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 23),
                                      child: SingleChildScrollView(
                                        physics: NeverScrollableScrollPhysics(),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 31),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Welcome To ',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                            10, 15, 26, 1)),
                                                  ),
                                                  Text(
                                                    'Your Padel',
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
                                              height: 10,
                                            ),
                                            Form(
                                              key: formKey,
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    controller: firstName_Controller,
                                                    cursorColor: Colors.grey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'please enter your First Name';
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        prefixIcon: Icon(
                                                          Icons.person_2_outlined,
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1),
                                                          size: 30,
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
                                                        labelText: "First Name",
                                                        labelStyle: TextStyle(
                                                            color: Color.fromRGBO(
                                                                181, 181, 181, 1))),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    controller: lastName_Controller,
                                                    cursorColor: Colors.grey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'please enter your Last Name';
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        prefixIcon: Icon(
                                                          Icons.person_2_outlined,
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1),
                                                          size: 30,
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
                                                        labelText: "Last Name",
                                                        labelStyle: TextStyle(
                                                            color: Color.fromRGBO(
                                                                181, 181, 181, 1))),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    controller: userName_Controller,
                                                    cursorColor: Colors.grey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'please enter your usernameayamo';
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        prefixIcon: Icon(
                                                          Icons.person_2_outlined,
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1),
                                                          size: 30,
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
                                                        labelText: "username",
                                                        labelStyle: TextStyle(
                                                            color: Color.fromRGBO(
                                                                181, 181, 181, 1))),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    controller: email_Controller,
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
                                                          size: 30,
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
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                          'assets/images/phoneicon.png'),
                                                      CountryCodePicker(
                                                        padding: EdgeInsets.zero,
                                                        onChanged: (element) {
                                                          countryNameSignup =
                                                              element.name;
                                                          print(
                                                              'test ${element.name}');
                                                          countryCodeSignup =
                                                              element.code;
                                                          print(
                                                              'test ${element.code}');
                                                          dialCodeSignup =
                                                              element.dialCode;
                                                          print(
                                                              'test ${element.dialCode}');
                                                        },
                                                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                                        initialSelection: 'EG',
                                                        favorite: ['+20', 'Egypt'],
                                                        // optional. Shows only country name and flag
                                                        showCountryOnly: false,
                                                        // optional. Shows only country name and flag when popup is closed.
                                                        showOnlyCountryWhenClosed:
                                                        false,
                                                        // optional. aligns the flag and the Text left
                                                        alignLeft: false,
                                                        // countryList: codes.where((element) => countryList!.contains(element)).toList() ,
                                                        // hideSearch: true,
                                                      ),
                                                      Expanded(
                                                        child: TextFormField(
                                                          controller:
                                                          phoneNumber_Controller,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          keyboardType:
                                                          TextInputType.phone,
                                                          validator: (value) {
                                                            if (value!.isEmpty) {
                                                              return 'please enter your Phone Number';
                                                            }
                                                          },
                                                          decoration: InputDecoration(
                                                            hintText:
                                                            '  Phone Number',
                                                            hintStyle: TextStyle(
                                                                color: Color.fromRGBO(
                                                                    181,
                                                                    181,
                                                                    181,
                                                                    1)),
                                                            border: InputBorder.none,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    controller: password_Controller,
                                                    keyboardType:
                                                    TextInputType.visiblePassword,
                                                    cursorColor: Colors.grey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'please enter The Password';
                                                      }
                                                    },
                                                    obscureText:
                                                    !isPassword, //This will obscure text dynamically
                                                    decoration: InputDecoration(
                                                        prefixIcon: Icon(
                                                          Icons.lock_open_sharp,
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1),
                                                          size: 30,
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
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                    confirmPassword_Controller,
                                                    cursorColor: Colors.grey,
                                                    keyboardType:
                                                    TextInputType.visiblePassword,
                                                    obscureText:
                                                    isRePassword, //This will obscure text dynamically
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'please enter Password Again';
                                                        }
                                                        if(value != password_Controller.text)
                                                        {
                                                          return 'confirm password Not Match';
                                                        }
                                                      },
                                                    decoration: InputDecoration(
                                                        prefixIcon: Icon(
                                                          Icons.lock_open_sharp,
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1),
                                                          size: 30,
                                                        ),
                                                        suffixIcon: IconButton(
                                                          icon: Icon(
                                                            // Based on passwordVisible state choose the icon
                                                            isRePassword
                                                                ? Icons
                                                                .visibility_outlined
                                                                : Icons
                                                                .visibility_off_outlined,
                                                          ),
                                                          onPressed: () {
                                                            // Update the state i.e. toogle the state of passwordVisible variable
                                                            setState(() {
                                                              isRePassword =
                                                              !isRePassword;
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
                                                        hintText: "Confirm Password",
                                                        hintStyle: TextStyle(
                                                            color: Color.fromRGBO(
                                                                181, 181, 181, 1))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            SizedBox(
                                              width: 383,
                                              height: 60,
                                              child: GestureDetector(
          onTap: sginUp,
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
                  "Sign Up",
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
                                              height: 30,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Already have account ? ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color.fromRGBO(
                                                          181, 181, 181, 1)),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                        context, Routes.loginRoute);
                                                  },
                                                  child: Text(
                                                    'Login',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
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
                                    radius: 25.0,
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
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                top: 129,
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
                                  height: 800,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 23),
                                    child: SingleChildScrollView(
                                      physics: NeverScrollableScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 31),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Welcome To ',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w700,
                                                      color: Color.fromRGBO(
                                                          10, 15, 26, 1)),
                                                ),
                                                Text(
                                                  'Your Padel',
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
                                            height: 10,
                                          ),
                                          Form(
                                            key: formKey,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: firstName_Controller,
                                                  cursorColor: Colors.grey,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'please enter your First Name';
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        Icons.person_2_outlined,
                                                        color: Color.fromRGBO(
                                                            181, 181, 181, 1),
                                                        size: 30,
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
                                                      labelText: "First Name",
                                                      labelStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1))),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller: lastName_Controller,
                                                  cursorColor: Colors.grey,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'please enter your Last Name';
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        Icons.person_2_outlined,
                                                        color: Color.fromRGBO(
                                                            181, 181, 181, 1),
                                                        size: 30,
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
                                                      labelText: "Last Name",
                                                      labelStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1))),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller: userName_Controller,
                                                  cursorColor: Colors.grey,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'please enter your username';
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        Icons.person_2_outlined,
                                                        color: Color.fromRGBO(
                                                            181, 181, 181, 1),
                                                        size: 30,
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
                                                      labelText: "username",
                                                      labelStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1))),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller: email_Controller,
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
                                                        size: 30,
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
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/phoneicon.png'),
                                                    CountryCodePicker(
                                                      padding: EdgeInsets.zero,
                                                      onChanged: (element) {
                                                        countryNameSignup =
                                                            element.name;
                                                        print(
                                                            'test ${element.name}');
                                                        countryCodeSignup =
                                                            element.code;
                                                        print(
                                                            'test ${element.code}');
                                                        dialCodeSignup =
                                                            element.dialCode;
                                                        print(
                                                            'test ${element.dialCode}');
                                                      },
                                                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                                      initialSelection: 'EG',
                                                      favorite: ['+20', 'Egypt'],
                                                      // optional. Shows only country name and flag
                                                      showCountryOnly: false,
                                                      // optional. Shows only country name and flag when popup is closed.
                                                      showOnlyCountryWhenClosed:
                                                      false,
                                                      // optional. aligns the flag and the Text left
                                                      alignLeft: false,
                                                      // countryList: codes.where((element) => countryList!.contains(element)).toList() ,
                                                      // hideSearch: true,
                                                    ),
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller:
                                                        phoneNumber_Controller,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        keyboardType:
                                                        TextInputType.phone,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'please enter your Phone Number';
                                                          }
                                                        },
                                                        decoration: InputDecoration(
                                                          hintText:
                                                          '  Phone Number',
                                                          hintStyle: TextStyle(
                                                              color: Color.fromRGBO(
                                                                  181,
                                                                  181,
                                                                  181,
                                                                  1)),
                                                          border: InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller: password_Controller,
                                                  keyboardType:
                                                  TextInputType.visiblePassword,
                                                  cursorColor: Colors.grey,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'please enter The Password';
                                                    }
                                                  },
                                                  obscureText:
                                                  !isPassword, //This will obscure text dynamically
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        Icons.lock_open_sharp,
                                                        color: Color.fromRGBO(
                                                            181, 181, 181, 1),
                                                        size: 30,
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
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller:
                                                  confirmPassword_Controller,
                                                  cursorColor: Colors.grey,
                                                  keyboardType:
                                                  TextInputType.visiblePassword,
                                                  obscureText:
                                                  !isRePassword,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'please enter Password Again';
                                                    }
                                                    if(value != password_Controller.text)
                                                      {
                                                        return 'confirm password Not Match';
                                                      }
                                                  },//This will obscure text dynamically
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        Icons.lock_open_sharp,
                                                        color: Color.fromRGBO(
                                                            181, 181, 181, 1),
                                                        size: 30,
                                                      ),
                                                      suffixIcon: IconButton(
                                                        icon: Icon(
                                                          // Based on passwordVisible state choose the icon
                                                          isRePassword
                                                              ? Icons
                                                              .visibility_outlined
                                                              : Icons
                                                              .visibility_off_outlined,
                                                        ),

                                                        onPressed: () {
                                                          // Update the state i.e. toogle the state of passwordVisible variable
                                                          setState(() {
                                                            isRePassword =
                                                            !isRePassword;
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
                                                      hintText: "Confirm Password",
                                                      hintStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              181, 181, 181, 1))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 383,
                                            height: 60,
                                            child: GestureDetector(
          onTap: sginUp,
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
                  "Sign Up",
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
                                            height: 30,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Already have account ? ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, Routes.loginRoute);
                                                },
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1)),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                        ],
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
                        'Failed to connect to Padel Up Mirage City , please check your device’s network connection.',
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
                                  'Failed to connect to Your Padel  , please check your device’s network connection.',
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
