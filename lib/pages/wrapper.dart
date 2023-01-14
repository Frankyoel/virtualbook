// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_virtual_book_g5/models/model_user.dart';
import 'package:my_virtual_book_g5/pages/home_page.dart';
import 'package:my_virtual_book_g5/pages/login_page.dart';
import 'package:my_virtual_book_g5/services/auth_service.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? LoginPage() : HomePage();
          } else {
            return Scaffold(
              backgroundColor: Colors.greenAccent,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}