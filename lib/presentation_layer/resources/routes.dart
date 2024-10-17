import 'package:flutter/material.dart';
import 'package:yourpadel/defult_screen.dart';
import 'package:yourpadel/presentation_layer/resources/strings.dart';
import 'package:yourpadel/presentation_layer/screens/FirebaseAuth/FirebaseAuth.dart';
import 'package:yourpadel/presentation_layer/screens/Navigation_screen/Navigation_screen.dart';
import 'package:yourpadel/presentation_layer/screens/Signup_screen/signup_screen.dart';
import 'package:yourpadel/presentation_layer/screens/about_screen/CancellationPolicy_screen.dart';
import 'package:yourpadel/presentation_layer/screens/about_screen/ContactUs_screen.dart';
import 'package:yourpadel/presentation_layer/screens/about_screen/FAQ_screen.dart';
import 'package:yourpadel/presentation_layer/screens/about_screen/PrivacyPolicy_screen.dart';
import 'package:yourpadel/presentation_layer/screens/about_screen/Support.dart';
import 'package:yourpadel/presentation_layer/screens/about_screen/TermsConditions_screen.dart';
import 'package:yourpadel/presentation_layer/screens/change_password_screen/change_password_screen.dart';
import 'package:yourpadel/presentation_layer/screens/forget_password_screen/send_email_verify_code_screen.dart';
import 'package:yourpadel/presentation_layer/screens/login_screen/login_screen.dart';
import 'package:yourpadel/presentation_layer/screens/notfications_screen/notfications_screen.dart';
import 'package:yourpadel/presentation_layer/screens/on_boarding/on_boarding_screen.dart';
import 'package:yourpadel/presentation_layer/screens/profile_screen/notification_settings_screen.dart';
import 'package:yourpadel/presentation_layer/screens/profile_screen/payment_methods_screen.dart';
import 'package:yourpadel/presentation_layer/screens/profile_screen/personal_info_screen.dart';

class Routes {
  static const String authRoute = "/FirebaseAuth";
  static const String onBoardingRoute = "/on_boarding_screen";
  static const String loginRoute = "/login_screen";
  static const String forgetPasswordRoute = "/forget_password_screen";
  static const String resetNewPassRoute = "/Reset_new_password_screen";
  static const String signupRoute = "/signup_screen";
  static const String personalInfoRoute = "/personal_info_screen";
  static const String changePassRoute = "/change_password_screen";
  static const String notifySettingRoute = "/notification_settings_screen";
  static const String navigationRoute = "/Navigation_screen";
  static const String notficationsRoute = "/notfications_screen";
  static const String cancellationPolicyRoute = "/CancellationPolicy_screen";
  static const String contactUsRoute = "/ContactUs_screen";
  static const String FAQRoute = "/FAQ_screen";
  static const String privacyPolicyRoute = "/PrivacyPolicy_screen";
  static const String supportRoute = "/Support";
  static const String termsConditionsRoute = "/TermsConditions_screen";
  static const String paymentMethodRoute = "/payment_methods_screen";
  static const String sendEmailCodeRoute = "/send_email_verify_code_screen";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String defult_screenRoute = "/defult_screen";
  static const String reserveRoute = "/Reserve_screen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.authRoute:
        return MaterialPageRoute(builder: (_) => Auth());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.sendEmailCodeRoute:
        return MaterialPageRoute(builder: (_) => SendEmailCodeScreen());
           case Routes.signupRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.changePassRoute:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      case Routes.navigationRoute:
        return MaterialPageRoute(builder: (_) => NavigationScreen());
      case Routes.notficationsRoute:
        return MaterialPageRoute(builder: (_) => NotficationScreen());
      case Routes.cancellationPolicyRoute:
        return MaterialPageRoute(builder: (_) => CancellationPolicy());
      case Routes.contactUsRoute:
        return MaterialPageRoute(builder: (_) => ContactUs());
      case Routes.FAQRoute:
        return MaterialPageRoute(builder: (_) => FAQScreen());
      case Routes.privacyPolicyRoute:
        return MaterialPageRoute(builder: (_) => PrivacyPolicy());
      case Routes.supportRoute:
        return MaterialPageRoute(builder: (_) => Support());
      case Routes.termsConditionsRoute:
        return MaterialPageRoute(builder: (_) => TermsConditions());
      case Routes.defult_screenRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case Routes.personalInfoRoute:
        return MaterialPageRoute(builder: (_) => personalinfo());
      case Routes.notifySettingRoute:
        return MaterialPageRoute(builder: (_) => NotificationSettingScreen());
      case Routes.paymentMethodRoute:
        return MaterialPageRoute(builder: (_) => PaymentMethodsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
