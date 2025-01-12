// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;
  void login(BuildContext context) async{
    final authService = AuthService();
    try{
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    } catch(e){
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString()),)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Welcome back you've been missed",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          MyTextfield(
            hintText: "Email",
            obscurText: false,
            controller: _emailController,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextfield(
            hintText: "Password",
            obscurText: true,
            controller: _passwordController,
          ),
          SizedBox(
            height: 25,
          ),
          MyButton(
            text: "Login",
            onTap: () => login(context),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap:  onTap,
                child: Text(
                  "Register now",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
