import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final void Function()? onTap;
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Password don't match!"),
          ));
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
            "Let's create an account for you",
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
            height: 10,
          ),
          MyTextfield(
            hintText: "Confirm Password",
            obscurText: true,
            controller: _confirmPasswordController,
          ),
          SizedBox(
            height: 25,
          ),
          MyButton(
            text: "Register",
            onTap: () => register(context),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already a member? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
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
