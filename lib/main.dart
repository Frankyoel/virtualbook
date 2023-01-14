// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_virtual_book_g5/pages/login_page.dart';
import 'package:my_virtual_book_g5/pages/register_page.dart';
import 'package:my_virtual_book_g5/pages/wrapper.dart';
import 'package:my_virtual_book_g5/services/auth_service.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_)=> AuthService()),
      ],
      child: MaterialApp(
        title: 'VirtualBook',
        debugShowCheckedModeBanner: false,
       initialRoute: '/',
       routes: {
        '/':(context) => Wrapper(),
        '/login_page':(context) => LoginPage(),
        '/register_page':(context) => RegisterPage(),
       },
      ),
    );
  }
}