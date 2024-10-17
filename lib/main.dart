import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yourpadel/presentation_layer/resources/routes.dart';
import 'package:yourpadel/presentation_layer/screens/FirebaseAuth/FirebaseAuth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Auth(),
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}