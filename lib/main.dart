import 'package:chat_now/screens/add_room_screen/add_room_screen.dart';
import 'package:chat_now/screens/home_screen/home_screen.dart';
import 'package:chat_now/screens/login_screen/login.dart';
import 'package:chat_now/my_themes/my_themes.dart';
import 'package:chat_now/screens/register_screen/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: LoginScreen.routeName,
      routes: {
        RegisterScreen.routeName : (_)=>RegisterScreen(),
        LoginScreen.routeName : (_)=>LoginScreen(),
        HomeScreen.routeName : (_)=>HomeScreen(),
        AddRoomScreen.routeName : (_)=>AddRoomScreen(),

      },
    );
  }
}

